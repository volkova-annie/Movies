<?php
	include_once "config.php";
	$db = mysqli_connect(HOST, USER, PASS, DB);
	mysqli_set_charset($db, "utf8");
	function getHash() {
		$str  = "abcdefghijklmnopqrstuvwxyz0123456789";
		$hash = '';
		for ($i = 0; $i < 32; $i++) {
			$hash.= $str[rand(0, 35)];
		}
		return $hash;
	}

	function getUser($flag = FALSE) {
		global $db;
		if (isset($_COOKIE['s']) AND isset($_COOKIE['t'])) {
			$session = $_COOKIE['s'];
			$token   = $_COOKIE['t'];
			$query   = mysqli_query($db, "
				SELECT `user`.* FROM `user`
				LEFT JOIN `connect` ON( `user`.`id` = `connect`.`id_user` )
				WHERE `session` = '$session'
				AND   `token`   = '$token';
			");
			if (mysqli_num_rows($query) != 1) {
				$query = mysqli_query($db, "
					SELECT `id_user` FROM `connect`
					WHERE `session` = '$session';
				");
				setcookie('s', '');
				setcookie('t', '');
				if (mysqli_num_rows($query) > 0) {
					mysqli_query($db, "
						DELETE FROM `connect`
						WHERE `session` = '$session';
					");
				}
				if ($flag) header("Location: index.php");
				else return array();
			}
			else {
				return mysqli_fetch_assoc($query);
			}
		}
		else {
			if ($flag) header("Location: index.php");
			else return array();
		}
	}

?>
