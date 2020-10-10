<!doctype html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <title>{{ config('app.name', 'Laravel') }}</title>
    @yield('favicon', View::make('partials.favicon'))
    <script src="{{ asset('js/app.js') }}" defer></script>
    <link rel="dns-prefetch" href="//fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css?family=Nunito" rel="stylesheet">
    <link href="{{ asset('css/app.css') }}" rel="stylesheet">
    <script src="https://kit.fontawesome.com/95ecd7c087.js" crossorigin="anonymous"></script>
    @yield('analytics', View::make('partials.analytics'))
</head>
<body>
    <div id="app">
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark shadow-sm">
        @yield('navbar', View::make('partials.navbar'))
        </nav>
        <main class="py-4">
            @yield('content')
        </main>
        <div class="container">
            <footer>
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
        </div>
    </div>
</body>
</html>
