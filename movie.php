<!DOCTYPE html>
<html>

<?php
  $movie_id = $_GET['movie_id'];
  include_once("head.php");
 ?>

<body>
  <?php
    include_once("header.php");

    $query_schedule = mysqli_query($db, "
     SELECT * FROM `schedule`
     WHERE `id_film` = $movie_id
     ORDER BY `time` ");

    $query_film = mysqli_query($db, "
      SELECT * FROM `film`
      WHERE `id_film` = $movie_id
    ");

    if (mysqli_num_rows($query_schedule) > 0) {
      $schedule = mysqli_fetch_all($query_schedule);
      $movie = mysqli_fetch_assoc($query_film);
      $days = array();

      foreach ($schedule as $key => $value) {
        $day = date('j', strtotime($value[2]));
        $month = date('M', strtotime($value[2]));

        if (true) {
          array_push($days, $day.'_'.$month);
        }

      }

      $days = array_unique($days);
  ?>

<!-- <div class = "schedule-none"></div> -->

   <div>
     <!-- Nav tabs -->
     <a name="schedule"></a>
     <ul class="nav nav-tabs calendar" role="tablist">
       <?php
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
       ?>
       </ul>
   </div>



     <!-- Tab panes -->
     <div class="tab-content">
       <?php
         foreach ($days as $day) {
           $active = $days[0] == $day ? 'active' : '';

           echo '<div role="tabpanel" class="tab-pane '.$active.'" id="'.$day.'">';
           include('schedule-movie.php');
           echo '</div>';
         }
       ?>
     </div>

   </div>
   <!-- <div class = "schedule-none"></div> -->
  <div class="container">
   <div class="row">
     <div class="col-xs-12">
        <h3>Storyline</h3>
        <p><?php echo $movie['storyline']; ?></p>

      </div>

   <div class="video col-xs-12">
     <!-- <h2>Trailer</h2> -->
     <iframe width="100%" height="480" src="<?php echo $movie['video']; ?>" frameborder="0" allowfullscreen></iframe>
   </div>
   </div>
</div>

  <?php
  }
  include_once("footer.php");
   ?>
</body>
</html>
