@extends('admin.admin_layout.admin')
@section('content')

<div class="container-box">
    <br>
<table class="table table-hover table-bordered ">
 
  <thead>
    <tr>
      <th scope="col">Id</th>
      <th scope="col">Question</th>
      <th scope="col">Answer</th>
      <th scope="col">Right answer</th>
    </tr>
  </thead>
  <tbody>
    <?php foreach($results as $key => $value){ ?>
    <tr>
      <th><?php echo $value['id']; ?></th>
      <td><?php echo $value['question'] ?></td>
      <?php if($value['answer'] == $value['right_answer']){ ?>
         <td class="alert alert-success"><?php echo $value['answer']; ?></td>
      <?php } else{ ?>
          <td class="alert alert-danger"><?php echo $value['answer']; ?></td>
      <?php } ?>  
      <td><?php echo $value['right_answer']; ?></td>
    </tr>

<?php } ?>
<tr>
        <td colspan="2"></td>
        <td class="text-center" style="background:#000;color:#fff">Score</td>
        <td class="text-center" style="background:#000;color:#fff"><?php echo $output; ?></td>
</tr>
</tbody>

</table>
</div>

@endsection