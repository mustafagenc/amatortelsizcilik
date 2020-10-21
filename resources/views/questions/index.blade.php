@extends('layouts.app')

@section('content')
<div class="container user-select-none">
    <div class="row">
        <div class="col-sm d-flex">
            <div class="card flex-fill">
                <div class="card-header">
                    <h5 class="d-inline">{!! $category->name !!}</h5>
                    @if ($questions->count() > 0)
                    <div class="dropdown float-right print-none">
                        <a  type="button" id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-ellipsis-v"></i></a>
                        <div class="dropdown-menu dropdown-primary">
                            <a class="dropdown-item" href="javascript:window.print();"><i class="fas fa-fw fa-print"></i>&nbsp;&nbsp;Yazdır</a>
                        </div>
                    </div>
                    @endif
                </div>
                <div class="card-body">
                    @if ($questions->count() == 0)
                        Sorular eklenmedi
                    @endif
                    @for ($i = 0; $i < $questions->count(); $i++)
                        <p class="card-text font-weight-bold">
                            {!! $i + 1 . "-" !!}{!! strip_tags($questions[$i]->question) !!}
                            @if ($questions[$i]->info_link != '')
                                <a href="{{ $questions[$i]->info_link }}" class="print-none" data-toggle="tooltip" data-placement="top" title="Detaylı bilgi için tıklayın..." target="_blank"><i class="fas fa-info-circle text-info mx-2 fa-fw fa-lg"></i></a>
                            @endif
                        </p>
                        <div class="d-flex flex-column">
                            <div{!! $questions[$i]->answer_1_true ? "" : " class='print-none'" !!}><i class="fas {!! $questions[$i]->answer_1_true ? "fa-check text-success" : "fa-times" !!} mx-2 fa-fw"></i> {!! strip_tags($questions[$i]->answer_1) !!}</div>
                            <div{!! $questions[$i]->answer_2_true ? "" : " class='print-none'" !!}><i class="fas {!! $questions[$i]->answer_2_true ? "fa-check text-success" : "fa-times" !!} mx-2 fa-fw"></i> {!! strip_tags($questions[$i]->answer_2) !!}</div>
                            <div{!! $questions[$i]->answer_3_true ? "" : " class='print-none'" !!}><i class="fas {!! $questions[$i]->answer_3_true ? "fa-check text-success" : "fa-times" !!} mx-2 fa-fw"></i> {!! strip_tags($questions[$i]->answer_3) !!}</div>
                            <div{!! $questions[$i]->answer_4_true ? "" : " class='print-none'" !!}><i class="fas {!! $questions[$i]->answer_4_true ? "fa-check text-success" : "fa-times" !!} mx-2 fa-fw"></i> {!! strip_tags($questions[$i]->answer_4) !!}</div>
                        </div>
                        @if ($questions->count() -1 != $i)
                        <hr />
                        @endif
                    @endfor
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
