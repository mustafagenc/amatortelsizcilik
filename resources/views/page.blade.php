@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-12">
            <h2>{{ $page->title }}</h2>
                <!-- <img src="{{ Voyager::image( $page->image ) }}" style="width:100%"> -->

                @if ($page->excerpt != $page->title)
                    <div class="alert alert-info" role="alert">
                    <i class="fas fa-lightbulb"></i> {{ $page->excerpt }}
                    </div>
                @endif

            {!! $page->body !!}
        </div>
    </div>
</div>
@endsection
