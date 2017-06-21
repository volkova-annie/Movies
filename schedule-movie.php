<?php
$d = explode('_', $day);
$query = mysqli_query($db, "
select * from `schedule`
  LEFT JOIN `film` USING(`id_film`)
  LEFT JOIN `genre` USING(`id_genre`)
  WHERE `schedule`.`time` BETWEEN '2016-05-$d[0] 00:00:00' AND '2016-05-$d[0] 23:59:59'
  AND `id_film` = $movie_id
  ORDER BY `schedule`.`time`
");
$schedule = mysqli_fetch_all($query);
foreach ($schedule as $film) {
  $film_id = $film[1];
  $schedule_id = $film[2];
  $price = $film[4];

  $query = mysqli_query($db, "
  select * from `tmp_film`
    LEFT JOIN `person` USING(`id_person`)
    LEFT JOIN `status` USING(`id_status`)
    WHERE `id_film` = $film_id
  ");

  $persons = mysqli_fetch_all($query);

  // echo '<pre>';
  // print_r($persons);
  // echo '</pre>';
  // echo '<pre>';
  // print_r($film);
  // echo '</pre>';

  ?>
  <div class = "container schedule">
    <ul class = "schedule-row row">
      <li class = "col-sm-3">
          <img class = "schedule-row-img" src="<?php echo $film[7] ?>">
      </li>
      <li class = "col-sm-9">
        <h3 class = "film-title"><b><?php echo $film[5] ?></b></h3>
        <p class = "film-genre"><?php echo $film[9] ?></p>
        <?php
          $dir = array();
          $wr = array();
          $act = array();

          foreach ($persons as $person) {
            if ($person[5] == 'Director') {
              array_push($dir, $person[4]);
            }
            else if ($person[5] == 'Writer') {
              array_push($wr, $person[4]);
            }
            else if ($person[5] == 'Actor') {
              array_push($act, $person[4]);
            }
          }
        ?>
        <p class = "film-people"><b>Director:</b> <?php echo join(', ', $dir) ?></p>
        <p class = "film-people"><b>Writers:</b> <?php echo join(', ', $wr) ?> </p>
        <p class = "film-people"><b>Stars:</b> <?php echo join(', ', $act) ?></p>
        <div class = "film-seances-all">
        <ul class="col-sm-4 film-seances">
          <li class= "film-seances-time"><b><?php echo date('H:i', strtotime($film[3])); ?></b> </li>
          <li class= "film-seances-price"><?php echo $film[4] ?> RUR </li>
          <li class= "film-seances-button">
            <button type="button" class="btn btn-primary btn-md js-request-movie" data-schedule='<?php echo $schedule_id; ?>' data-price='<?php echo $price; ?>' data-toggle="modal" data-target="#myModal">Buy ticket</button>
          </li>
        </ul>
      </div>
      </li>
    </ul>
  </div>
  <?php
}

// LEFT JOIN `person` USING(`id_person`)
// LEFT JOIN `status` USING(`id_status`)
// LEFT JOIN `genre` USING(`id_genre`)

// echo '<pre>';
// print_r($schedule);
// echo '</pre>';
?>
