@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row">
        <div class="col-sm d-flex">
            <div class="card flex-fill">
                <div class="card-body">

                    <h2 class="d-inline">{!! $page->title !!}</h2>

                    <div class="dropdown float-right print-none">
                        <a  type="button" id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-ellipsis-v"></i></a>
                        <div class="dropdown-menu dropdown-primary">
                            <a class="dropdown-item" href="javascript:window.print();"><i class="fas fa-fw fa-print"></i>&nbsp;&nbsp;Yazdır</a>
                        </div>
                    </div>

                    <hr class="mt-1 mb-2">
                    @if ($page->excerpt != $page->title)
                        <div class="alert alert-info" role="alert">
                        <i class="fas fa-lightbulb"></i> {{ $page->excerpt }}
                        </div>
                    @endif
                    {!! $page->body !!}

                </div>
                <div class="card-footer">
                   Paylaş: {!! Share::page(route('page', $page->slug), $page->title)->facebook()->twitter()->pinterest()->linkedin()->whatsapp()->telegram()->reddit(); !!}
                </div>
            </div>
        </div>
    </div>
    <div class="row mt-3">
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
(function() { // DON'T EDIT BELOW THIS LINE
var d = document, s = d.createElement('script');
s.src = 'https://amatortelsizcilik.disqus.com/embed.js';
s.setAttribute('data-timestamp', +new Date());
(d.head || d.body).appendChild(s);
})();
</script>
@endpush
