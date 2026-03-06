@def title = "Julia Security Advisories"

{{generate_advisory_pages}}

~~~
<div class="hero">
  <h1 class="hero-title">Julia Security<br>Advisories</h1>
  <p class="hero-sub">The security advisory database for packages in the Julia ecosystem. Browse known vulnerabilities, check affected versions, and stay informed.</p>
</div>
~~~

{{stats}}

~~~<div class="section-header"><h2>Latest</h2><a href="/advisories/">View all →</a></div>~~~

{{recent_advisories}}

~~~
<div class="action-row">
  <a href="/advisories/" class="action-link">
    <span>Browse all advisories</span>
    <span class="action-link-arrow">→</span>
  </a>
  <a href="/packages/" class="action-link">
    <span>Explore affected packages</span>
    <span class="action-link-arrow">→</span>
  </a>
  <a href="https://github.com/JuliaLang/SecurityAdvisories.jl/blob/main/CONTRIBUTING.md" class="action-link">
    <span>Report a vulnerability</span>
    <span class="action-link-arrow">→</span>
  </a>
</div>
~~~
