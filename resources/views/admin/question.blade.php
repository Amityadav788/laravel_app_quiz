@extends('admin.admin_layout.admin')
@section('content')

<section>

<div class="container-que ">
  
@if(Session::has('success'))
<div class="alert alert-success"></div>
{{Session::get('success')}}
</div>
@endif

@if(Session::has('error'))
<div class="alert alert-success"></div>
{{Session::get('error')}}
</div>
@endif

<br><br> 
<h2></h2>
  <form method="POST" action="{{route('question.store')}}">
    <div class="form-group">
      <label for="que">Question</label>
      <input type="text" class="form-control" id="question" placeholder="Enter question" name="question" value="{{old('question')}}">
      @error('question')
      <div class="alert alert-danger">{{$message}}</div>
     @enderror 
    </div>
    <div class="form-group">
      <label for="option1">Option1</label>
      <input type="text" class="form-control" id="option1" placeholder="option1" name="option1" value="{{old('option1')}}">
      @error('option1')
      <div class="alert alert-danger">{{$message}}</div>
     @enderror 
    </div>
    <div class="form-group">
      <label for="option2">Option2</label>
      <input type="text" class="form-control" id="option2" placeholder="option2" name="option2" value="{{old('option2')}}">
      @error('option2')
      <div class="alert alert-danger">{{$message}}</div>
     @enderror 
    </div>
    <div class="form-group">
      <label for="option3">Option3</label>
      <input type="text" class="form-control" id="option3" placeholder="option3" name="option3" value="{{old('option3')}}">
      @error('option3')
      <div class="alert alert-danger">{{$message}}</div>
     @enderror 
    </div>
    <input type="hidden" name="_token" value="{{ csrf_token() }}" />
    <div class="form-group">
      <label for="option4">Option4</label>
      <input type="text" class="form-control" id="option4" placeholder="option4" name="option4" value="{{old('option4')}}">
      @error('option4')
      <div class="alert alert-danger">{{$message}}</div>
     @enderror 
    </div>
    <div class="form-group">
      <label for="answer">Right Answer</label>
      <input type="text" class="form-control" id="right-answer" placeholder="right answer" name="right_answer" value="{{old('right_answer')}}">
      @error('right_answer')
      <div class="alert alert-danger">{{$message}}</div>
     @enderror 
    </div>
    <div class="form-group">
        <label for="select_subject">Select Subject</label>
        <select class="form-control" name="select_subject" id="select" value="{{old('select_subject')}}">
           <?php foreach ($data as $key=>$value){?>
                <option value="<?php echo $value['id'];?>"><?php echo $value['title']; ?></option>
                <?php } ?>
        </select>
    </div>
    <div class="checkbox">
      <label><input type="checkbox" name="remember"> Remember me</label>
    </div>
    <button type="submit" class="btn btn-default">Submit</button>
  </form>
</div>

</section>

@endsection