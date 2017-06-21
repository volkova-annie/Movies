<?php
  include_once "function.php";
	if (!empty($_POST)) {

		$login = mysqli_real_escape_string($db, $_POST['login']);
		$pass  = md5($_POST['pass']);

		$query = mysqli_query($db, "
			SELECT * FROM `user`
			WHERE `login` = '$login'
			AND   `pass`  = '$pass';
		");

		if (mysqli_num_rows($query) > 0) {
			$user    = mysqli_fetch_assoc($query);
			$id      = $user['id'];
      $email   = $user['email'];
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
      setcookie('email', $email);
			header ("Location: index.php");
		}
		else {
      header ("Location: index.php?error_message=Incorrect password or login!");
		}
	}


?>
