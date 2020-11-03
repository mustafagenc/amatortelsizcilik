<div class="container" id="navbarGroup">
    <a class="navbar-brand" href="{{ url('/') }}">{{ setting('site.title') }}</a>
    @mobile
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarAccountContent" aria-controls="navbarAccountContent" aria-expanded="false" aria-label="{{ __('Toggle navigation') }}" id="navbarAccountBtn">
            <svg width="1.5em" height="1.5em" viewBox="0 0 16 16" class="bi bi-person-circle" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                <path d="M13.468 12.37C12.758 11.226 11.195 10 8 10s-4.757 1.225-5.468 2.37A6.987 6.987 0 0 0 8 15a6.987 6.987 0 0 0 5.468-2.63z"/>
                <path fill-rule="evenodd" d="M8 9a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
                <path fill-rule="evenodd" d="M8 1a7 7 0 1 0 0 14A7 7 0 0 0 8 1zM0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8z"/>
            </svg>
        </button>
    @endmobile
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="{{ __('Toggle navigation') }}">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent" data-parent="#navbarGroup">
        {{ menu('frontend', 'partials.menu') }}
        <ul class="navbar-nav ml-auto c-hide-on-md">
            <li class="nav-item d-flex">
                <div class="collapse" id="searchForm">
                    <form method="get" action="{{ route('search') }}">
                        <input id="search" type="search" name="q" class="form-control" value="{{ app('request')->input('q') }}" placeholder="{{ __('all.search') }}" />
                    </form>
                </div>
                <a class="nav-link ml-auto" href="#searchForm" data-target="#searchForm" data-toggle="collapse"><i class="fa fa-search"></i></a>
            </li>
            @guest
                <li class="nav-item dropdown">
                    <a id="navbarDropdown" class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" v-pre>
                    <i class="far fa-user-circle"></i>
                    </a>
                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="{{ route('login') }}">{{ __('auth.login') }}</a>
                        @if (Route::has('register'))
                            <a class="dropdown-item" href="{{ route('register') }}">{{ __('auth.register') }}</a>
                        @endif
                    </div>
                </li>
            @else
                <li class="nav-item dropdown">
                    <a id="navbarDropdown" class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" v-pre>
                        <img src="{{Gravatar::get(Auth::user()->email, ['size'=>20])}}" alt="{{ Auth::user()->name }}" class="rounded-circle border" />
                    </a>
                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="{{ route('logout') }}"
                            onclick="event.preventDefault();
                                            document.getElementById('logout-form').submit();">
                            {{ __('auth.logout') }}
                        </a>
                        <form id="logout-form" action="{{ route('logout') }}" method="POST" class="d-none">
                            @csrf
                        </form>
                    </div>
                </li>
            @endguest
        </ul>
    </div>
    @mobile
        <div class="collapse navbar-collapse" id="navbarAccountContent" data-parent="#navbarGroup">
            <ul class="navbar-nav">
            @guest
                <li class="nav-item">
                    <a class="nav-link" href="{{ route('login') }}">{{ __('auth.login') }}</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="{{ route('register') }}">{{ __('auth.register') }}</a>
                </li>
            @else
                <li class="nav-item">
                    <a class="nav-link" href="{{ route('logout') }}" onclick="event.preventDefault(); document.getElementById('logout-form').submit();">{{ __('auth.logout') }}</a>
                </li>
            @endguest
            </ul>
        </div>
    @endmobile
</div>
