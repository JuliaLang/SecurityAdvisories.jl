# Advisory Workflow

This page documents the complete workflow for security advisories in the Julia ecosystem, from initial discovery through publication and distribution.

## Overview

The Julia Security Advisory Database follows a multi-stage workflow to ensure accuracy, completeness, and timely publication of security information. The workflow involves both automated systems and human review to balance efficiency with quality.

```@raw html
<div class="diagram-legend">
    <div class="diagram-legend-item">
        <div class="legend-color legend-automated"></div>
        <span>Automated (GitHub Actions, scripts)</span>
    </div>
    <div class="diagram-legend-item">
        <div class="legend-color legend-manual"></div>
        <span>Manual (human review)</span>
    </div>
    <div class="diagram-legend-item">
        <div class="legend-color legend-external"></div>
        <span>External (NVD, EUVD, osv.dev)</span>
    </div>
    <div class="diagram-legend-item">
        <div class="legend-color legend-private"></div>
        <span>Private (confidential disclosure)</span>
    </div>
</div>
```

## Complete Advisory Lifecycle

The following diagram shows the end-to-end flow of a security advisory from discovery to distribution.

```mermaid
graph TD
    subgraph Sources["Data Sources"]
        NVD["NVD<br/>(NIST)"]
        EUVD["EUVD<br/>(EU)"]
        GHSA["GitHub<br/>GHSA"]
    end

    subgraph Private["Private Disclosure"]
        Report["Private Report<br/>to JLSEC"]
        Coordinate["Coordinate<br/>with Maintainer"]
        Fix["Patch<br/>Developed"]
    end

    subgraph Discovery["Automated Discovery"]
        Search["Daily Search<br/>(3 AM UTC)"]
        Match["Match to<br/>Julia Packages"]
        PR["Create PR<br/>(internal)"]
    end

    subgraph Review["Human Review"]
        Check["Review &<br/>Approve"]
        Merge["Merge to<br/>main"]
    end

    subgraph Processing["Post-Merge"]
        ID["Assign<br/>JLSEC ID"]
        Export["Export<br/>OSV JSON"]
        Validate["Validate<br/>Schema"]
    end

    subgraph Publication["Distribution"]
        Docs["Update<br/>Documentation"]
        OSV["Push to<br/>osv.dev"]
    end

    NVD --> Search
    EUVD --> Search
    GHSA --> Search
    Report --> Coordinate
    Coordinate --> Fix
    Fix --> PR
    Search --> Match
    Match --> PR
    PR --> Check
    Check --> Merge
    Merge --> ID
    ID --> Export
    Export --> Validate
    Validate --> Docs
    Validate --> OSV

    classDef external fill:#f3e5f5,stroke:#7b1fa2
    classDef automated fill:#e1f5fe,stroke:#0288d1
    classDef manual fill:#fff3e0,stroke:#f57c00
    classDef private fill:#ffcdd2,stroke:#c62828

    class NVD,EUVD,GHSA,OSV external
    class Search,Match,PR,ID,Export,Validate,Docs automated
    class Check,Merge manual
    class Report,Coordinate,Fix private
```

### Stage Descriptions

1. **Data Sources**: Vulnerabilities are discovered from multiple sources:
   - **NVD (NIST)**: National Vulnerability Database with structured CPE data
   - **EUVD (EU)**: European Union Vulnerability Database with faster updates
   - **GitHub GHSA**: Security advisories published on Julia package repositories

2. **Private Disclosure**: New vulnerabilities MUST be reported privately first:
   - Contact the JLSEC team or package maintainer through private channels
   - Coordinate disclosure timeline to allow patch development
   - Advisory is only created after a fix is available or disclosure deadline is reached

3. **Automated Discovery**: A daily scheduled job queries upstream databases and matches vulnerabilities against packages in the Julia General registry.

4. **Human Review**: All advisories require human review before publication to ensure accuracy of affected packages and version ranges.

5. **Post-Merge Processing**: After merge, automated systems assign unique JLSEC IDs, extract timestamps from git history, and export to OSV format.

6. **Distribution**: Advisories are published to this documentation site and the `generated/osv` branch for consumption by osv.dev and security scanning tools.

---

## Automated Discovery Process

The automated discovery system runs daily to find new vulnerabilities affecting Julia packages.

```mermaid
graph LR
    subgraph Trigger["Trigger"]
        Cron["Daily Cron<br/>3 AM UTC"]
        Manual["Manual<br/>Dispatch"]
    end

    subgraph APIs["API Queries"]
        NVD["Query NVD"]
        EUVD["Query EUVD"]
        GH["Query GitHub"]
    end

    subgraph Matching["Package Matching"]
        Registry["Julia General<br/>Registry"]
        JLL["JLL Component<br/>Mapping"]
    end

    subgraph Output["Output"]
        Categorize["Categorize<br/>Results"]
        CreatePR["Create PR<br/>via jlsec-bot"]
    end

    Cron --> NVD
    Cron --> EUVD
    Cron --> GH
    Manual --> NVD
    Manual --> EUVD
    Manual --> GH
    NVD --> Registry
    EUVD --> Registry
    GH --> Registry
    Registry --> JLL
    JLL --> Categorize
    Categorize --> CreatePR

    classDef trigger fill:#e8f5e9,stroke:#388e3c
    classDef api fill:#f3e5f5,stroke:#7b1fa2
    classDef match fill:#e1f5fe,stroke:#0288d1
    classDef output fill:#fff3e0,stroke:#f57c00

    class Cron,Manual trigger
    class NVD,EUVD,GH api
    class Registry,JLL match
    class Categorize,CreatePR output
```

### How Discovery Works

1. **Trigger**: The workflow runs automatically every day at 3 AM UTC, or can be triggered manually for specific vulnerability IDs.

2. **API Queries**: The system queries three upstream databases:
   - **NVD API**: Searches for CVEs with Julia-related CPE entries
   - **EUVD API**: Searches for vulnerabilities by vendor/product
   - **GitHub API**: Queries for published GHSAs on Julia package repositories

3. **Package Matching**: Results are matched against the Julia General registry:
   - Native Julia packages are matched by name
   - JLL packages (binary wrappers) are matched via [GeneralMetadata.jl](https://github.com/JuliaPackaging/GeneralMetadata.jl) component tracking

4. **Output**: Matched advisories are categorized by data quality and a pull request is automatically created by jlsec-bot with detailed analysis.

---

## Reporting Vulnerabilities

!!! warning "Private Disclosure Required"
    **Never report vulnerabilities through public channels** (issues, public PRs, forums).
    This exposes users to attacks before a fix is available.

```mermaid
graph TD
    Start["Vulnerability<br/>Discovered"] --> Decision{"Package you<br/>maintain?"}

    Decision -->|"Yes"| PathA["Create Draft GHSA<br/>(private)"]
    Decision -->|"No"| PathB["Report via GitHub<br/>Private Reporting"]

    PathA --> Develop["Develop<br/>Patch"]
    PathB --> Wait{"Enabled on<br/>repository?"}

    Wait -->|"Yes"| GHReport["Submit Private<br/>Vulnerability Report"]
    Wait -->|"No"| Escalate["Contact JLSEC<br/>Team"]

    GHReport --> MaintainerGHSA["Maintainer Creates<br/>Draft GHSA"]
    MaintainerGHSA --> Develop
    Escalate --> JLSECCoord["JLSEC Contacts<br/>Maintainer"]
    JLSECCoord --> MaintainerGHSA

    Develop --> Publish["Publish GHSA<br/>with Fix"]

    Publish --> AutoImport["Automated<br/>Import"]
    AutoImport --> JLSEC["JLSEC<br/>Advisory"]

    classDef warning fill:#ffcdd2,stroke:#c62828
    classDef ghsa fill:#c8e6c9,stroke:#2e7d32
    classDef coordinate fill:#e1f5fe,stroke:#0288d1
    classDef escalate fill:#fff3e0,stroke:#f57c00

    class Start,Decision,Wait warning
    class PathA,PathB,GHReport,MaintainerGHSA,Publish ghsa
    class Develop,AutoImport,JLSEC coordinate
    class Escalate,JLSECCoord escalate
```

### Reporting Process

**GitHub Security Advisories (GHSA) is the preferred method** for all vulnerability reports. It provides:
- Private, secure communication
- Structured vulnerability information
- Built-in coordination tools
- Automatic CVE assignment capability
- Direct integration with JLSEC automated import

**If you maintain the affected package:**

1. **Create a draft GitHub Security Advisory** on your repository (this is private)
2. Develop and test a fix
3. Coordinate disclosure timing (typically with the fix release)
4. Publish the GHSA when the patched version is released
5. JLSEC will automatically import the advisory within 24 hours

**If you found a vulnerability in someone else's package:**

1. **Use GitHub's Private Vulnerability Reporting** (preferred):
   - Go to the repository's Security tab
   - Click "Report a vulnerability"
   - This creates a private report visible only to maintainers
   - See [GitHub docs](https://docs.github.com/en/code-security/security-advisories/guidance-on-reporting-and-writing-information-about-vulnerabilities/privately-reporting-a-security-vulnerability)

2. **If private reporting is not enabled**, contact the JLSEC team:
   - Email: security@julialang.org
   - The JLSEC team will coordinate with the maintainer

!!! tip "For Package Maintainers"
    Enable **Private Vulnerability Reporting** on your repository to receive
    security reports directly through GitHub. Go to Settings → Security →
    "Private vulnerability reporting" and enable it.

!!! note "No Public PRs for New Vulnerabilities"
    The SecurityAdvisories.jl repository only accepts PRs for advisories that have
    already been publicly disclosed elsewhere (CVE, GHSA, NVD). Never submit a PR
    containing details of an unfixed vulnerability.

---

## Post-Merge Processing

When an advisory PR is merged, automated systems handle ID assignment, validation, and publication.

```mermaid
graph TD
    Merge["PR Merged<br/>to main"] --> Trigger["Trigger<br/>update-and-export.yml"]

    subgraph Stage1["Stage 1: ID Assignment"]
        AssignID["assign_ids_and_dates.jl"]
        GitLog["Extract Git<br/>Timestamps"]
        JLSEC["Assign<br/>JLSEC-YYYY-NNN"]
    end

    subgraph Stage2["Stage 2: OSV Export"]
        ExportOSV["export_osv.jl"]
        JSON["Generate<br/>OSV JSON"]
        Lint["Validate with<br/>osv-linter"]
    end

    subgraph Stage3["Stage 3: Publication"]
        PushOSV["Push to<br/>generated/osv"]
        BuildDocs["Build<br/>Documentation"]
        Deploy["Deploy to<br/>GitHub Pages"]
    end

    Trigger --> AssignID
    AssignID --> GitLog
    GitLog --> JLSEC
    JLSEC --> ExportOSV
    ExportOSV --> JSON
    JSON --> Lint
    Lint --> PushOSV
    Lint --> BuildDocs
    BuildDocs --> Deploy

    classDef trigger fill:#fff3e0,stroke:#f57c00
    classDef stage1 fill:#e1f5fe,stroke:#0288d1
    classDef stage2 fill:#e8f5e9,stroke:#388e3c
    classDef stage3 fill:#f3e5f5,stroke:#7b1fa2

    class Merge,Trigger trigger
    class AssignID,GitLog,JLSEC stage1
    class ExportOSV,JSON,Lint stage2
    class PushOSV,BuildDocs,Deploy stage3
```

### Processing Stages

**Stage 1: ID Assignment**
- `assign_ids_and_dates.jl` runs to assign unique identifiers
- **JLSEC ID Format**: `JLSEC-YYYY-NNN` where YYYY is the year and NNN is a sequential number
- **Timestamps**: `published` date is extracted from the first git commit, `modified` from the latest commit

**Stage 2: OSV Export**
- `export_osv.jl` converts all advisories to JSON following the [OSV schema](https://ossf.github.io/osv-schema/)
- The output is validated using `osv-linter` from the Open Source Security Foundation

**Stage 3: Publication**
- OSV JSON files are pushed to the `generated/osv` branch for osv.dev indexing
- This documentation site is rebuilt with the new advisory
- The site is deployed to GitHub Pages

The entire process is automated and typically completes within a few minutes of merging.

---

## Responsible Disclosure Timeline

The following sequence diagram shows the typical timeline for responsible vulnerability disclosure in the Julia ecosystem.

```mermaid
sequenceDiagram
    participant R as Security Researcher
    participant M as Package Maintainer
    participant JLSEC as JLSEC Team
    participant CVE as MITRE/CNA
    participant P as Public

    Note over R: Vulnerability Discovered
    R->>R: Analyze and validate
    R->>R: Document findings

    Note over R,M: Responsible Disclosure Phase
    R->>M: Private contact (email/security.md)
    Note right of M: Response window: 5-10 days

    alt Maintainer responds
        M->>R: Acknowledgment
        R->>M: Technical details
        M->>M: Internal analysis
        M->>R: Confirmation + Timeline

        Note over M: Patch Development
        M->>M: Develop fix
        M->>R: Test patch
        R->>M: Validate fix

        M->>M: Create GHSA on repository
        M->>CVE: Request CVE ID (optional)
        CVE->>M: Assign CVE-XXXX-XXXX

        M->>P: Release patched version
        M->>P: Publish GHSA
        JLSEC->>JLSEC: Auto-import GHSA
        JLSEC->>P: Publish JLSEC advisory

    else No response (30 days)
        Note over R: Escalation
        R->>JLSEC: Report non-responsive maintainer
        JLSEC->>M: Official contact attempt

        alt Maintainer collaborates
            M->>JLSEC: Commits to timeline
            JLSEC->>R: Coordinates disclosure
        else No collaboration (90 days total)
            R->>CVE: Request CVE ID
            CVE->>R: Assign CVE-XXXX-XXXX
            R->>JLSEC: Submit advisory directly
            JLSEC->>P: Publish with limited details
            Note right of P: Users can take protective action
        end
    end

    Note over P: Post-Publication
    P->>M: User questions
    JLSEC->>P: Update advisory if needed
    CVE->>P: CVE database updated
```

### Disclosure Guidelines

1. **Initial Contact** (Days 0-10): Contact the maintainer privately via email or the repository's security policy (SECURITY.md). Allow 5-10 days for acknowledgment.

2. **Coordination** (Days 10-30): Work with the maintainer to develop and test a fix. Agree on a coordinated disclosure timeline.

3. **Escalation** (Days 30+): If the maintainer is unresponsive, contact the JLSEC team for assistance in coordinating disclosure.

4. **Public Disclosure** (Day 90 max): Following standard responsible disclosure practices, vulnerabilities should be disclosed within 90 days, even if unpatched, to allow users to take protective action.

---

## Ecosystem Actors

The Julia security ecosystem involves multiple actors working together to discover, coordinate, and communicate vulnerabilities.

```mermaid
graph TB
    subgraph Discovery["Discovery"]
        R[Security Researchers]
        BH[Bug Hunters]
        MAINT[Package Maintainers]
        AUTO[Automated Scanners]
    end

    subgraph Coordination["Coordination"]
        JLSEC[JLSEC Working Group]
        CVE[MITRE / CNA]
        GHSA[GitHub Advisory DB]
    end

    subgraph Databases["Vulnerability Databases"]
        NVD[NVD - NIST]
        EUVD[EUVD - EU]
        OSVDEV[osv.dev]
        JLSECDB[SecurityAdvisories.jl]
    end

    subgraph Distribution["Distribution"]
        TRIVY[Trivy Scanner]
        DEPS[GitHub Dependabot]
        TOOLS[Security Tools]
    end

    subgraph Consumers["End Users"]
        ENT[Enterprise Users]
        DEV[Julia Developers]
        PKGMGR[Package Managers]
    end

    %% Discovery flows
    R --> JLSEC
    BH --> MAINT
    MAINT --> GHSA
    AUTO --> JLSEC

    %% Coordination flows
    JLSEC --> CVE
    JLSEC --> JLSECDB
    GHSA --> JLSEC
    CVE --> NVD

    %% Database flows
    NVD --> JLSECDB
    EUVD --> JLSECDB
    JLSECDB --> OSVDEV

    %% Distribution flows
    OSVDEV --> TRIVY
    OSVDEV --> DEPS
    JLSECDB --> TOOLS

    %% Consumer flows
    TRIVY --> ENT
    DEPS --> DEV
    TOOLS --> PKGMGR

    %% Styling
    classDef discovery fill:#ffcdd2,stroke:#c62828
    classDef coord fill:#bbdefb,stroke:#1565c0
    classDef db fill:#c8e6c9,stroke:#2e7d32
    classDef dist fill:#fff9c4,stroke:#f9a825
    classDef consumer fill:#e1bee7,stroke:#7b1fa2

    class R,BH,MAINT,AUTO discovery
    class JLSEC,CVE,GHSA coord
    class NVD,EUVD,OSVDEV,JLSECDB db
    class TRIVY,DEPS,TOOLS dist
    class ENT,DEV,PKGMGR consumer
```

### Actor Roles

| Actor | Role | Responsibility |
|-------|------|----------------|
| **Security Researchers** | Discovery | Find and report vulnerabilities responsibly |
| **Package Maintainers** | Response | Fix vulnerabilities and publish GHSAs |
| **JLSEC Working Group** | Coordination | Curate advisories, coordinate disclosure |
| **MITRE/CNA** | Identification | Assign CVE identifiers |
| **GitHub Advisory DB** | Aggregation | Host repository-level advisories |
| **NVD/EUVD** | Enrichment | Provide structured vulnerability data |
| **osv.dev** | Distribution | Aggregate and distribute to scanners |
| **Trivy/Dependabot** | Alerting | Notify users of vulnerable dependencies |

---

## JLSEC Advisory Lifecycle

Each advisory in the JLSEC database goes through a defined lifecycle with distinct states.

```mermaid
stateDiagram-v2
    [*] --> Draft: PR Created

    Draft --> UnderReview: Submit for review
    UnderReview --> Draft: Changes requested
    UnderReview --> Published: Approved & merged

    Published --> Updated: New information
    Updated --> Published: Changes merged

    Published --> Withdrawn: Error discovered
    Updated --> Withdrawn: Error discovered

    Withdrawn --> [*]: Advisory invalidated

    note right of Draft
        - No JLSEC ID assigned
        - Placeholder ID: JLSEC-0000-0
        - Version ranges being validated
    end note

    note right of Published
        - JLSEC-YYYY-NNN assigned
        - Timestamps from git history
        - Exported to OSV format
        - Indexed on osv.dev
    end note

    note right of Withdrawn
        - withdrawn field set
        - Remains in database
        - Strikethrough in listings
        - Never deleted
    end note
```

### Lifecycle States

| State | Description | JLSEC ID | Visibility |
|-------|-------------|----------|------------|
| **Draft** | PR open, under development | `JLSEC-0000-0` (placeholder) | PR only |
| **Under Review** | PR submitted, awaiting approval | `JLSEC-0000-0` (placeholder) | PR only |
| **Published** | Merged to main, live | `JLSEC-YYYY-NNN` (assigned) | Public |
| **Updated** | Existing advisory modified | Same ID, new `modified` date | Public |
| **Withdrawn** | Published in error, invalidated | Same ID, `withdrawn` date set | Public (marked) |

### Key Principles

1. **Advisories are never deleted**: Even erroneous advisories remain in the database with the `withdrawn` field set, preserving the audit trail.

2. **IDs are permanent**: Once a JLSEC ID is assigned, it never changes, even if the advisory is withdrawn.

3. **Timestamps from git**: The `published` and `modified` dates are extracted from git commit history, ensuring accuracy and auditability.

4. **OSV compliance**: All published advisories are exported to OSV format and validated against the schema before distribution.
