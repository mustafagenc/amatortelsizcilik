@extends('layouts.app')

@push('styles')

@endpush

@push('scripts')
{!! NoCaptcha::renderJs() !!}
@endpush

@section('breadcrumbs', Breadcrumbs::render())

@section('content')
<div class="container">
    <div class="row">
        <div class="col-sm d-flex">
            <div class="card flex-fill">
                <div class="card-body">
                    @if(Session::has('success'))
                        <div class="alert alert-success">
                            {{Session::get('success')}}
                        </div>
                    @endif
                    <form method="post" action="{{ route('contact.store') }}">
                        @csrf
                        <div class="form-row">
                            <div class="col-md-6 mb-1">
                                <div class="form-group">
                                    <label for="fullname">{{ __('contact.fullname') }}</label>
                                    <input type="text" required class="form-control {{ $errors->has('fullname') ? 'is-invalid' : '' }}" name="fullname" id="fullname">
                                    @if ($errors->has('fullname'))
                                    <div class="invalid-feedback">
                                        {{ $errors->first('fullname') }}
                                    </div>
                                    @endif
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="col-md-6 mb-1">
                                <div class="form-group">
                                    <label for="email">{{ __('contact.email') }}</label>
                                    <input type="email" required class="form-control {{ $errors->has('email') ? 'is-invalid' : '' }}" name="email" id="email">
                                    @if ($errors->has('email'))
                                    <div class="invalid-feedback">
                                        {{ $errors->first('email') }}
                                    </div>
                                    @endif
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="col-md-6 mb-1">
                                <div class="form-group">
                                    <label for="subject">{{ __('contact.subject') }}</label>
                                    <input type="text" required class="form-control {{ $errors->has('subject') ? 'is-invalid' : '' }}" name="subject" id="subject">
                                    @if ($errors->has('subject'))
                                    <div class="invalid-feedback">
                                        {{ $errors->first('subject') }}
                                    </div>
                                    @endif
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="col mb-1">
                                <div class="form-group">
                                    <label for="message">{{ __('contact.message') }}</label>
                                    <textarea required class="form-control {{ $errors->has('message') ? 'is-invalid' : '' }}" name="message" id="message" rows="6"></textarea>
                                    @if ($errors->has('message'))
                                    <div class="invalid-feedback">
                                        {{ $errors->first('message') }}
                                    </div>
                                    @endif
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="col mb-3">
                            {!! NoCaptcha::display() !!}
                            @if ($errors->has('g-recaptcha-response'))
                                <small class="form-text text-danger">
                                    {{ $errors->first('g-recaptcha-response') }}
                                </small>
                            @endif
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="col-md-3 mb-3">
                                <input type="submit" name="send" value="{{ __('contact.submit') }}" class="btn btn-success btn-block">
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
