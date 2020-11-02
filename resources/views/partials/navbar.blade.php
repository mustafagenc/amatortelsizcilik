<div class="container">
    <a class="navbar-brand" href="{{ url('/') }}">
    {{ setting('site.title') }}
    </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="{{ __('Toggle navigation') }}">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        {{ menu('frontend', 'partials.menu') }}

        <ul class="navbar-nav ml-auto">
            <li class="nav-item d-flex">
                <div class="collapse" id="searchForm">
                    <form method="get" action="{{ route('search') }}">
                        <input id="search" type="search" name="q" class="form-control" value="{{ app('request')->input('q') }}" placeholder="{{ __('all.search') }}" />
                        <!-- @csrf -->
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
</div>
