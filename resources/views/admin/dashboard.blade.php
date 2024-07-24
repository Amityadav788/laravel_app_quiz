@extends('admin.admin_layout.admin')
@section('content')

<section>

<div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
      <div class="item active">
        <img src="https://fastly.picsum.photos/id/43/1280/831.jpg?hmac=glK-rQ0ppFClW-lvjk9FqEWKog07XkOxJf6Xg_cU9LI" alt="New York" width="1600" height="700">
        <div class="carousel-caption">
          <h3>New York</h3>
          <p></p>
        </div>      
      </div>

      <div class="item">
        <img src="https://media.istockphoto.com/id/474711120/photo/manhattan-bridge-and-skyline-in-new-york.jpg?s=612x612&w=0&k=20&c=5Ul5rLu0ZzI0yol76veh9845yLAcOynRegfW2IUZxIQ=" alt="Chicago" width="1600" height="700">
        <div class="carousel-caption">
          <h3>Chicago</h3>
          <p></p>
        </div>      
      </div>
    
      <div class="item">
        <img src="https://images.unsplash.com/photo-1466285746891-30d1cd3a5409?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" alt="Los Angeles" width="1600" height="700">
        <div class="carousel-caption">
          <h3>LA</h3>
          <p></p>
        </div>      
      </div>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
</div>

</section>

@endsection