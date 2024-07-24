@extends('admin.admin_layout.admin')
@section('content')

<section>

<div class="sub-container">
  <h2>EDIT DETAILS</h2>

  @if(Session::has('error'))

<div class="alert alert-danger">

    {{Session::get('error')}}
</div>
@endif

@if(Session::has('success'))

<div class="alert alert-success">

    {{Session::get('success')}}
</div>
@endif

  <form action="{{route('subject.update')}}" method="POST" enctype="multipart/form-data">
    <div class="form-group">
      <label for="title">Title</label>
      <input type="text" class="form-control col-md-5" id="title" placeholder="Enter email" name="title" value="{{$data->title}}">
      @error('title')
      <div class="alert alert-danger">{{$message}}</div>
      @enderror
    </div>
    <input type="hidden" name="_token" value="{{ csrf_token() }}" />
    <br>
    @if($data->image)
    <img class="img-circle" src="<?php echo asset("storage").'/images/'.$data->image; ?>">
    @else
    
  @endif
    <div class="form-group">
      <label for="image">Image</label>
      <input type="file" class="form-control col-md-5" id="image" placeholder="" name="image" value="{{$data->image}}">
      <input type="hidden" name="old_image" value="{{$data->image}}">
      @error('image')
      <div class="alert alert-danger">{{$message}}</div>
      @enderror
    </div>
    <input type="hidden" id="name" name="id" value="{{$data->id}}"> 
    <div class="checkbox">
      <label><input type="checkbox" name="remember"> Remember me</label>
    </div>
    <button type="submit" class="btn btn-success">Add</button>
  </form>
</div>

</section>

@endsection