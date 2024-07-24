<!DOCTYPE html>
<html lang="en">

<head>
@include('admin.partials.head')
</head>

<body>
@include('admin.partials.header')
<div style="min-height:600px; max-height:900px;">
@yield('content')    
</div>    

@include('admin.partials.footer')
</body>

@include('admin.partials.footer-script')

</html>