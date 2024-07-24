@extends('admin.admin_layout.admin')
@section('content')

<?php 

use App\Models\User;
use App\Http\Controllers\Auth\LoginController;

$data =User::all();

?>
<div class="container-box">
    <h2></h2>
    <br>
<table class="table table-hover">
  <thead>
    <tr>
      <th scope="col">id</th>
      <th scope="col">Test name</th>
      <th scope="col">Test date</th>
      <th scope="col">Test subject</th>
      <th scope="col">Action</th>
      
    </tr>
  </thead>
  <tbody>
    <?php foreach($tests as $key => $value){  ?>
    <tr>
      <th><?php echo $value->id; ?></th>  
      <th><?php echo $value->test_name; ?></th>
      <td><?php echo $value->test_date; ?></td>
      <td value="<?php echo $value['subject_id']; ?>"><?php echo $value->subjects->title; ?></td>
      <td>
        <a role="button" class="btn btn-primary" href="/test/attempt/<?php echo $value->id; ?>">Attempt</a>
      </td>
    </tr>
    <?php } ?>
  </tbody>
</table>
</div>


@endsection