<!DOCTYPE html>
<html lang="en">

<head>

  @include('templates.head')
  <title>Sistem Informasi Pergudangan</title>

</head>

<body>

  <div class="d-flex" id="wrapper">

    <!-- Sidebar -->
    @include('templates.sidebar')
    <!-- /#sidebar-wrapper -->

    <!-- Page Content -->
    <div id="page-content-wrapper">

      @include('templates.header')

      <div class="container-fluid">
        <h3 class="mt-4">Selamat Datang di Sistem Informasi Pergudangan</h3>
        <br><center><p>Repost by <a href='https://stokcoding.com/' title='StokCoding.com' target='_blank'>StokCoding.com</a></p></center>
        
      </div>
    </div>
    <!-- /#page-content-wrapper -->

  </div>
  <!-- /#wrapper -->

  <!-- Bootstrap core JavaScript -->
  @include('templates.scripts')

</body>

</html>
