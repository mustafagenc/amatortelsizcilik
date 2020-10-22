<!doctype html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    {!! SEO::generate(true) !!}
    @yield('favicon', View::make('partials.favicon'))
    <script src="{{ asset('js/app.js') }}" defer></script>
    <link rel="dns-prefetch" href="//fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css?family=Nunito" rel="stylesheet">
    <link href="{{ asset('css/app.css') }}" rel="stylesheet">
    <script src="https://kit.fontawesome.com/95ecd7c087.js" crossorigin="anonymous"></script>
    @yield('services', View::make('partials.services'))
    @stack('styles')
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light fixed-top bg-light shadow-sm">
        @yield('navbar', View::make('partials.navbar'))
    </nav>
    @yield('breadcrumbs')
    <main class="main" class="container">
        @yield('content')
    </main>
    <footer class="container my-3 footer">
        <div class="row">
            <div class="col-6 col-md">
                <a href="{{ setting('site.social_github') }}" class="github" title="Github"><i class="fab fa-github fa-lg"></i></a>&nbsp;
                <a href="{{ setting('site.social_facebook') }}" class="facebook" title="Facebook"><i class="fab fa-facebook fa-lg"></i></a>&nbsp;
                <a href="{{ setting('site.social_pinterest') }}" class="pinterest" class="Pinterest"><i class="fab fa-pinterest fa-lg"></i></a>&nbsp;
                <a href="{{ setting('site.social_instagram') }}" class="instagram" class="Instagram"><i class="fab fa-instagram fa-lg"></i></a>&nbsp;
                <a href="{{ setting('site.social_reddit') }}" class="reddit" class="Reddit"><i class="fab fa-reddit fa-lg"></i></a>
            </div>
            <div class="col-6 col-md text-right">
                {!! \Tremby\LaravelGitVersion\GitVersionHelper::getVersion() !!}
            </div>
        </div>
    </footer>
    @stack('scripts')
</body>
</html>
