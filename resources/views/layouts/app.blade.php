<!doctype html>
<html lang="en" data-bs-theme="light"><!-- theme is toggled by JS -->

<head>
  <meta charset="utf-8">
  <title>Virtual Kitchen</title>

  <!-- Bootstrap 5.3 CDN -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
    crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"
    defer></script>

  <style>
    :root {
      --vk-radius: 10px;
      --vk-shadow: 0 2px 6px rgba(0, 0, 0, .06);
      --vk-primary: #0a84ff;
    }

    body {
      font-size: 0.95rem;
    }

    .navbar {
      background: #111 !important;
    }

    .card,
    .form-control,
    .btn,
    .toast {
      border-radius: var(--vk-radius);
    }

    .card {
      position: relative;
      box-shadow: var(--vk-shadow);
      border: 1px solid rgba(255, 255, 255, .1);
      background: #1c1c1e;
      transition: transform .15s ease, box-shadow .15s ease;
    }

    .card:hover {
      transform: translateY(-4px) scale(1.02);
      box-shadow: 0 8px 20px rgba(0, 0, 0, .18);
    }

    .card-img-top {
      height: 180px;
      object-fit: cover;
      border-top-left-radius: var(--vk-radius);
      border-top-right-radius: var(--vk-radius);
    }

    .btn-primary,
    .btn-outline-primary {
      border: 0;
    }

    .btn-primary {
      background: var(--vk-primary);
    }

    .btn-outline-primary {
      color: var(--vk-primary);
    }

    .btn-outline-primary:hover {
      background: var(--vk-primary);
      color: #fff;
    }

    .badge {
      font-size: 0.75rem;
      padding: .35em .6em;
    }
  </style>

</head>

<body>
  <nav class="navbar navbar-expand-lg mb-4" data-bs-theme="dark" style="background:#1f1f1f;">
    <div class="container-fluid">
      <a class="navbar-brand fw-bold" href="{{ route('recipes.index') }}">VK</a>

      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#nav">
        <span class="navbar-toggler-icon"></span>
      </button>

      <div class="collapse navbar-collapse" id="nav">
        {{-- search – hide on < lg --}} <form class="d-none d-lg-flex me-auto" action="{{ route('recipes.search') }}"
          method="GET">
          <input class="form-control me-2 bg-body-tertiary" name="q" value="{{ request('q') }}" placeholder="Search">
          <select class="form-select me-2 bg-body-tertiary" name="type">
            <option value="">All</option>
            @foreach(['French', 'Italian', 'Chinese', 'Indian', 'Mexican', 'Others'] as $t)
        <option @selected($t == request('type'))>{{ $t }}</option>
      @endforeach
          </select>
          <button class="btn btn-outline-primary btn-sm me-2">Search</button>
          <a href="{{ route('recipes.index') }}" class="btn btn-outline-secondary ms-2"
            title="Clear filters and show all">Clear&nbsp;Filters</a>
          </form>

          <ul class="navbar-nav ms-auto align-items-lg-center">
            @guest {{-- visitor --}}
        <li class="nav-item"><a class="nav-link" href="{{ route('login') }}">Login</a></li>
        <li class="nav-item"><a class="nav-link" href="{{ route('register') }}">Register</a></li>
      @else {{-- logged-in user --}}
    <li class="nav-item"><a class="nav-link" href="{{ route('recipes.my') }}">My Recipes</a></li>
    <li class="nav-item"><a class="nav-link" href="{{ route('recipes.create') }}">Add Recipe</a></li>
    <li class="nav-item">
      <form action="{{ route('logout') }}" method="POST" class="m-0">
      @csrf
      <button class="nav-link btn btn-link p-0">Logout</button>
      </form>
    </li>
  @endguest

            {{-- theme switch button – leave unchanged --}}
            <li class="nav-item ms-lg-3">
              <button id="themeToggle" class="btn btn-outline-secondary btn-sm">
                <span data-theme-icon="light">🌙</span>
                <span data-theme-icon="dark" class="d-none">☀️</span>
              </button>
            </li>
          </ul>
      </div>
    </div>
  </nav>

  <div class="container">
    @if(session('status'))
    <div class="alert alert-success">{{ session('status') }}</div>
  @endif

    @yield('content')
  </div>

  <script>
    /* ---------- simple light / dark switch using Bootstrap 5.3 ---------- */
    (function () {
      const html = document.documentElement;
      const btn = document.getElementById('themeToggle');
      const icons = {
        light: btn.querySelector('[data-theme-icon="light"]'),
        dark: btn.querySelector('[data-theme-icon="dark"]')
      };

      /* apply saved pref or default light */
      const stored = localStorage.getItem('theme');
      if (stored === 'dark') html.dataset.bsTheme = 'dark';

      updateIcon();

      btn.addEventListener('click', () => {
        html.dataset.bsTheme = html.dataset.bsTheme === 'dark' ? 'light' : 'dark';
        localStorage.setItem('theme', html.dataset.bsTheme);
        updateIcon();
      });

      function updateIcon() {
        const mode = html.dataset.bsTheme;
        icons.light.classList.toggle('d-none', mode !== 'light');
        icons.dark.classList.toggle('d-none', mode !== 'dark');
      }
    })();
  </script>
</body>

</html>