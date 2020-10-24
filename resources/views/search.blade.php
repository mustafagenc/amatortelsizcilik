@extends('layouts.app')
@section('content')
<div class="container">
    <div class="row">
        <div class="col-sm d-flex">
            <div class="card flex-fill">
                <div class="card-body">
                <h2 class="d-inline">{{ __('all.search_result') }}</h2><br />
                    <hr class="mt-1 mb-3">
                    @if (count($search_results) > 0)
                    <ul class="list-unstyled">
                        @foreach ($search_results as $search_result)
                        <li class="media">
                            <div class="media-body">
                                <a href="{{ $search_result['url'] }}"class="mt-0 mb-1 font-weight-bold text-muted">{!! $search_result['icon'] !!} {!! $search_result['title'] !!}</a>
                                @if ($search_result['description'] != $search_result['title'])
                                    <p>{!! $search_result['description'] !!}</p>
                                @endif
                                @if(!$loop->last)
                                <hr class="mt-2 mb-2">
                                @endif
                            </div>
                        </li>
                        @endforeach
                    </ul>
                    @else
                        Aradığınız kelime hakkında herhangi bir içerik bulanamadı.
                    @endif
                </div>
                @if ($search_results->hasPages())
                <div class="card-footer">
                    {{ $search_results->withQueryString()->links() }}
                </div>
                @endif
            </div>
        </div>
    </div>
</div>
@endsection
