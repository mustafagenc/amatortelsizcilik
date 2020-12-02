@extends('layouts.app')
@section('breadcrumbs', Breadcrumbs::render())

@push('scripts')
@endpush

@section('content')
<div class="container">
    <div class="row">
        <div class="col">
            @if ($posts)
                @foreach($posts as $post)
                    <div class="card flex-fill mb-2">
                        <div class="card-body">
                            <h2 class="d-inline"><a class="text-decoration-none" href="{{route('post.detail', $post->slug)}}">{!! $post->title !!}</a></h2><br />
                            <small class="badge badge-dark font-weight-normal print-none">
                                <i class="far fa-clock"></i> {{ $post->created_at->diffForHumans() }} -
                                <i class="fas fa-stopwatch"></i> {{ read_time(['content' => $post->body ]) }}
                            </small>
                            <hr class="mt-1 mb-1 print-none">
                            {!! $post->excerpt !!}
                            <br />
                            <a href="{{route('post.detail', $post->slug)}}" class="text-decoration-none">{{ __('all.read_more') }}</a>
                        </div>
                    </div>
                @endforeach
            @else
                <div class="card flex-fill mb-2">
                    <div class="card-body">
                        Kayıtlı yazı bulunamadı.
                    </div>
                </div>
            @endif
        </div>
    </div>
    @if ($posts->hasPages())
    <div class="row">
        <div class="col text-center">
            {{ $posts->withQueryString()->links() }}
        </div>
    </div>
    @endif
</div>
@endsection
