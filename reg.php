<?php
  include_once "function.php";
	if (!empty($_POST)) {
		$login = mysqli_real_escape_string($db, $_POST['login']);
		$pass  = md5($_POST['pass']);

		$query = mysqli_query($db, "
			SELECT `id` FROM `user` WHERE `login` = '$login';
		");

		if (mysqli_num_rows($query) == 0) {
			mysqli_query($db, "
				INSERT INTO `user` SET
					`login` = '$login',
					`pass`  = '$pass';
			");

			if (mysqli_errno($db) == 0) {
				$id = mysqli_insert_id($db);
				$session = getHash();
				$token   = getHash();

				mysqli_query($db, "
					INSERT INTO `connect` SET
						`id_user` = $id,
						`session` = '$session',
						`token`   = '$token';
				");

				setcookie('s', $session);
				setcookie('t', $token);
				header ("Location: index.php");
			}
			else {
				header ("Location: index.php?error_message=Database error!");
			}
		}
		else {
			header ("Location: index.php?error_message=Login has already taken!");
		}
	}
?>
