<?php
$link = mysqli_connect("localhost", "root", "","pai");
echo "	
<link href='../_css/bootstrap.css' rel='stylesheet'>
<link href='../_css/style.css' rel='stylesheet'>";

function viewOfProperty()
{
	if(isset($_GET['vProperty'])){
		try{
			global $link;
			mysqli_query($link, "SET NAMES 'utf8' COLLATE 'utf8_polish_ci'");
			$get_pro="SELECT * FROM voferta";
			$run_pro = mysqli_query($link,$get_pro);
			$l_kat = mysqli_num_rows($run_pro);

			echo "
			<table class='table table-hover myView'>
			    <thead>
				  	<tr>
				  		<th>Imię</th>
						<th>Nazwisko</th>
						<th>Typ</th>
						<th>Tytuł</th> 
						<th>ha</th>
						<th>m2</th> 
						<th>L. m</th> 
						<th>Cena</th>
						<th>Kod pocztowy</th> 
						<th>Miasto</th> 
						<th>Ulica</th> 
						<th>Nr ulicy</th>
					</tr>
				</thead>";
			if($l_kat==0)
			{
				if("index.php?vProperty")
					echo "<tr><td colspan=12><h4 style='pading:20px;'>Brak wyników do wyświetlenia!</h4></td></tr>";
			}
			while($row_pro=mysqli_fetch_array($run_pro)){
				
				$user_name = $row_pro['user_name']; 
				$user_surname = $row_pro['user_surname']; 
				$type_title = $row_pro['type_title']; 
				$property_title = $row_pro['property_title']; 
				$space_hectare = $row_pro['space_hectare']; 
				$space_m2 = $row_pro['space_m2']; 
				$space_int_flats = $row_pro['space_int_flats']; 
				$PROPERTY_PRICE = $row_pro['property_price']; 
				$localization_postal_code = $row_pro['localization_postal_code']; 
				$city_title = $row_pro['city_title']; 
				$localization_street = $row_pro['localization_street']; 
				$localization_street_number = $row_pro['localization_street_number'];

				echo "<tr>
						<td>$user_name</td>
						<td>$user_surname</td>
						<td>$type_title</td>
						<td>$property_title</td> 
						<td>$space_hectare</td>
						<td>$space_m2</td> 
						<td>$space_int_flats</td> 
						<td>$PROPERTY_PRICE</td>
						<td>$localization_postal_code</td> 
						<td>$city_title</td> 
						<td>$localization_street</td> 
						<td>$localization_street_number</td>
					</tr>
				";
			}
			echo "</table>";
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

function viewOfUser()
{
	if(isset($_GET['vUser'])){
		try{
			global $link;
			mysqli_query($link, "SET NAMES 'utf8' COLLATE 'utf8_polish_ci'");
			$get_pro="SELECT * FROM vuser";
			$run_pro = mysqli_query($link,$get_pro);
			$l_kat = mysqli_num_rows($run_pro);

			echo "
			<table class='table table-hover myView'>
			    <thead>
				  	<tr>			
				  		<th>user_name</th>
						<th>user_surname</th>
						<th>contact_phone</th>
						<th>contact_email</th> 

					</tr>
				</thead>";

			if($l_kat==0)
			{
				if("index.php?vUser")
					echo "<tr><td colspan=4><h4 style='pading:20px;'>Brak wyników do wyświetlenia!</h4></td></tr>";

			}
			
			while($row_pro=mysqli_fetch_array($run_pro)){

				$user_name = $row_pro['user_name']; 
				$user_surname = $row_pro['user_surname']; 
				$contact_phone = $row_pro['contact_phone']; 
				$contact_email = $row_pro['contact_email']; 

				echo "
				<tr>
					<td>$user_name</td>
					<td>$user_surname</td>
					<td>$contact_phone</td>
					<td>$contact_email</td> 
				</tr>";
			}
			echo "</table>";
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