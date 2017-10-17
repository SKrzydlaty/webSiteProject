<?php

function deleteItProperty(){
	try{
		if (isset($_GET['deleteITP'])) {
			$link = new mysqli("localhost","root","","pai");
			mysqli_query($link, "SET NAMES 'utf8' COLLATE 'utf8_polish_ci'");
			$link->autocommit(false);
			mysqli_query($link,'SET TRANSACTION ISOLATION LEVEL SERIALIZABLE');
			
			$get_pro='SELECT * FROM PROPERTY';
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
							<th>Nazwa oferty</th>
							<th>Cena</th>
							<th>Akcja</th>
						</tr>
					</thead>";
				
				while($row_pro=mysqli_fetch_array($run_pro)){

					$id = $row_pro['ID_PROPERTY_PK']; 
					$PROPERTY_TITLE = $row_pro['PROPERTY_TITLE']; 
					$PROPERTY_PRICE = $row_pro['PROPERTY_PRICE'];

					$ID_SPACE_FK = $row_pro['ID_SPACE_FK'];
					$ID_LOCALIZATION_FK = $row_pro['ID_LOCALIZATION_FK'];

					echo "<tr>
						<td>$id</td>
						<td>$PROPERTY_TITLE</td>
						<td>$PROPERTY_PRICE</td>
						<td>
							<a href='index.php?deleteITP=1&amp;deleteIT=$id&amp;space=$ID_SPACE_FK&amp;loc=$ID_LOCALIZATION_FK'>
								<button type='button'><span class='glyphicon glyphicon-remove'></span></button>
							</a>
						</td>
					</tr>";
				}
				echo "</table>";
			}
		if (isset($_GET['deleteIT']) && isset($_POST['demo'])){
			$odp = $_POST['demo'];
			$idLoc = $_GET['loc'];
			$idSpace = $_GET['space'];
			$idWlasciwe = $_GET['deleteIT'];
			if($odp){
				
				mysqli_query($link, "DELETE FROM LOCALIZATION WHERE ID_LOCALIZATION_PK='$idLoc'");
				mysqli_query($link, "DELETE FROM SPACE WHERE ID_SPACE_PK='$idSpace'");
				mysqli_query($link, "DELETE FROM PROPERTY WHERE ID_PROPERTY_PK='$idWlasciwe'");
				echo "
				<script> document.location.href='index.php?deleteITP=1';</script>
				";
			}
		}

		if (isset($_GET['deleteIT']) && !isset($_POST['demo'])) {
			$id = $_GET['deleteIT'];

			//global $link;
			//mysqli_query($link, "SET NAMES 'utf8' COLLATE 'utf8_polish_ci'");
			$q = mysqli_fetch_assoc( mysqli_query($link, "SELECT * FROM PROPERTY WHERE ID_PROPERTY_PK='$id';"));
			echo "
		<form method='post' action='' class='zatwierdz' >
			<input type='text' id='demo' name='demo'>
			<button type='submit'>Zatwierdź</button>
			<p> [0 - anuluj, 1 - wykonaj ]</p>
		</form>
		<script>
		var odp2 = confirm('Czy chcesz usunąć ten element?');

		if (odp2) {
			 document.getElementById('demo').value = 1;
			 
			 } 
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