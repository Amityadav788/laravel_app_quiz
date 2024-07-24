@extends('admin.admin_layout.admin')
@section('content')

<section>
<div class="container-box">
    <h2>TEST LIST</h2>
    <br>
<table class="table table-striped">
  <thead class="thead-dark">
    <tr>
      <th scope="col">Id</th>
      <th scope="col">Test Name</th>
      <th scope="col">Test Date</th>
      <th scope="col">Test Subject</th>
      <th scope="col">Action</th>
      
    </tr>
  </thead>
  <tbody>
    <?php foreach($list as $key => $value){ ?>
    <tr>
      <th><?php echo $value['id']; ?></th>
      <td><?php echo $value['test_name']; ?></td>
      <td><?php echo $value['test_date']; ?></td>
      <td <?php echo $value['subject_id']; ?>><?php echo $value->subjects->title?></td>
      <td>
        <a role="button" class="btn btn-success" href="/test/question/list/<?php echo $value['id']; ?>">View Question</a>
        <?php if($admin){ ?>
  
        <a role="button" class="btn btn-info" href="/test/edit/<?php echo $value['id']; ?>">Edit</a>
     
      <?php } ?>
      </td>
    </tr>
<?php } ?>
  </tbody>
</table>
{{$list->links()}}

</div>
</section>

@endsection