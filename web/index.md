@def title = "Julia Security Advisories"

{{generate_advisory_pages}}

# Julia Security Advisories

~~~<p class="page-desc">The security advisory database for packages in the Julia ecosystem.</p>~~~

~~~
<div class="search-box">
  <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="11" cy="11" r="8"/><line x1="21" y1="21" x2="16.65" y2="16.65"/></svg>
  <input type="text" placeholder="Search advisories, packages, CVEs…" onclick="window.location='/search/'" readonly>
</div>
~~~

{{stats}}

~~~<div class="section-header"><h2>Recent Advisories</h2><a href="/advisories/">View all →</a></div>~~~

{{recent_advisories}}

~~~
<div class="quick-links">
  <a href="/advisories/" class="quick-link">
    <div class="quick-link-title">Browse Advisories</div>
    <div class="quick-link-desc">View all published security advisories with full details and affected versions.</div>
  </a>
  <a href="/packages/" class="quick-link">
    <div class="quick-link-title">Packages</div>
    <div class="quick-link-desc">Explore affected packages and see which versions have known vulnerabilities.</div>
  </a>
  <a href="https://github.com/JuliaLang/SecurityAdvisories.jl/blob/main/CONTRIBUTING.md" class="quick-link">
    <div class="quick-link-title">Report a Vulnerability</div>
    <div class="quick-link-desc">Submit a new advisory via pull request or report a discovered vulnerability.</div>
  </a>
</div>
~~~
