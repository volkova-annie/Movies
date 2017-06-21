<?php
include_once "function.php";
$schedule_id = $_GET['schedule_id'];
$book_name = $_GET['book_name'];
$book_email = $_GET['book_email'];
$seats = $_GET['seats'];

$seatsArray = json_decode($seats);

foreach ($seatsArray as $place) {
  $row = $place->row;
  $seat = $place->seat;
  $query = mysqli_query($db, "
    INSERT INTO `ticket` SET
      `num_row` = '$row',
      `num_seat`  = '$seat',
      `id_schedule` = '$schedule_id',
      `buyer_name` = '$book_name',
      `buyer_email` = '$book_email';

  ");
}

echo 'OK';

// if (!empty($schedule_id)) {
//  $query = mysqli_query($db, "
//   SELECT * FROM `ticket` WHERE `id_schedule` = '$schedule_id';
//  ");
//  if (mysqli_num_rows($query) > 0) {
//    $tickets = mysqli_fetch_all($query);
//
//    echo json_encode($tickets);
//  }
//  else {
//    echo '[]';
//  }
// }
?>
