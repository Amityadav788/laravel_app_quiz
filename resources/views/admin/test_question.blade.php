@extends('admin.admin_layout.admin')
@section('content')

<section>

  <div class="container-box">

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

    <?php if (count($questions) > 0) { ?>
      <h2></h2>
      <p></p>
      <form action="{{route('test.question')}}" method="POST">
        <table class="table table-hover">
          <input type="hidden" name="_token" value="{{ csrf_token() }}" />
          <thead>
            <tr>
              <th>Action</th>
              <th>Test Subject</th>
              <th>Question</th>
              <th>Option1</th>
              <th>Option2</th>
              <th>Option3</th>
              <th>Option4</th>

            </tr>
          </thead>
          <tbody>
            <?php foreach ($questions as $key => $value) {  ?>
              <tr>
                <td><input type="checkbox" name="question_id[]" value="{{$value->id}}"></td>
                <td><?php echo $value->subject->title; ?></td>
                <td><?php echo $value['question']; ?></td>
                <td><?php echo $value['option1']; ?></td>
                <td><?php echo $value['option2']; ?></td>
                <td><?php echo $value['option3']; ?></td>
                <td><?php echo $value['option4']; ?></td>
              </tr>
            <?php } ?>
          </tbody>
        </table>

        <input type="hidden" name="test_id" value="{{$test->id}}">
        <button type="submit" class="btn btn-primary">Submit</button>

      </form>
      <div>
      <?php } else { ?>
        <h3>Sorry, no data is available </h3>
      <?php } ?>
      </div>
  </div>


</section>

@endsection