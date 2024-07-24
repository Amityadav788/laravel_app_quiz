<?php 

use App\Models\User;

$user_id ='';
if(empty($admin = session()->get('is_admin'))){

$data = App\Models\User::all();

$user_id =Auth::id();

if($user_id){

  $user =User::find($user_id);
  $u_image =$user->image;

}

}


?>
<nav class="navbar navbar-default navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>

      <?php if($user_id){ ?>
      <a class="navbar-brand" href="/user/edit/details/<?php echo $user_id; ?>"><img class="img-rounded"  src="<?php echo asset("storage").'/images/'.$u_image; ?>"></a>
      <?php } ?>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
        <?php if($admin = session()->get('is_admin')){ ?>
        <li><a href="/admin/logout">LOGOUT</a></li>
        <?php } else{ ?>
        <li><a href="/user/logout">LOGOUT</a></li>
        <?php } ?>

        <?php if($admin = session()->get('is_admin')){ ?>

        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">SUBJECT
          <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="/admin/subject/create">Add Subject</a></li>
            <li><a href="/admin/subject/show">Subject LIST</a></li>
          </ul>
        </li>
        <?php } else{ ?>
             <li><a href="/user/attempt/test/">TEST</a></li>
        <?php } ?>  

        <?php if($admin = session()->get('is_admin')){ ?>

        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">QUESTION
          <span class="caret"></span></a>
          <ul class="dropdown-menu">

            <li><a href="/admin/add/questions">Add Question</a></li>
            <li><a href="/admin/question/show">Question LIST</a></li>
          </ul>
        </li>
        <?php } ?>

        <?php if($admin = session()->get('is_admin')){ ?>

        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">TEST
          <span class="caret"></span></a>
          <ul class="dropdown-menu">

            <li><a href="/admin/test/create">Add Test</a></li>
            <li><a href="/admin/test/list">Test LIST</a></li>
          </ul>
        </li>
        <?php } ?>

        <li><a href=""><span class="glyphicon glyphicon-search"></span></a></li>
      </ul>
    </div>
  </div>
</nav>