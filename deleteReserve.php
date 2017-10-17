<?php
require_once "connect.php";

function deleteReserve()
{
	if(isset($_GET['delReserve'])){
		try {
			$link = new mysqli('localhost', 'root','','pai');}
		catch (Exception $e ) {	
			if (mysqli_connect_errno()) {
				printf("Connect failed: %s\n", mysqli_connect_error());
				exit();}
		}

		try{
			foreach ($_POST as $k=>$v) { $_POST[$k] = mysqli_real_escape_string($link, $v);}
			
			$id_buy_pk = $_GET['delReserve'];
			$q = mysqli_query($link, "DELETE FROM BUY WHERE ID_BUY_PK ='$id_buy_pk';");
			if($q){
				echo "Rezerwacja wycofana!";
				echo "<script>setTimeout(window.history.back(),200)</script>";}
			else{
				echo "Coś nie tak!";
				echo "<script>setTimeout(window.history.back(),200)</script>";}
		}
		catch (customException $e) {echo $e->errorMessage();}
	}
}
?>