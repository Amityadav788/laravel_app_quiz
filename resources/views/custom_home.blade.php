@extends('layouts.app')
@section('content')

<section>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">{{ __('Dashboard') }}</div>

                <div class="card-body">
                    @if (session('status'))
                        <div class="alert alert-success" role="alert">
                            {{ session('status') }}
                        </div>
                    @endif

                    {{ __('you are in myhome!') }}
                </div>
            </div>
        </div>
    </div>
</div>


</section>

@stop