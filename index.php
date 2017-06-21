<!DOCTYPE html>
<html>
<?php
  include_once("head.php");
  include_once("config.php");
 ?>
<body>
  <?php
    include_once("header.php");

  ?>
<!-- Fotorama -->
<div class="fotorama"
   data-fit="cover"
   data-width="100%"
   data-ratio="16/9"
   data-max-width="100%"
   data-arrows="true"
   data-click="true"
   data-swipe="true"
   data-loop="true">

  <img src="img/batman_v_superman_horizontal.jpg">
  <img src="img/brooklyn_horizontal.jpg">
  <img src="img/x_men_horizontal.jpg">
  <img src="img/revenant.jpg">
  <img src="img/zootopia_horizontal.jpg">
</div>



<div>
<div>
  <!-- Nav tabs -->
  <a name="schedule"></a>
  <ul class="nav nav-tabs calendar" role="tablist">
    <?php
    $query = mysqli_query($db, "SELECT * FROM `schedule` ORDER BY `time`");

    if (mysqli_num_rows($query) > 0) {
      $schedule = mysqli_fetch_all($query);
      $days = array();

      foreach ($schedule as $key => $value) {
        $day = date('j', strtotime($value[2]));
        $month = date('M', strtotime($value[2]));

        if (true) {
          array_push($days, $day.'_'.$month);
        }

      }

      $days = array_unique($days);

      foreach ($days as $day) {
        $str = str_replace('_', ' ', $day);
        $active = $days[0] == $day ? 'active' : '';

        echo '<li
          role="presentation"
          class="calendar-day '.$active.'">
          <a href="#'.$day.'"
            aria-controls="'.$day.'"
            role="tab"
            data-toggle="tab">
            '.$str.'
          </a>
        </li>';
      }
    }
    ?>
    <!-- <li role="presentation" class="calendar-day active"><a href="#17May" aria-controls="17May" role="tab" data-toggle="tab">17 May</a></li>
    <li role="presentation" class="calendar-day"><a href="#18May" aria-controls="18May" role="tab" data-toggle="tab">18 May</a></li>
    <li role="presentation" class="calendar-day"><a href="#19May" aria-controls="19May" role="tab" data-toggle="tab">19 May</a></li>
    <li role="presentation" class="calendar-day"><a href="#20May" aria-controls="20May" role="tab" data-toggle="tab">20 May</a></li>
    <li role="presentation" class="calendar-day"><a href="#21May" aria-controls="21May" role="tab" data-toggle="tab">21 May</a></li>
    <li role="presentation" class="calendar-day"><a href="#22May" aria-controls="22May" role="tab" data-toggle="tab">22 May</a></li>
    <li role="presentation" class="calendar-day"><a href="#23May" aria-controls="23May" role="tab" data-toggle="tab">23 May</a></li> -->
  </ul>
</div>

  <!-- MOVIE + TICKETS -->
<!--<?php
  //include_once("schedulebatmen.php");
  // include_once("schedulezoo.php");
  // include_once("scheduledeadpool.php");
  // include_once("schedulebrooklyn.php");
  // include_once("schedulecapitan.php");
  // include_once("scheduleX-Men.php");
  // include_once("scheduleRevenant.php");
?>-->


  <!-- Tab panes -->
  <div class="tab-content">
    <?php
      foreach ($days as $day) {
        $active = $days[0] == $day ? 'active' : '';

        echo '<div role="tabpanel" class="tab-pane '.$active.'" id="'.$day.'">';
        include('schedule.php');
        echo '</div>';
      }
    ?>
  </div>

</div>
<?php
  include_once("comingSoon.php");
  include_once("footer.php");

 ?>

</body>
</html>
