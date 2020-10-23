@extends('layouts.app')

@section('breadcrumbs', Breadcrumbs::render())

@section('content')
<div class="container">
    <div class="row">
        <div class="col-sm d-flex">
            <div class="card flex-fill">
                <div class="card-body">


                    <div class="row">
                        <div class="col-8">
                            <h2 class="d-inline">{!! $page->title !!}</h2><br />


                            <small class="badge badge-dark font-weight-normal">
                                <i class="far fa-clock"></i> {{ $page->created_at->diffForHumans() }} -
                                <i class="fas fa-stopwatch"></i> {{ read_time(['content' => $page->body ]) }}
                            </small>

                        </div>
                        <div class="col-4 text-right">
                            <div class="dropdown print-none">
                                <a  type="button" id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-ellipsis-v"></i></a>
                                <div class="dropdown-menu dropdown-primary">
                                    <a class="dropdown-item" href="javascript:window.print();"><i class="fas fa-fw fa-print"></i>&nbsp;&nbsp;Yazdır</a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <hr class="mt-1 mb-1">

                    @if ($page->excerpt != $page->title)
                        <div class="alert alert-info" role="alert">
                        <i class="fas fa-lightbulb"></i> {{ $page->excerpt }}
                        </div>
                    @endif
                    {!! $page->body !!}
                </div>
                <div class="card-footer">
                   <div class="row">
                       <div class="col">
                        {!! Share::page(route('page', $page->slug), $page->title)->facebook()->twitter()->pinterest()->linkedin()->whatsapp()->telegram()->reddit(); !!}
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

@push('scripts')
<script>
var disqus_config = function () {
this.page.url = '{!! route('page', $page->slug) !!}';
this.page.identifier = {!! $page->id !!};
};
(function() {
var d = document, s = d.createElement('script');
s.src = 'https://amatortelsizcilik.disqus.com/embed.js';
s.setAttribute('data-timestamp', +new Date());
(d.head || d.body).appendChild(s);
})();
</script>
@endpush
