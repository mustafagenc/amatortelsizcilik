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
    @yield('analytics', View::make('partials.analytics'))
    @stack('styles')
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light fixed-top bg-light shadow-sm">
        @yield('navbar', View::make('partials.navbar'))
    </nav>
    <main class="main" class="container">
        @yield('content')
    </main>
    <footer class="container my-3">
        <div class="row">
            <div class="col-6 col-md">
                <i class="fab fa-github-square fa-lg"></i>
                <a href="https://github.com/mustafagenc/amatortelsizcilik" class="ml-1 underline">
                    Github
                </a>
            </div>
            <div class="col-6 col-md text-right">
                Build v0.0.1
            </div>
        </div>
    </footer>
    @stack('scripts')
    <script src="{{ asset('js/share.js') }}"></script>
</body>
</html>
