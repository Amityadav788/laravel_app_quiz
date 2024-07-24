@extends('admin.admin_layout.admin')
@section('content')

<section>

<div class="container-box">
  <h2>SUBJECT LIST</h2>

  @if (Session::has('success'))
  <div class="alert alert-success">
     {{Session::get('success')}}
  </div>  
  @endif   

  <p></p>            
  <table class="table table-striped">
    <thead>
      <tr>
        <th>#</th>
        <th>Image</th>
        <th>Title</th>
        <?php if($admin =session()->get('is_admin')){ ?>
        <th>Action</th>
        <?php } ?>
      </tr>
    </thead>
    <tbody>
        <?php foreach($data as $key => $val){ ?>
      <tr>
        <td><?php echo $val['id']; ?></td>
        <td><img class="img-circle" src="<?php echo asset("storage").'/images/'.$val->image; ?>"></td>
        <td><?php echo $val['title']; ?></td>
        <td>
          <?php if($admin =session()->get('is_admin')){ ?>
            <a role="button" class="btn btn-danger" href="/admin/destroy/<?php echo $val->id; ?>">Delete</a>
            <a role="button" class="btn btn-info" href="/admin/edit/<?php echo $val->id; ?>">Edit</a>
          <?php } ?>  
        </td>
      </tr>
      <?php } ?>
    </tbody>
  </table>
  {{$data->links()}}
</div>
</body>
</html>

</section>

@endsection