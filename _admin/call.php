<?php
require_once "../connect.php";

$link = mysqli_connect($db_host, $db_user,$db_pass,$db_name);


foreach ($_POST as $k=>$v) {$_POST[$k] = mysqli_real_escape_string($link, $v);}

function viewPuser()
{
	if(isset($_POST['ida'])){
		$id = $_POST['ida'];
		if(is_numeric($id)){
		try{
			global $link;
			mysqli_query($link, "SET NAMES 'utf8' COLLATE 'utf8_polish_ci'");
			$get_pro="call puser($id)";
			$run_pro = mysqli_query($link,$get_pro);
			$l_kat = mysqli_num_rows($run_pro);
				
			if($l_kat==0)
			{
				if("index.php?vProperty")
					echo "<h2 style='pading:20px;'>Brak wyników do wyświetlenia!</h2>";

			}
			else{
				echo "<table class='table table-hover myView'>
			    	<thead>
				  		<tr>
				  			<th>Imię</th>
							<th>Nazwisko</th>
						</tr>
					</thead>";
			
				while($row_pro=mysqli_fetch_array($run_pro)){
					$user_name = $row_pro['user_name']; 
					$user_surname = $row_pro['user_surname']; 
					
					echo "<tr>
							<td>$user_name</td>
							<td>$user_surname</td>
						</tr>";
						}
						echo "</table>";
				}
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
}
?>