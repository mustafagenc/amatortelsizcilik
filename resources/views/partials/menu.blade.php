<ul class="navbar-nav mr-auto">
    @foreach($items as $item)
        @if($item->children->count())
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="{{ url($item->url) }}" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    {{ $item->title }}
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    @foreach($item->children as $subItem)
                        @if($subItem->title == 'divider')
                            <div class="dropdown-divider"></div>
                        @else
                            <a class="dropdown-item {!! url($subItem->link()) == url()->current() ? 'active' : '' !!}" target="{{ $subItem->target }}" href="{{ url($subItem->url) }}">{{ $subItem->title }} {!! url($subItem->link()) == url()->current() ? '<span class="sr-only">(current)</span>' : '' !!}</a>
                        @endif
                    @endforeach
                </div>
            </li>
        @else
            <li class="nav-item {!! url($item->link()) == url()->current() ? 'active' : '' !!}">
                <a class="nav-link" target="{{ $item->target }}" href="{{ url($item->url) }}">{{ $item->title }} {!! url($item->link()) == url()->current() ? '<span class="sr-only">(current)</span>' : '' !!}</a>
            </li>
        @endif
    @endforeach
</ul>
