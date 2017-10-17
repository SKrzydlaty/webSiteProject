<?php

function deleteItUser(){
	try{
		if (isset($_GET['deleteITU'])) {
			$link = new mysqli("localhost","root","","pai");
			mysqli_query($link, "SET NAMES 'utf8' COLLATE 'utf8_polish_ci'");
			
			$link->autocommit(false);
			mysqli_query($link,'SET TRANSACTION ISOLATION LEVEL SERIALIZABLE');

			$get_pro='SELECT * FROM USER';
			$run_pro = mysqli_query($link,$get_pro);
			$l_kat = mysqli_num_rows($run_pro);

			if($l_kat==0)
			{
				echo "<h2 style='padding:20px;'>Brak wyników do wyświetlenia!</h2>";
			}
			if($l_kat>0)
			{
				echo"	
				<table class='table table-hover myView'>
			    <thead>
				  	<tr>
						<th>Id</th>
				  		<th>Login</th>
						<th>Imię</th>
						<th>Nazwisko</th>
						<th>Akcja</th>
					</tr>
				</thead>";

				while($row_pro=mysqli_fetch_array($run_pro)){

					$id = $row_pro['ID_USER_PK']; 
					$USER_LOGIN = $row_pro['USER_LOGIN']; 
					$USER_NAME = $row_pro['USER_NAME'];
					$USER_SURNAME = $row_pro['USER_SURNAME'];

				echo "<tr>
				<td>$id</td>
				<td>$USER_LOGIN</td>
				<td>$USER_NAME</td>
				<td>$USER_SURNAME</td>
				<td>
					<a href='index.php?deleteITU=1&amp;deleteIT=$id'>
						<button type='button'><span class='glyphicon glyphicon-remove'></span></button>
					</a>
				</td>
			</tr>";
				}
				echo "</table>";
			}
			if (isset($_GET['deleteIT']) && isset($_POST['demo'])){
				$odp = $_POST['demo'];
				$idWlasciwe = $_GET['deleteIT'];
				if($odp){
					mysqli_query($link, "DELETE FROM USER WHERE ID_USER_PK='$idWlasciwe'");
					mysqli_query($link, "DELETE FROM CONTACT WHERE ID_USER_PK='$idWlasciwe'");
					echo "
				<script> document.location.href='index.php?deleteITU=1';</script>
				";
				}
			}

			if (isset($_GET['deleteIT']) && !isset($_POST['demo'])) {
				$id = $_GET['deleteIT'];

				//global $link;
				//mysqli_query($link, "SET NAMES 'utf8' COLLATE 'utf8_polish_ci'");
				$q = mysqli_fetch_assoc( mysqli_query($link, "SELECT * FROM USER WHERE ID_USER_PK='$id';"));
				echo "
		<form method='post' action='' class='zatwierdz' >
			<input type='text' id='demo' name='demo'>
			<button type='submit'>Zatwierdź</button>
			<p> [0 - anuluj, 1 - wykonaj ]</p>
		</form>
		<script>
		var odp2 = confirm('Czy chcesz usunąć ten element?');

		if (odp2) {
			 document.getElementById('demo').value = 1;} 
		else {
		   document.getElementById('demo').value = 0;}
		</script>
			";
			}
			$link->commit();}
	}

	catch (customException $e) {
		$link->rollback();
		if (mysqli_connect_errno()) {
			printf("Connect failed: %s\n", mysqli_connect_error());
			exit();}
		else 
			echo $e->errorMessage();
		exit();
	}
}

?>