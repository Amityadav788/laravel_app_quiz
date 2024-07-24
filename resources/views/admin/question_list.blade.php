@extends('admin.admin_layout.admin')
@section('content')

<section>
  <div class="container-box">
    <h2>QUESTION LIST</h2>

    @if (Session::has('success'))
    <div class="alert alert-success">
      {{Session::get('success')}}
    </div>
    @endif

    <p></p>
    <table class="table table-striped">
      <thead>
        <tr>
          <th scope="col">#</th>
          <th scope="col">Question</th>
          <th scope="col">Option1</th>
          <th scope="col">Option2</th>
          <th scope="col">Option3</th>
          <th scope="col">Option4</th>
          <th scope="col">Right Answer</th>
          <th scope="col">Selected Subject</th>
          <?php if ($admin = session()->get('is_admin')) { ?>
            <th scope="col">Action</th>
          <?php } ?>

        </tr>
      </thead>
      <tbody>
        <?php foreach ($data as $key => $value) {  ?>
          <tr>
            <td><?php echo $value['id']; ?></td>
            <td><?php echo $value['question']; ?></td>
            <td><?php echo $value['option1']; ?></td>
            <td><?php echo $value['option2']; ?></td>
            <td><?php echo $value['option3']; ?></td>
            <td><?php echo $value['option4']; ?></td>
            <td><?php echo $value['right_answer']; ?></td>
            <td><?php echo ($value->subject) ? $value->subject->title : ''; ?></td>
            <td>
              <a role="button" href="/admin/question/destroy/<?php echo $value['id']; ?>" class="btn btn-danger">Delete</a>
              <a role="button" href="/admin/question/edit/<?php echo $value['id']; ?>" class="btn btn-info">Edit</a>
            </td>
          </tr>
        <?php } ?>
      </tbody>
    </table>
    
    <div style="display: flex; justify-content:center;">
      {{$data->links()}}
    </div>


</section>

@endsection