@unless ($breadcrumbs->isEmpty())
<nav aria-label="breadcrumb" class="container mt-0 mb-2 py-0 print-none">
<ol class="breadcrumb my-0 py-0">
        @foreach ($breadcrumbs as $breadcrumb)
            @if (!is_null($breadcrumb->url) && !$loop->last)
                <li class="breadcrumb-item"><a href="{{ $breadcrumb->url }}">{{ $breadcrumb->title }}</a></li>
            @else
                <li class="breadcrumb-item active">{{ $breadcrumb->title }}</li>
            @endif
        @endforeach
    </ol>
</nav>
@endunless
