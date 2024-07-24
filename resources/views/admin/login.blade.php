<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>

<div class="container">
  <h2>LOGIN</h2>
  
@if(Session::has('error'))

<div class="alert alert-danger">

    {{Session::get('error')}}
</div>
@endif

  <form method="POST" action="{{route('admin.store')}}">
    <div class="form-group">
      <label for="email">Email:</label>
      <input type="email" class="form-control col-md-6" id="email" placeholder="Enter email" name="email">
      @error('email')
      <div class="alert alert-danger">{{$message}}</div>
      @enderror
    </div>
    <input type="hidden" name="_token" value="{{ csrf_token() }}" />
    <div class="form-group">
      <label for="password">Password:</label>
      <input type="password" class="form-control col-md-6" id="password" placeholder="Enter password" name="password">
      @error('password')
      <div class="alert alert-danger">{{$message}}</div>
      @enderror
    </div>
    <div class="checkbox">
      <label><input type="checkbox" name="remember"> Remember me</label>
    </div>
    <button type="submit" class="btn btn-primary">LOGIN</button>
  </form>
</div>

</body>
</html>
