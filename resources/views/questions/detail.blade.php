@extends('layouts.app')
@section('breadcrumbs', Breadcrumbs::render())

@push('styles')
@endpush

@push('scripts')
@if(!empty(Session::get('show_only_true')))
    <script>
        $(function () {
        @if (Session::get('show_only_true'))
            jQuery('.btn-show-true').trigger("click");
        @else
            jQuery('.btn-show-false').trigger("click");
        @endif
        });
    </script>
@endif
@endpush

@section('content')
<div class="container user-select-none">
    <div class="row">
        <div class="col-sm d-flex">
            <div class="card flex-fill">
                <div class="card-header">
                    <h5 class="d-inline">{!! $category->name !!}</h5>
                    @if ($questions->count() > 0)
                    @mobile
                    <div class="dropdown float-right print-none">
                        <a  type="button" id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-ellipsis-v"></i></a>
                        <div class="dropdown-menu dropdown-primary dropdown-menu-right">
                            <a class="dropdown-item" href="javascript:window.print();"><i class="fas fa-fw fa-print"></i>&nbsp;&nbsp;Yazdır</a>
                        </div>
                    </div>
                    @elsemobile
                    <div class="float-right print-none">
                        <a class="btn btn-success btn-sm btn-show-true" data-href="{{ route('trueanswers', 'true') }}"><i class="fas fa-fw fa-check"></i> {{ __('all.show_true_answers') }}</a>
                        <a class="btn btn-danger btn-sm btn-show-false" data-href="{{ route('trueanswers', 'false') }}" style="display: none"><i class="fas fa-fw fa-align-left"></i> {{ __('all.show_all_answers') }}</a>&nbsp;
                        <a class="btn btn-primary btn-sm btn-print"><i class="fas fa-fw fa-print"></i> {{ __('all.print') }}</a>
                    </div>
                    @endmobile
                    @endif
                </div>
                <div class="card-body">
                    @if ($questions->count() == 0)
                        Sorular eklenmedi
                    @endif
                    @for ($i = 0; $i < $questions->count(); $i++)
                        <a id="question-{{ $questions[$i]->id }}"></a>
                        <p class="card-text font-weight-bold">
                            {!! $i + 1 . "-" !!}{!! $questions[$i]->question !!}
                            @if ($questions[$i]->info_link != '')
                                <a href="{{ $questions[$i]->info_link }}" class="print-none" data-toggle="tooltip" data-placement="top" title="Detaylı bilgi için tıklayın..." target="_blank"><i class="fas fa-info-circle text-info mx-2 fa-fw fa-lg"></i></a>
                            @endif
                        </p>
                        <div class="d-flex flex-column">
                            <div{!! $questions[$i]->answer_1_true ? "" : " class='print-none hide-false-answer'" !!}><i class="fas {!! $questions[$i]->answer_1_true ? "fa-check text-success" : "fa-times" !!} mx-2 fa-fw print-none"></i> {!! $questions[$i]->answer_1 !!}</div>
                            <div{!! $questions[$i]->answer_2_true ? "" : " class='print-none hide-false-answer'" !!}><i class="fas {!! $questions[$i]->answer_2_true ? "fa-check text-success" : "fa-times" !!} mx-2 fa-fw print-none"></i> {!! $questions[$i]->answer_2 !!}</div>
                            <div{!! $questions[$i]->answer_3_true ? "" : " class='print-none hide-false-answer'" !!}><i class="fas {!! $questions[$i]->answer_3_true ? "fa-check text-success" : "fa-times" !!} mx-2 fa-fw print-none"></i> {!! $questions[$i]->answer_3 !!}</div>
                            <div{!! $questions[$i]->answer_4_true ? "" : " class='print-none hide-false-answer'" !!}><i class="fas {!! $questions[$i]->answer_4_true ? "fa-check text-success" : "fa-times" !!} mx-2 fa-fw print-none"></i> {!! $questions[$i]->answer_4 !!}</div>
                        </div>
                        @if ($questions->count() -1 != $i)
                        <hr class="print-none" />
                        @endif
                    @endfor
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
