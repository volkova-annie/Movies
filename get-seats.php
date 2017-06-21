<?php
  include_once "function.php";
  $schedule_id = $_GET['schedule_id'];

  if (!empty($schedule_id)) {
   $query = mysqli_query($db, "
    SELECT * FROM `ticket` WHERE `id_schedule` = '$schedule_id';
   ");
   if (mysqli_num_rows($query) > 0) {
     $tickets = mysqli_fetch_all($query);

     echo json_encode($tickets);
   }
   else {
     echo '[]';
   }
  }
?>
