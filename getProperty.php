<?php
$link = mysqli_connect("localhost", "root", "","pai");

function listOfReserve(){
	if(isset($_GET['listOfReserve'])){
		try{
			global $link;
			mysqli_query($link, "SET NAMES 'utf8' COLLATE 'utf8_polish_ci'");
			$id_user_fk = getId();
			$run_pro = mysqli_query($link,"SELECT b.BUY_TIME, p.PROPERTY_TITLE, p.PROPERTY_PRICE
		FROM buy b INNER JOIN property p on b.ID_PROPERTY_FK = p.ID_PROPERTY_PK and b.id_user_fk ='$id_user_fk'");
			$l_wyn = mysqli_num_rows($run_pro);

			echo "
				<table class='table table-hover myView'>
				<thead style='pading:20px;'>
					<tr>
						<td><h3>Data</h3></td>
						<td><h3>Nazwa</h3></td>
						<td><h3>Cena</h3></td>
					</tr>
				<thead>";
			if($l_wyn==0)
			{
				if("main_property_more.php?id")
					echo "<tr><td colspan=3><h4 style='pading:20px;'>Brak dokonanych rezerwacji!</h4></td></tr>";
			}
			
			else
				while($row_pro=mysqli_fetch_array($run_pro)){
					$BUY_TIME = $row_pro["BUY_TIME"];
					$PROPERTY_TITLE = $row_pro["PROPERTY_TITLE"];
					$PROPERTY_PRICE = $row_pro["PROPERTY_PRICE"];
				echo "<tr>
						<td>$BUY_TIME</td>
						<td>$PROPERTY_TITLE</td>
						<td>$PROPERTY_PRICE</td>
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

function getSpaces2($id_space_fk){
	try{
		global $link;
		$id = $id_space_fk;
		$space = mysqli_fetch_assoc(mysqli_query($link,"SELECT SPACE_HECTARE, SPACE_M2, SPACE_INT_FLATS FROM SPACE WHERE ID_SPACE_PK='$id'"));

		$hectare = $space['SPACE_HECTARE'];
		$m2 = $space['SPACE_M2'];
		$flats = $space['SPACE_INT_FLATS'];

		echo "<div class='space22'>
			<li>$hectare ha</li>
			<li>$m2 m<sup>2</sup></li>
			<li>pokoi: $flats</li></div>";	
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

function getImages(){
	if(isset($_GET['id'])){
		try{
			global $link;
			$id_property_fk=$_GET['id'];
			$get_pro="SELECT image_file FROM IMAGE WHERE ID_PROPERTY_FK='$id_property_fk'";
			$run_pro = mysqli_query($link,$get_pro);
			$l_kat = mysqli_num_rows($run_pro);

			if($l_kat==0)
			{
				if("main_property_more.php?id")
					echo "<h2 style='pading:20px;'>Brak zdjęć dla tej nieruchomości!</h2>";

			}
			echo "<table id=imagesMore>";
			while($row_pro=mysqli_fetch_array($run_pro)){
				$image_file = $row_pro["image_file"];
				echo "<td clas=imagesMoreTd><img class='thumbnail zoom imgMoreId' src='$image_file'/></td>";
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

function getId(){
	try{
		global $link;
		foreach ($_POST as $k=>$v) { $_POST[$k] = mysqli_real_escape_string($link, $v);}
		$q = mysqli_fetch_assoc(mysqli_query($link, "SELECT SESSION_TOKEN,ID_USER_FK FROM SESSION WHERE SESSION_ID = '$_COOKIE[id]' AND SESSION_WEB = '$_SERVER[HTTP_USER_AGENT]' AND SESSION_IP = '$_SERVER[REMOTE_ADDR]';"));
		$id_pk = $q['ID_USER_FK'];
		return $id_pk;
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

function totalPrice()
{
	try{
		global $link;
		$total = 0;
		$id=getId();

		$sel_price = "select id_property_fk from buy where id_user_fk='$id'";
		$run_price=mysqli_query($link, $sel_price);


		while($p_price = mysqli_fetch_array($run_price)){

			$id_property_fk = $p_price['id_property_fk'];

			$pro_price = "select property_price from property where id_property_pk='$id_property_fk'";

			$run_pro_price=mysqli_query($link, $pro_price);

			while($pp_price = mysqli_fetch_array($run_pro_price) ){
				$product_price=array($pp_price['property_price']);
				$values = array_sum($product_price);
				$total+=$values;
			}
		}

		echo "Wartosc rezerwacji: $total PLN";
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

function getPropertyMore()
{
	if(isset($_GET['id'])){
		$id_property_pk = $_GET['id'];
		try{
			global $link;
			mysqli_query($link, "SET NAMES 'utf8' COLLATE 'utf8_polish_ci'");
			$get_pro="SELECT * FROM PROPERTY WHERE ID_PROPERTY_PK='$id_property_pk'";
			$run_pro = mysqli_query($link,$get_pro);
			$l_kat = mysqli_num_rows($run_pro);

			if($l_kat==0)
			{
				if("main_property_more.php?id")
					echo "<h2 class='brakProduktow'>Brak produktów tej kategorii!</h2>";}

		
			while($row_pro=mysqli_fetch_array($run_pro)){
				$id = $row_pro['ID_PROPERTY_PK'];
				$title = strip_tags($row_pro['PROPERTY_TITLE']);
				$price = $row_pro['PROPERTY_PRICE'];
				$description = strip_tags($row_pro['PROPERTY_DESCRIPTION']);
				$id_space_fk = $row_pro['ID_SPACE_FK'];
				
				$id_user_fk = getId();

				$qq = mysqli_fetch_assoc(mysqli_query($link, "SELECT ID_BUY_PK FROM BUY WHERE ID_USER_FK = '$id_user_fk' AND ID_PROPERTY_FK = '$id';"));

				echo "
                    <ul class='propertyMore'>
                        <div class='caption'>
                            <li id='header'><span>$title</span></li>
							<li id='price'>$price PLN</li>";
				getSpaces2($id_space_fk);
				echo "
							<li id='desc'>$description + Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aspernatur adipisci optio dolorum, quia commodi perspiciatis deserunt quod dicta impedit magni nemo! Voluptatem molestiae harum sapiente accusantium consequuntur iste ipsam asperiores.		Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aspernatur adipisci optio dolorum, quia commodi perspiciatis deserunt quod dicta impedit magni nemo! Voluptatem molestiae harum sapiente accusantium consequuntur iste ipsam asperiores.</li>";							
				if($qq){
					$id_buy_pk = $qq['ID_BUY_PK'];
					echo "
							<li class='get-it reserve'><a href='main_property_more.php?delReserve=$id_buy_pk'>
							<button type='button' >Zrezygnuj</button></a></li>";}
				else
					echo "
							<li class='get-it reserve'>
								<a href='main_property_more.php?reserve=$id'><button type='button' id='avProperty' value='$id'>Zarezerwuj</button></a>
							</li>";
				echo "
							<p id='avProperty_result'></p>
							<div id=$id></div>
            			</div>
                    </ul>";
				getImages();
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

function getPropertyType()
{
	global $link;
	mysqli_query($link, "SET NAMES 'utf8' COLLATE 'utf8_polish_ci'");
	try{
		$get_type = "SELECT * FROM TYPE";
		$run_type = mysqli_query($link,$get_type);

		while($row_type=mysqli_fetch_array($run_type))
		{
			$id = $row_type['ID_TYPE_PK'];
			$title = $row_type['TYPE_TITLE'];
			echo "<a href ='main.php?typ=$id' class='list-group-item'>$title</a>";}
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


function getMiniImg($id){
	try{
		global $link;
		$id_property_fk=$id;
		//$get_pro="SELECT * FROM PROPERTY ORDER BY RAND() LIMIT 0,6";
		$get_pro="SELECT image_file FROM IMAGE WHERE ID_PROPERTY_FK='$id_property_fk' ORDER BY RAND() LIMIT 0,2";
		$run_pro = mysqli_query($link,$get_pro);


		while($row_pro=mysqli_fetch_array($run_pro)){
			$image_file = $row_pro["image_file"];
			echo "<li clas=imgMiniLi><img class='imgMiniId' src='$image_file'/></li>";
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

function getPro(){
	if(!isset($_GET['typ'])){
		try{
			global $link;
			mysqli_query($link, "SET NAMES 'utf8' COLLATE 'utf8_polish_ci'");
			//$get_pro="SELECT * FROM PROPERTY ORDER BY RAND() LIMIT 0,6";
			$get_pro="SELECT * FROM PROPERTY ORDER BY RAND()";
			$run_pro = mysqli_query($link,$get_pro);
			while($row_pro=mysqli_fetch_array($run_pro)){
				$id = $row_pro['ID_PROPERTY_PK'];
				$title = strip_tags($row_pro['PROPERTY_TITLE']);
				$price = $row_pro['PROPERTY_PRICE'];
				$description = strip_tags($row_pro['PROPERTY_DESCRIPTION']);
				$id_space_fk = $row_pro['ID_SPACE_FK'];
				
				echo "
                    <ul class='col-price'>
                        <div class='caption'>
                            <li class='header'><span>$title</span></li>
                            <li class='price'>$price PLN</li>";
				getSpaces2($id_space_fk);
				getMiniImg($id);
				echo "
							<li><p class='descMini'>$description</p></li>
							<li class='get-it'>
								<a href='main_property_more.php?id=$id'><button type='button'>Czytaj więcej</button></a>
							</li>
							<div id=$id></div>
                        </div>
                        <div class='ratings'>
                            <p class='pull-right'>15 reviews</p>
                            <p> 
								<span class='glyphicon glyphicon-star'></span> 
								<span class='glyphicon glyphicon-star'></span> 
								<span class='glyphicon glyphicon-star'></span> 
								<span class='glyphicon glyphicon-star'></span> 
								<span class='glyphicon glyphicon-star'></span> 
							</p>
                        </div>
                    </ul> ";}
			}
			catch (customException $e) {
				if (mysqli_connect_errno()) {
					printf("Connect failed: %s\n", mysqli_connect_error());
					exit();}
				else
					echo $e->errorMessage();
				exit();	}
	}
}

function getKategoriaPro(){

	if(isset($_GET['typ'])){
		$id_type = $_GET['typ'];
		try{
			global $link;
			mysqli_query($link, "SET NAMES 'utf8' COLLATE 'utf8_polish_ci'");
			$get_kategoria_pro="SELECT * FROM PROPERTY WHERE ID_TYPE_FK='$id_type'";
			$run_kategoria_pro = mysqli_query($link,$get_kategoria_pro);
			$l_kat = mysqli_num_rows($run_kategoria_pro);

			if($l_kat==0)
			{
				if("main.php?typ")
					echo "<h2 class='brakProduktow'>Brak produktów tej kategorii!</h2>";}

			while($row_pro=mysqli_fetch_array($run_kategoria_pro)){
				$id = $row_pro['ID_PROPERTY_PK'];
				$title = strip_tags($row_pro['PROPERTY_TITLE']);
				$price = $row_pro['PROPERTY_PRICE'];
				$description = strip_tags($row_pro['PROPERTY_DESCRIPTION']);
				$id_space_fk = $row_pro['ID_SPACE_FK'];

				echo "
                    <ul class='col-price'>
                        <div class='caption'>
                            <li class='header'><span>$title</span></li>
                            <li class='price'>$price PLN</li>";
				getSpaces2($id_space_fk);
				getMiniImg($id);
				echo "
							<li><p class='descMini'>$description</p></li>
							<li class='get-it'>
								<a href='main_property_more.php?id=$id'><button type='button'>Czytaj więcej</button></a>
							</li>
							<div id=$id></div>
                        </div>
                        <div class='ratings'>
                            <p class='pull-right'>15 reviews</p>
                            <p> 
								<span class='glyphicon glyphicon-star'></span> 
								<span class='glyphicon glyphicon-star'></span> 
								<span class='glyphicon glyphicon-star'></span> 
								<span class='glyphicon glyphicon-star'></span> 
								<span class='glyphicon glyphicon-star'></span> 
							</p>
                        </div>
                    </ul> ";}
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