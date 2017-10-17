<?php
require_once "connect.php";

function makeReserve()
{
	if(isset($_GET['reserve'])){
		try {
			$link = new mysqli('localhost', 'root','','pai');}
		catch (Exception $e ) {	if (mysqli_connect_errno()) {
			printf("Connect failed: %s\n", mysqli_connect_error());
			exit();}
		}

		try{
			foreach ($_POST as $k=>$v) { $_POST[$k] = mysqli_real_escape_string($link, $v);}
			$q = mysqli_fetch_assoc(mysqli_query($link, "SELECT SESSION_TOKEN,ID_USER_FK FROM SESSION WHERE SESSION_ID = '$_COOKIE[id]' AND SESSION_WEB = '$_SERVER[HTTP_USER_AGENT]' AND SESSION_IP = '$_SERVER[REMOTE_ADDR]';"));
			$id_user_fk = $q['ID_USER_FK'];
			$id_property_fk = $_GET['reserve'];

			$q = mysqli_fetch_assoc( mysqli_query($link, "SELECT COUNT(*) CNT FROM BUY WHERE id_property_fk='$id_property_fk';"));
			
			if($q['CNT']){
				echo "Nie można dokonać rezerwacji, ponieważ ktoś zrobił to już wcześniej!";
				echo "<script>setTimeout(window.history.back(),100)</script>";}
			if(!$q['CNT']){
				$link->query("INSERT INTO BUY VALUES(NULL ,'$id_property_fk','$id_user_fk' ,NULL)");
				echo "Dokonano rezerwacj!";
				echo "<script>setTimeout(window.history.back(),200)</script>";}
		}
		catch (customException $e) {echo $e->errorMessage();}
	}
}
?>