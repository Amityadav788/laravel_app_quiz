@extends('admin.admin_layout.admin')
@section('content')

<div class="container-fluid jumbotron">

      <div class="row">

          @if(Session::has('success'))
            <div class="alert alert-success">
            {{Session::get('success')}}
            </div>
          @endif

          @if(Session::has('error'))
          <div class="alert alert-error">
            {{Session::get('error')}}
          </div>
          @endif

      <form method="POST" action="{{route('test.store')}}">
          <div class="col-md-6">

              <input type="hidden" name="_token" value="{{ csrf_token() }}" />
              <div class="form-group">
                <label for="name">Test Name</label>
                <input type="text" class="form-control" id="test_name" placeholder="Enter test name" name="test_name">
                @error('test_name')
                <div class="alert alert-danger">{{$message}}</div>
                @enderror
              </div>
              <div class="form-group">
                <label for="date">Test Date</label>
                <input type="date" class="form-control" min="2015-01-01"
                  max="2025-12-31" id="Test_DatetimeLocal" placeholder="Enter date" name="test_date">
              @error('test_date')
                <div class="alert alert-danger">{{$message}}</div>
                @enderror
              </div>
              <div class="form-group">
                <label for="subject">Test Subject</label>
                <select class="form-control" id="test_subject" name="test_subject" placeholder="Enter subject" value="">
                  <?php foreach($subject as $key => $value){ ?>
                  <option value="<?php echo $value['id']; ?>"><?php echo $value['title']; ?></option>
                  <?php } ?>
                </select>
                @error('test_subject')
                <div class="alert alert-danger">{{$message}}</div>
                @enderror
              </div>
              <?php foreach($question as $key => $val){ ?> 
              <input type="hidden" name="question_id" value="{{$val->id}}">
              <?php } ?>

            <div class="checkbox">
              <label><input type="checkbox" name="remember"> Remember me</label>
            </div>
            <button type="submit" class="btn btn-default">Add</button>
      </form>
      </div>
</div>
</section>

@endsection


