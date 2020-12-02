@extends('layouts.app')
@section('breadcrumbs', Breadcrumbs::render())

@push('scripts')
<script>
    var disqus_config = function () {
        this.page.title = '{!! $post->title !!}';
        this.page.url = '{!! route('post.detail', $post->slug) !!}';
        this.page.identifier = {!! $post->id !!};
    };
    (function() {
        var d = document, s = d.createElement('script');
        s.src = 'https://amatortelsizcilik.disqus.com/embed.js';
        s.setAttribute('data-timestamp', +new Date());
        (d.head || d.body).appendChild(s);
    })();
</script>
@endpush

@section('content')
<div class="container">
    <div class="row">
        <div class="col-sm d-flex">
            <div class="card flex-fill">
                <div class="card-body">
                            <h2 class="d-inline">{!! $post->title !!}</h2><br />
                            <small class="badge badge-dark font-weight-normal print-none">
                                <i class="far fa-clock"></i> {{ $post->created_at->diffForHumans() }} -
                                <i class="fas fa-stopwatch"></i> {{ read_time(['content' => $post->body ]) }}
                            </small>
                    <hr class="mt-1 mb-1 print-none">
                    {!! \Helper::replace_tags($post->body) !!}
                </div>
                <div class="card-footer print-none">
                   <div class="row">
                       <div class="col">
                        {!! Share::page(route('post.detail', $post->slug), $post->title)->facebook()->twitter()->pinterest()->linkedin()->whatsapp()->telegram()->reddit(); !!}
                        </div>
                        <div class="col text-right">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row mt-3 print-none">
        <div class="col-sm d-flex">
            <div class="card flex-fill">
                <div class="card-body">
                    <h2 class="d-inline">Yorumlar</h2>
                    <div id="disqus_thread"></div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
