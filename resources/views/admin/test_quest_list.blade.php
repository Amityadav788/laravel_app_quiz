@extends('admin.admin_layout.admin')
@section('content')

<section>
    <div class="container-box">
      <h2>Questions List</h2>
<table class="table table-striped">
  <thead>
    <tr>
      <th scope="col">Id</th>
      <th scope="col">Question</th>
      <th scope="col">Option1</th>
      <th scope="col">Option2</th>
      <th scope="col">Option3</th>
      <th scope="col">Option4</th>
    </tr>
  </thead>
  <tbody>
    <?php if($test_quest){ ?>
    <?php foreach($test_quest as $key => $value){  ?>
    <tr>
      <th><?php echo $value->test_quest['id']; ?></th>
      <td><?php echo $value->test_quest['question']; ?></td>
      <td><?php echo $value->test_quest['option1']; ?></td>
      <td><?php echo $value->test_quest['option2']; ?></td>
      <td><?php echo $value->test_quest['option3']; ?></td>
      <td><?php echo $value->test_quest['option4']; ?></td>
    </tr>
   <?php } ?> 
   <?php } else{ ?>
    <div>
    <th>Sorry , No data is available</th>
  </div>
  <?php } ?>
  </tbody>
</table>
  </div>
 
</section>

@endsection