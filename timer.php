<?php
require_once 'getProperty.php';;

function timer(){
	$link = new mysqli('localhost','root','','pai');

	foreach ($_POST as $k=>$v) {$_POST[$k] = mysqli_real_escape_string($link, $v);}

	$id = getId();
	$q = mysqli_fetch_assoc(mysqli_query($link, "SELECT session_time FROM SESSION WHERE ID_USER_FK = '$id' "));

	$d = date_create_from_format('Y-m-d H:i:s',$q['session_time']);

	$minutes_to_add = 10;
	$d->add(new DateInterval('PT' . $minutes_to_add . 'M'));
	$stamp = $d->format('Y-m-d H:i:s');

	$t = date_create()->format('Y-m-d H:i:s');

	if($t<$stamp){
		$s = new DateTime($stamp);
		$date = new DateTime($t);
		$ile = $s->diff($date);
		$razem = $ile->i;
		$razem *= 60;
		$razem += $ile->s;

		echo "
		<li class='alert' style='margin: 10px;padding: 0'>
			<input type='text' id='txt' style='width: 35px;text-align: center; background:lightgrey'>
		</li>
		<li id='koniec' class='alert alert-danger' style='margin: 14px;padding: 0'></li>
		<script type='text/javascript'>
			var t;
		var c = $razem;

		function zegar() {
			document.getElementById('txt').value = c;
			c = c - 1;
			if(c<=10){
			document.getElementById('koniec').innerHTML = 'Za chwilę nastąpi wylogowanie';
			setInterval('location.reload()', 5000);
			return;
			}
			t = setTimeout('zegar()', 1000);
		}
		zegar();
		</script>";
	}
}

?>
