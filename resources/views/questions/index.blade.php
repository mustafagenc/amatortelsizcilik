@extends('layouts.app')
@section('breadcrumbs', Breadcrumbs::render())

@push('styles')
@endpush

@push('scripts')
@endpush

@section('content')
<div class="container">
    <div class="row">

        @foreach($categories as $category)
            <div class="col-sm">
            <div class="card">
                <h5 class="card-header">
                {{ $category['name'] }}
                </h5>
                <ul class="list-group list-group-flush">
                    @foreach($category['questions'] as $question)
                        <li class="list-group-item"><x-icon type="bi-chevron-right" fill="black" /> {!! $question['question'] !!}</li>
                    @endforeach
                </ul>
                <div class="card-footer">
                    <a class="card-link"  href="{{ route('questions_detail', $category['id']) }}">{{ __('all.all_questions') }}</a>
                </div>
            </div>
            </div>
        @endforeach

    </div>
</div>
@endsection
