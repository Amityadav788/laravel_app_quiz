@extends('admin.admin_layout.admin')
@section('content')


<div class="container-fluid jumbotron">

  <div class="row">

    @if(Session::has('success'))
    <div class="alert alert-success">
      {{Session::get('success')}}
    </div>
    @endif

    <h2>EDIT</h2>
    <form action="{{route('test.edit.store')}}" method="POST">
      <input type="hidden" name="_token" value="{{ csrf_token() }}">
      <div class="form-group">
        <label for="test_name">Test Name </label>
        <input type="text" class="form-control" id="name" placeholder="Test name" name="test_name" value="{{$data->test_name}}">
        @error('test_name')
        <div class="alert alert-danger">{{$message}}</div>
        @enderror
      </div>
      <div class="form-group">
        <label for="test_date">Test Date</label>
        <input type="date" class="form-control" id="date" placeholder="Test date" name="test_date" value="{{$data->test_date}}">
        @error('test_date')
        <div class="alert alert-danger">{{$message}}</div>
        @enderror
      </div>
      <div class="form-group">
        <label for="test_subject">Test Subject</label>
        <select type="text" class="form-control" name="test_subject" value="{{$data->subject_id}}">
          <?php foreach ($subjects as $key => $value) { ?>
            <option <?php if ($value['id']  == $data->subject_id) {  ?> value="<?php echo $value['id']; ?>" selected><?php echo $value['title']; ?></option>
          <?php } ?>
          <option value="<?php echo $value['id']; ?>"><?php echo $value['title']; ?></option>
        <?php } ?>
        </select>
        @error('test_subject')
        <div class="alert alert-danger">{{$message}}</div>
        @enderror
      </div>     
      <input type="hidden" name="test_id" value="{{$data->id}}">

  </div>

  <div class="col-md-6">

    <?php if (count($question) > 0) { ?>
      
        <table class="table table-striped">
          <thead>
            <tr>
              <th scope="col">Action</th>
              <th scope="col">Question</th>
              <th scope="col">Option1</th>
              <th scope="col">Option2</th>
              <th scope="col">Option3</th>
              <th scope="col">Option4</th>

            </tr>
          </thead>
          <tbody>
            <?php foreach ($question as $key => $value) { ?>
              
              <tr>
                <td>
                  <input type="checkbox" name="question_id[]" value="{{$value->id}}" <?php if(in_array($value->id,$test_questions)) { ?>checked <?php } ?>)>
                </td>
                <td><?php echo $value['question']; ?></td>
                <td><?php echo $value['option1']; ?></td>
                <td><?php echo $value['option2']; ?></td>
                <td><?php echo $value['option3']; ?></td>
                <td><?php echo $value['option4']; ?></td>
              </tr>

          </tbody>

        <?php } ?>
        </table>
      </div>
    <?php } ?>

  </div>
  <div class="form-control"><Button type="submit" class="bnt btn-primary">Save</Button></div>

  </form>
</div>


@endsection