<?php
    define ('HOST','localhost');
    define ('USER','root');
    define ('PASS','');
    define ('DB','movies');

    $db = mysqli_connect(HOST, USER, PASS, DB);
    mysqli_set_charset($db, "UTF8");
?>
