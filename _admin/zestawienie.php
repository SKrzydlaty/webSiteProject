<?php
$link = mysqli_connect("localhost", "root", "","pai");

function ile_ofert()
{
	if(isset($_GET['ileOfert'])){
		try{
			global $link;
			mysqli_query($link, "SET NAMES 'utf8' COLLATE 'utf8_polish_ci'");
			
			$query1 = "select ile_ofert(1)";
			$query2 = "select ile_ofert(2)";
			$query3 = "select ile_ofert(3)";
			$query4 = "select ile_ofert(4)";
			
			$row1 = mysqli_fetch_row(mysqli_query($link,$query1));

			$row2 = mysqli_fetch_row(mysqli_query($link,$query2));

			$row3 = mysqli_fetch_row(mysqli_query($link,$query3));

			$row4 = mysqli_fetch_row(mysqli_query($link,$query4));
			
			echo"	
				<table class='table table-hover myView'>
			    <thead>
				  	<tr>
						<th>Domy</th>
				  		<th>Działki</th>
						<th>Lokale użytkowe</th>
						<th>Mieszkania</th>
					</tr>
				</thead>
				<tr>
				<td>";
			echo $row1[0]; 
				echo "</td>
				<td>";
			echo $row2[0]; 
				echo "</td>
				<td>";
			echo $row3[0]; 
				echo "</td>
				<td>";
			echo $row4[0]; 
				echo "</td>
			</tr>
			</table>";
			


		}
		catch (customException $e) {
			if (mysqli_connect_errno()) {
				printf("Connect failed: %s\n", mysqli_connect_error());
				exit();}
			else 
				echo $e->errorMessage();
			exit();
		}
	}
}
?>