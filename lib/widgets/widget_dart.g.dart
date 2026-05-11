var mapTemplates = {
	r"style.j2.html": r"""<style>
  :root {
    --primary: #10dd88;
    --primary-dark: #059669;
    --bg-dark: #0a0f1e;
    --bg-card: #111827;
    --bg-card-hover: #1a2236;
    --text: #e2e8f0;
    --text-muted: #94a3b8;
    --text-heading: #ffffff;
    --border: rgba(255, 255, 255, 0.06);
  }

  * {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
  }

  html {
    scroll-behavior: smooth;
    overflow-x: hidden;
  }

  body {
    font-family:
      "Inter",
      -apple-system,
      BlinkMacSystemFont,
      "Segoe UI",
      Roboto,
      Oxygen,
      Ubuntu,
      sans-serif;
    background-color: var(--bg-dark);
    color: var(--text);
    line-height: 1.6;
    overflow-x: hidden;
  }

  /* ── Navbar ── */
  nav {
    position: fixed;
    top: 0;
    width: 100%;
    z-index: 100;
    padding: 18px 0;
    background: rgba(11, 17, 32, 0.8);
    backdrop-filter: blur(16px);
    border-bottom: 1px solid var(--border);
  }

  .nav-inner {
    max-width: 1120px;
    margin: 0 auto;
    padding: 0 24px;
    display: flex;
    align-items: center;
    justify-content: space-between;
  }

  .logo {
    display: flex;
    align-items: center;
    gap: 10px;
    text-decoration: none;
    color: var(--text-heading);
    font-weight: 700;
    font-size: 1.2em;
  }

  .logo-icon {
    width: 42px;
    height: 42px;
    background: var(--primary);
    border-radius: 8px;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 18px;
    color: var(--bg-dark);
    font-weight: 900;
    padding-left: 4px;
    padding-right: 4px;
  }

  .nav-links {
    display: flex;
    align-items: center;
    gap: 8px;
  }

  .nav-link {
    color: var(--text-muted);
    text-decoration: none;
    padding: 8px 16px;
    border-radius: 8px;
    font-size: 0.9em;
    font-weight: 500;
    transition:
      color 0.2s,
      background 0.2s;
  }

  .nav-link:hover {
    color: var(--text-heading);
    background: rgba(255, 255, 255, 0.05);
  }

  .nav-link.accent {
    background: var(--primary);
    color: var(--bg-dark);
    font-weight: 600;
  }

  .nav-link.accent:hover {
    background: var(--primary-dark);
    color: var(--bg-dark);
  }

  /* ── Hero ── */
  .hero {
    min-height: 100vh;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    text-align: center;
    padding: 120px 24px 80px;
    position: relative;
  }

  .hero::before {
    content: "";
    position: absolute;
    top: -40%;
    left: 50%;
    transform: translateX(-50%);
    width: 800px;
    height: 800px;
    background: radial-gradient(
      circle,
      rgba(34, 211, 102, 0.12) 0%,
      transparent 70%
    );
    pointer-events: none;
  }

  .badge {
    display: inline-flex;
    align-items: center;
    gap: 8px;
    background: rgba(34, 211, 102, 0.1);
    border: 1px solid rgba(34, 211, 102, 0.2);
    color: var(--primary);
    font-size: 0.85em;
    font-weight: 600;
    padding: 6px 16px;
    border-radius: 100px;
    margin-bottom: 32px;
  }

  .badge-dot {
    width: 6px;
    height: 6px;
    background: var(--primary);
    border-radius: 50%;
  }

  .hero h1 {
    font-size: clamp(2.5em, 6vw, 4.2em);
    font-weight: 800;
    color: var(--text-heading);
    line-height: 1.15;
    max-width: 720px;
    margin-bottom: 24px;
    letter-spacing: -0.03em;
  }

  .hero h1 .highlight {
    background: linear-gradient(135deg, var(--primary) 0%, #60a5fa 100%);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    background-clip: text;
  }

  .hero p {
    font-size: 1.15em;
    color: var(--text-muted);
    max-width: 540px;
    margin-bottom: 48px;
    line-height: 1.7;
  }

  .hero-buttons {
    display: flex;
    gap: 14px;
    flex-wrap: wrap;
    justify-content: center;
  }

  .btn {
    display: inline-flex;
    align-items: center;
    gap: 8px;
    padding: 14px 28px;
    border-radius: 10px;
    font-size: 0.95em;
    font-weight: 600;
    text-decoration: none;
    transition: all 0.25s ease;
  }

  .btn-primary {
    background: var(--primary);
    color: var(--bg-dark);
  }

  .btn-primary:hover {
    background: var(--primary-dark);
    transform: translateY(-1px);
    box-shadow: 0 8px 30px rgba(34, 211, 102, 0.25);
  }

  .btn-secondary {
    background: rgba(255, 255, 255, 0.06);
    color: var(--text);
    border: 1px solid var(--border);
  }

  .btn-secondary:hover {
    background: rgba(255, 255, 255, 0.1);
    border-color: rgba(255, 255, 255, 0.15);
    transform: translateY(-1px);
  }

  .btn svg {
    width: 18px;
    height: 18px;
  }

  /* ── Docs ── */
  .docs {
    max-width: 900px;
    margin: 0 auto;
    padding: 0 24px 120px;
  }

  .docs-title {
    text-align: center;
    font-size: 2em;
    font-weight: 800;
    color: var(--text-heading);
    margin-bottom: 12px;
    letter-spacing: -0.02em;
  }

  .docs-subtitle {
    text-align: center;
    color: var(--text-muted);
    font-size: 1.05em;
    margin-bottom: 48px;
    line-height: 1.7;
  }

  .doc-section {
    background: var(--bg-card);
    border: 1px solid var(--border);
    border-radius: 16px;
    padding: 32px;
    margin-bottom: 20px;
    transition:
      background 0.25s,
      border-color 0.25s;
  }

  .doc-section:hover {
    background: var(--bg-card-hover);
    border-color: rgba(255, 255, 255, 0.1);
  }

  .doc-section h3 {
    color: var(--text-heading);
    font-size: 1.2em;
    font-weight: 700;
    margin-bottom: 12px;
    display: flex;
    align-items: center;
    gap: 10px;
  }

  .doc-section h3 .dot {
    width: 8px;
    height: 8px;
    border-radius: 50%;
    flex-shrink: 0;
  }

  .dot.blue {
    background: var(--primary);
  }
  .dot.cyan {
    background: #22d3ee;
  }
  .dot.violet {
    background: #a78bfa;
  }
  .dot.amber {
    background: #fbbf24;
  }

  .doc-section p {
    color: var(--text-muted);
    font-size: 0.93em;
    line-height: 1.75;
    margin-bottom: 16px;
  }

  .doc-section p:last-child {
    margin-bottom: 0;
  }

  .code-block {
    background: rgba(0, 0, 0, 0.3);
    border: 1px solid var(--border);
    border-radius: 10px;
    padding: 18px 22px;
    font-family: "SF Mono", "Fira Code", "JetBrains Mono", monospace;
    font-size: 0.85em;
    color: #93c5fd;
    overflow-x: auto;
    line-height: 1.8;
  }

  .code-block .comment {
    color: #64748b;
  }
  .code-block .cmd {
    color: #f0abfc;
  }

  /* ── Footer ── */
  footer {
    border-top: 1px solid var(--border);
    padding: 40px 24px;
  }

  .footer-inner {
    max-width: 1120px;
    margin: 0 auto;
    display: flex;
    align-items: center;
    justify-content: space-between;
    flex-wrap: wrap;
    gap: 16px;
  }

  .footer-copy {
    color: var(--text-muted);
    font-size: 0.85em;
  }

  .footer-links {
    display: flex;
    gap: 24px;
  }

  .footer-links a {
    color: var(--text-muted);
    text-decoration: none;
    font-size: 0.85em;
    transition: color 0.2s;
  }

  .footer-links a:hover {
    color: var(--primary);
  }

  /* ── Mobile ── */
  @media (max-width: 640px) {
    .nav-inner {
      flex-direction: row;
      gap: 8px;
      justify-content: space-between;
    }
    nav {
      padding: 12px 0;
    }
    .logo {
      font-size: 1em;
      gap: 8px;
    }
    .logo-icon {
      width: 32px;
      height: 32px;
      font-size: 14px;
    }
    .nav-links {
      gap: 4px;
    }
    .nav-link {
      padding: 6px 10px;
      font-size: 0.85em;
    }
    .hero {
      padding: 120px 20px 60px;
    }
    .hero h1 {
      font-size: 2.2em;
    }
    .hero p {
      font-size: 1em;
      margin-bottom: 32px;
    }
    .hero-buttons {
      flex-direction: column;
      align-items: stretch;
      width: 100%;
    }
    .btn {
      justify-content: center;
      width: 100%;
    }
    .docs {
      padding: 0 20px 80px;
    }
    .doc-section {
      padding: 20px;
    }
    .code-block {
      font-size: 0.75em;
      padding: 16px;
    }
    .footer-inner {
      flex-direction: column;
      text-align: center;
      gap: 24px;
    }
    .footer-links {
      justify-content: center;
      width: 100%;
      flex-wrap: wrap;
    }
  }

  table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 24px;
  }

  table thead {
    background: var(--bg-card);
  }

  table thead tr {
    border-bottom: 1px solid var(--border);
  }

  table thead th {
    color: var(--text-muted);
    font-size: 0.85em;
    text-align: left;
    padding: 12px 16px;
  }

  table tbody {
    border-top: 1px solid var(--border);
  }

  table tbody tr {
    border-bottom: 1px solid var(--border);
  }

  table tbody tr:nth-child(even) {
    background: var(--bg-card);
  }

  table tbody tr td {
    color: var(--text);
    font-size: 0.93em;
    padding: 12px 16px;
  }

  /*title tooltip*/
  [title] {
    position: relative;
    cursor: help;
  }

  [title]:hover::before {
    opacity: 1;
    pointer-events: all;
  }

  [title]::before {
    content: attr(title);
    position: absolute;
    top: 100%;
    left: 50%;
    transform: translateX(-50%);
    padding: 20px;
    background: rgba(0, 0, 0, 1);
    color: #fff;
    font-size: 0.75em;
    white-space: nowrap;
    opacity: 0;
    pointer-events: none;
    transition: opacity 0.2s;
    border-radius: 4px;
    font-size: 1.0em;
  }
</style>
""",
	r"home.j2.html": r"""<!doctype html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Simple MCP Server</title>
    {% include 'style.j2.html' %}
  </head>
  <body>
    <!-- Navbar -->
    <nav>
      <div class="nav-inner">
        <a class="logo" href="/">
          <div class="logo-icon">@></div>
          MCP Server
        </a>
        <div class="nav-links">
          <a class="nav-link" href="https://finchdart.com">Docs</a>
          <a
            class="nav-link accent"
            href="https://github.com/uproid/finch"
            target="_blank"
            rel="noopener"
            >GitHub</a
          >
        </div>
      </div>
    </nav>

    {% block content %}
    <!-- Hero -->
    <section class="hero">
      <div class="badge">
        <span class="badge-dot"></span>
        Open Source
      </div>
      <h1><span>Simple MCP Server</span></h1>
      <p>Simple MCP Server, built with Finch framework in Dart.</p>
      <div class="hero-buttons">
        <a
          class="btn btn-primary"
          href="https://github.com/uproid/finch"
          target="_blank"
          rel="noopener"
        >
          <svg fill="currentColor" viewBox="0 0 24 24">
            <path
              d="M12 0C5.37 0 0 5.37 0 12c0 5.31 3.435 9.795 8.205 11.385.6.105.825-.255.825-.57 0-.285-.015-1.23-.015-2.235-3.015.555-3.795-.735-4.035-1.41-.135-.345-.72-1.41-1.23-1.695-.42-.225-1.02-.78-.015-.795.945-.015 1.62.87 1.845 1.23 1.08 1.815 2.805 1.305 3.495.99.105-.78.42-1.305.765-1.605-2.67-.3-5.46-1.335-5.46-5.925 0-1.305.465-2.385 1.23-3.225-.12-.3-.54-1.53.12-3.18 0 0 1.005-.315 3.3 1.23.96-.27 1.98-.405 3-.405s2.04.135 3 .405c2.295-1.56 3.3-1.23 3.3-1.23.66 1.65.24 2.88.12 3.18.765.84 1.23 1.905 1.23 3.225 0 4.605-2.805 5.625-5.475 5.925.435.375.81 1.095.81 2.22 0 1.605-.015 2.895-.015 3.3 0 .315.225.69.825.57A12.02 12.02 0 0024 12c0-6.63-5.37-12-12-12z"
            />
          </svg>
          View on GitHub
        </a>
        <a
          class="btn btn-secondary"
          href="https://finchdart.com"
          target="_blank"
          rel="noopener"
        >
          <svg fill="currentColor" viewBox="0 0 24 24">
            <path
              d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm-1 17.93c-3.95-.49-7-3.85-7-7.93 0-.62.08-1.21.21-1.79L9 15v1c0 1.1.9 2 2 2v1.93zm6.9-2.54c-.26-.81-1-1.39-1.9-1.39h-1v-3c0-.55-.45-1-1-1H8v-2h2c.55 0 1-.45 1-1V7h2c1.1 0 2-.9 2-2v-.41c2.93 1.19 5 4.06 5 7.41 0 2.08-.8 3.97-2.1 5.39z"
            />
          </svg>
          Visit Website
        </a>
      </div>
    </section>

    <section class="docs">
      <h2 class="docs-title">MCP Server connection:</h2>
      <p class="docs-subtitle">
        This project demonstrates a simple MCP (Model-Controller-Provider)
        server built with the Finch framework in Dart. It serves as a starting
        point for building your own MCP-based applications, showcasing routing,
        template rendering, and internationalization features.
      </p>

      <div class="doc-section">
        <h3><span class="dot blue"></span>MCP Connection</h3>
        <p>Connect to the MCP server using the provided tools and APIs.</p>
        <div class="code-block">
          <span class="comment">Link</span><br />
          <span class="cmd">{{ $e.url('/mcp') }}</span><br /><br />

          <span class="comment">Authorization</span><br />
          <span class="cmd">{{ API_KEY }}</span><br /><br />
        </div>
      </div>
      <h2 class="docs-title">Todo List</h2>
      <table>
        <thead>
          <tr>
            <th>Todo ID</th>
            <th>Title</th>
            <th>Completed</th>
          </tr>
        </thead>
        <tbody>
          {% for todo in todos %}
          <tr>
            <td>{{ todo.id }}</td>
            <td title="{{ todo.description }}">{{ todo.title }}</td>
            <td>{{ todo.is_completed ? 'Yes' : 'No' }}</td>
          </tr>
          {% endfor %}
        </tbody>
      </table>
    </section>

    <!-- Documentation -->
    <section class="docs" id="docs">
      <div class="doc-section">
        <h3><span class="dot cyan"></span>Project Structure</h3>
        <p>
          The project follows a clean and intuitive structure. Controllers
          handle your routes, widgets define your templates with Jinja2 syntax,
          and language files power the built-in i18n support.
        </p>
        <div class="code-block">
          lib/<br />
          &nbsp;&nbsp;├── app.dart
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
            class="comment"
            ># Entry point &amp; server setup</span
          ><br />
          &nbsp;&nbsp;├── serve.dart
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="comment"
            ># File watcher for development</span
          ><br />
          &nbsp;&nbsp;├── controllers/ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
            class="comment"
            ># Route controllers</span
          ><br />
          &nbsp;&nbsp;├── widgets/
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span
            class="comment"
            ># Jinja2 HTML templates</span
          ><br />
          &nbsp;&nbsp;└── languages/
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="comment"
            ># i18n JSON files</span
          >
        </div>
      </div>

      <div class="doc-section">
        <h3><span class="dot violet"></span>Finch Framework</h3>
        <p>
          Finch is a lightweight Dart web framework that provides routing,
          middleware, template rendering, and internationalization out of the
          box. It is designed for building fast, modern server-side applications
          with minimal boilerplate.
        </p>
        <p>
          Explore the full framework documentation and source code on
          <a
            href="https://github.com/uproid/finch"
            target="_blank"
            rel="noopener"
            style="
              color: var(--primary);
              text-decoration: none;
              font-weight: 600;
            "
            >GitHub</a
          >.
        </p>
      </div>

      <div class="doc-section">
        <h3><span class="dot amber"></span>Deployment</h3>
        <p>
          The included Dockerfile and docker-compose.yaml make it easy to deploy
          anywhere that supports containers. Build for production and expose on
          your preferred port:
        </p>
        <div class="code-block">
          <span class="comment"># Build and run in production</span><br />
          <span class="cmd">docker compose</span> -f docker-compose.yaml up -d
        </div>
      </div>
    </section>
    {% endblock %}

    <!-- Footer -->
    <footer>
      <div class="footer-inner">
        <span class="footer-copy">@> Finch framework</span>
        <div class="footer-links">
          <a
            href="https://github.com/uproid/finch"
            target="_blank"
            rel="noopener"
            >GitHub</a
          >
          <a href="https://finchdart.com" target="_blank" rel="noopener"
            >finchdart.com</a
          >
        </div>
      </div>
    </footer>
  </body>
</html>
""",
	r"auth.j2.html": r"""{% extends 'home.j2.html' %} 

{% block content %}
<!-- Auth -->
<section class="hero">
  <h1 class="highlight" style="color:var(--primary);text-decoration:none;font-weight:600; font-size:2.5rem;">Error 401</h1>
  <h2>Authentication</h2>
  <p>
    Authentication is required to access this resource. Please provide valid
    credentials to proceed.
    <br/><br/>
    Bearer token authentication is supported. Include an Authorization header with a valid token to access protected endpoints. For example:
    <br/><br/>
    <code class="code-block">Authorization: Bearer &lt;your_token_here&gt;</code>
  </p>
</section>
{% endblock %}
"""
};