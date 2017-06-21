<?php
if ($_SERVER['REQUEST_URI'] == '/cinema/index.php') {
  $link = '';
}
else {
  $link = 'index.php';
}

include_once "function.php";
$user = getUser();

if (isset($_GET['error_message'])) {
  echo '<div class="alert alert-fixed alert-danger alert-dismissible" role="alert">
    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
    <strong>Warning!</strong> '.$_GET['error_message'].'
  </div>';
}
?>


    <nav class="navbar navbar-fixed-top navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="index.php"><img src="img/logo.svg" width="90em"></a>
    </div>




    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li <?php if ($_SERVER['REQUEST_URI'] == '/cinema/index.php') {echo 'class="active"';} ?>><a href="index.php">HOME</a></li>
        <li><a href="<?php echo $link ?>#schedule">MOVIES+TICKETS</a></li>
        <li <?php if ($_SERVER['REQUEST_URI'] == '/cinema/contact.php') {echo 'class="active"';} ?>><a href="contact.php">CONTACTS</a></li>
        <li <?php if ($_SERVER['REQUEST_URI'] == '/cinema/about.php') {echo 'class="active"';} ?>><a href="about.php">CINEMA</a></li>
      </ul>

      <ul class="nav navbar-nav navbar-right">
        <?php
        if (empty($user)) {
          echo '<li><a href="#" data-toggle="modal" data-target="#login-modal"><span class="glyphicon glyphicon-log-in" ></span> Login</a></li>';
        }
        else {
          echo '<li><a href="exit.php"><span class="glyphicon glyphicon-log-out" ></span> Logout</a></li>';
        }
        ?>
      </ul>
    </div>
      <!-- <form class="navbar-form navbar-left" role="search">
        <div class="form-group">
            <input type="text" class="form-control" placeholder="Enter movie">
        </div>
        <button type="submit" class="btn btn-default">GO!</button>
    </form> -->

  </div>
</nav>
