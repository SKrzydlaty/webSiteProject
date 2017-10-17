<?php
session_start();
require_once "connect.php";
include("timer.php");

if (! isset($_COOKIE['id'])){
	$q = mysqli_query($link, "delete from session where session_id = '$_COOKIE[id]' and session_web = '$_SERVER[HTTP_USER_AGENT]';");
	header("location:index.php");
	exit;}

    if (isset($_GET['logout'])){
		$q = mysqli_query($link, "delete from session where 
		session_id = '$_COOKIE[id]' and session_web = '$_SERVER[HTTP_USER_AGENT]';");	
		setcookie("id",0,time()-1);
		unset($_COOKIE['id']);
		setcookie("token",0,time()-1);
		unset($_COOKIE['token']);
		header("location:index.php");
    }
?>

<!doctype html>
<html lang="pl" ng-app="exampleApp">
<head>
	<title>Nieruchomości</title>
	<meta charset="utf-8">
	<link href="_css/bootstrap.css" rel="stylesheet">
	<link href="_css/style.css" rel="stylesheet" type="text/css" />
	<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">  -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
</head>

<body>
	<!-- <header class="page-header">TO jest nagłówek</header> -->
	<nav class="navbar navbar-inverse navbar-static-top marginBottom-0" role="navigation">
		<div class="navbar-header">
			<header class="page-header text-center"><h1>Serwis z nieruchomościami</h1></header>
		</div>
	</nav>
	<div id="carousel" class="carousel slide carousel-fade" data-ride="carousel">
		<ol class="carousel-indicators">
			<li data-target="#carousel" data-slide-to="0" class="active"></li>
			<li data-target="#carousel" data-slide-to="1"></li>
			<li data-target="#carousel" data-slide-to="2"></li>
			<li data-target="#carousel" data-slide-to="3"></li>
			<li data-target="#carousel" data-slide-to="3"></li>
			<li data-target="#carousel" data-slide-to="4"></li>
			<li data-target="#carousel" data-slide-to="5"></li>
			<li data-target="#carousel" data-slide-to="6"></li>
			<li data-target="#carousel" data-slide-to="7"></li>
			<li data-target="#carousel" data-slide-to="8"></li>
			<li data-target="#carousel" data-slide-to="9"></li>
			<li data-target="#carousel" data-slide-to="10"></li>
			<li data-target="#carousel" data-slide-to="11"></li>

		</ol>
		<!-- Carousel items -->
		<div class="carousel-inner">
			<div class="active item"><img src="_img/_property/mieszkania_05.jpg" width="800px" height="300px" alt=""></div>
			<div class="item"><img src="_img/_property/mieszkania_06.jpg" width="800px" height="300px" alt=""></div>
			<div class="item"><img src="_img/_property/mieszkania_07.jpg" width="800px" height="300px" alt=""></div>
			<div class="item"><img src="_img/_property/dom_03.jpg" width="800px" height="300px" alt=""></div>
			<div class="item"><img src="_img/_property/dom_04.jpg" width="800px" height="300px" alt=""></div>
			<div class="item"><img src="_img/_property/dom_05.jpg" width="800px" height="300px" alt=""></div>
			<div class="item"><img src="_img/_property/dom_06.jpg" width="800px" height="300px" alt=""></div>
			<div class="item"><img src="_img/_property/powm_01.jpg" width="800px" height="300px" alt=""></div>
			<div class="item"><img src="_img/_property/powuz_01.jpg" width="800px" height="300px" alt=""></div>
			<div class="item"><img src="_img/_property/powuz_02.jpg" width="800px" height="300px" alt=""></div>
			<div class="item"><img src="_img/_property/powuz_03.jpg" width="800px" height="300px" alt=""></div>
			<div class="item"><img src="_img/_property/powuz_04.jpg" width="800px" height="300px" alt=""></div>
			<div class="item"><img src="_img/_property/powuz_05.jpg" width="800px" height="300px" alt=""></div>
		</div>
		<!-- Carousel nav -->
		<a class="carousel-control left" href="#carousel" data-slide="prev">&lsaquo;</a> 
		<a class="carousel-control right" href="#carousel" data-slide="next">&rsaquo;</a> 
	</div>
	<nav class="navbar navbar-inverse navbar-static-top marginBottom-0" role="navigation">
		<div class="collapse navbar-collapse" id="navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="active" id="liHome"><a href="main.php">
					<span class="glyphicon glyphicon-home"></span> 	Home ></a>
				</li>
				<li class="active"><a href="#">	Dodaj nieruchomość</a></li>
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown">Wykonaj akcję<b class="caret"></b>
					</a>
					<ul class="dropdown-menu">
						<li><a href="#">Menu główne</a></li>
					</ul>
				</li>
				<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">Kategorie<b class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><a href="main.php?typ=1">Domy</a></li>
						<li><a href="main.php?typ=2">Dzialki</a></li>
						<li><a href="main.php?typ=3">Mieszkania</a></li>
						<li><a href="main.php?typ=4">Uzytkowe</a></li>
					</ul>
				</li>
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown">
						<span class="glyphicon glyphicon-user"></span>Profil<b class="caret"></b>
					</a>
					<ul class="dropdown-menu">
						<li>
							<a href="#">
								<span class="glyphicon glyphicon-user"></span>Profil
							</a>
						</li>
						<li>
							<a>
								<?php
								$link = new mysqli($db_host, $db_user,$db_pass,$db_name);
								foreach ($_POST as $k=>$v) { $_POST[$k] = mysqli_real_escape_string($link, $v);}

								$q = mysqli_fetch_assoc(mysqli_query($link, "SELECT SESSION_TOKEN,ID_USER_FK FROM SESSION WHERE SESSION_ID = '$_COOKIE[id]' AND SESSION_WEB = '$_SERVER[HTTP_USER_AGENT]' AND SESSION_IP = '$_SERVER[REMOTE_ADDR]';"));

								$id_pk = $q['ID_USER_FK'];

								if (! empty($q['ID_USER_FK'])){
									$q2 = mysqli_fetch_assoc(mysqli_query($link, "SELECT user_name, user_surname from user where id_user_pk = '$id_pk';"));
									echo $q2['user_name'] ." ". $q2['user_surname'];

								} 
								else {
									header("location:index.php");exit;}
								?>
							</a>
						</li>
						<li><a href="?logout">Wyloguj</a> </li>
					</ul>
				</li>
				<?php timer(); ?>
				<li class="totalPrice"><?php totalPrice();?></li>
			</ul>
		</div>
	</nav>
	<div class="alert jumbotron">
		<small>Witaj w panelu użytkownika!</small>
		<div class="text-center">
			<h2 >Formularz dodawania nieruchomości!</h2>
		</div>

		<div class="alert alert-success" data-dismiss="alert">
			<?php
			$link = new mysqli($db_host, $db_user,$db_pass,$db_name);
			foreach ($_POST as $k=>$v) { $_POST[$k] = mysqli_real_escape_string($link, $v);}

			$q = mysqli_fetch_assoc(mysqli_query($link, "SELECT SESSION_TOKEN,ID_USER_FK FROM SESSION WHERE SESSION_ID = '$_COOKIE[id]' AND SESSION_WEB = '$_SERVER[HTTP_USER_AGENT]' AND SESSION_IP = '$_SERVER[REMOTE_ADDR]';"));

			$id_pk = $q['ID_USER_FK'];

			if (! empty($q['ID_USER_FK']))
				echo "Zalogowany użytkownik o ID: " . $q['ID_USER_FK']." [kliknij]";
			else {
				header("location:index.php");exit;}
		?>
		</div>
	</div>

	<noscript class="noscript">
		<div id="divno">
			<p>Do pełnej funkcjonalności tej strony konieczne jest włączenie obsługi JavaScript.
				Tutaj znajduje się link z instrukcją <a href="http://www.enable-javascript.com/" target="_blank">jak włączyć </a>obsługę JavaScript w Twojej przeglądarce.</p>
		</div>
	</noscript>

	<form name="form" action="insert.php" method="post" class="well container" enctype="multipart/form-data">
		<table align="center">
			<tr>
				<td align="center">
					<h4 class="page-header">Miejscowość:</h4></td>
				<td align="left">
					<input class="form-control" placeholder="Wybierz lub wpisz" type="text" name="CITY_CHECK2" id="CITY_CHECK2" size="30" required> </td>
				<td align="left">
					<select name="CITY_CHECK" id="CITY_CHECK" onChange='Choice();' class='dropdown-header'>
						<?php 
						$link = mysqli_connect("localhost", "root", "","pai");
						mysqli_query($link, "SET NAMES 'utf8' COLLATE 'utf8_polish_ci'");
						$get_cats = "select * from city";
						$run_cats = mysqli_query($link,$get_cats);
						echo "<option class='dropdown-header' value=''>Wybierz miasto</option>";
						while($row_cats=mysqli_fetch_array($run_cats))
						{
							$city = $row_cats['city_title'];
							echo "<option class='dropdown-header' value='$city'>$city</option>";
						}
						?>
					</select>
				</td>
			</tr>
			<tr>
				<td align="center">
					<h4 class="page-header">Ulica:</h4></td>
				<td align="left">
					<input id="LOCALIZATION_STREET" name="LOCALIZATION_STREET" ng-model="user.street" class="form-control" type="text" name="LOCALIZATION_STREET" placeholder="Podaj nazwę ulicy" ng-minlength="3" ng-pattern="/[a-zA-Z]/" required>
					<div ng-messages="form.LOCALIZATION_STREET.$error" ng-show="form.$submitted || form.LOCALIZATION_STREET.$touched"> 
						<span ng-message="required" class="info-block">Należy podać street!</span> 
						<span ng-show="!(form.LOCALIZATION_STREET.$error.minlength) &&form.LOCALIZATION_STREET.$error.pattern" class="info-block">Tylko litery!</span> 
						<span ng-show="!form.LOCALIZATION_STREET.$error.required && (form.LOCALIZATION_STREET.$error.minlength) && form.LOCALIZATION_STREET.$dirty" class="info-block">Co najmniej 3 litery!</span> 
					</div>
				</td>
			</tr>
			<tr>
				<td align="center">
					<h4 class="page-header">Nr ulicy:</h4></td>
				<td align="left">
					<input class="form-control" name="LOCALIZATION_STREET_NUMBER" placeholder="Podaj nr ulicy" id="LOCALIZATION_STREET_NUMBER" name="LOCALIZATION_STREET_NUMBER" ng-model="user.street_number" type="text" ng-pattern="/[0-9]/" required>
					<div ng-messages="form.LOCALIZATION_STREET_NUMBER.$error" ng-show="form.$submitted || form.LOCALIZATION_STREET_NUMBER.$touched"> 
						<span ng-message="required" class="info-block">Należy podać numer!</span> 
						<span ng-show="!(form.LOCALIZATION_STREET_NUMBER.$error.minlength) &&form.LOCALIZATION_STREET_NUMBER.$error.pattern" class="info-block">Tylko cyfry!</span> 
					</div>
				</td>
			</tr>
			<tr>
				<td align="center">
					<h4 class="page-header">Kod pocztowy:</h4></td>
				<td align="left">
					<input class="form-control" name="LOCALIZATION_POSTAL_CODE" placeholder="Podaj kod pocztowy" id="LOCALIZATION_POSTAL_CODE" ng-model="user.postal_code" type="text" pattern="\d{2}-\d{3}" ng-maxlength="6" required>
					<div ng-messages="form.LOCALIZATION_POSTAL_CODE.$error" ng-show="form.$submitted || form.LOCALIZATION_POSTAL_CODE.$touched"> 
						<span ng-message="required" class="info-block">Należy podać kod pocztowy!</span> 
						<span ng-show="form.LOCALIZATION_POSTAL_CODE.$error.pattern &&  !(form.LOCALIZATION_POSTAL_CODE.$error.maxlength)" class="info-block">Tylko cyfry!</span> 
						<span ng-show="!form.LOCALIZATION_POSTAL_CODE.$error.required &&  (form.LOCALIZATION_POSTAL_CODE.$error.maxlength) && form.LOCALIZATION_POSTAL_CODE.$dirty" class="info-block">Za dużo cyfr zostało wpisanych!</span> 
					</div>
				</td>
			</tr>
			<tr>
				<td align="center">
					<h4 class="page-header">Typ nieruchomości:</h4></td>
				<td align="left">
					<select name="ID_TYPE_PK" class='dropdown-header'>
						<?php 
						$link = mysqli_connect("localhost", "root", "","pai");
						mysqli_query($link, "SET NAMES 'utf8' COLLATE 'utf8_polish_ci'");
						$get_cats = "select * from type";
						$run_cats = mysqli_query($link,$get_cats);
						while($row_cats=mysqli_fetch_array($run_cats))
						{
							$type_id = $row_cats['ID_TYPE_PK'];
							$type_title = $row_cats['TYPE_TITLE'];
							echo "<option class='dropdown-header' value='$type_id'>$type_title</option>";}
						?>
					</select>
				</td>
			</tr>
			<tr class="tr_option">
				<td align="left" class="td_option">
					<select class="dropdown-header input_no" name="SPACE_HECTARE" required>
						<?php for ($i=0; $i<=100; $i++){ ?>
							<option value="<?php echo $i; ?>">
								<?php echo $i;?>
							</option>
							<?php } ?>
					</select>
				</td>
				<td>
					<h4 class="page-header">ha</h4></td>
			</tr>
			<tr class="tr_option">
				<td align="left" class="td_option">
					<select class="dropdown-header input_no" name="SPACE_M2" required>
						<?php for ($i=0; $i<=9999; $i++){?>
						<option value="<?php echo $i; ?>">
							<?php echo $i; ?>
						</option>
						<?php } ?>
					</select>
				</td>
				<td>
					<h4 class="page-header">m<sup>2</sup></h4></td>
			</tr>
			<tr class="tr_option">
				<td align="left">
					<select class="dropdown-header input_no" name="SPACE_INT_FLAT" required>
						<?php for ($i=0; $i<=100; $i++){ ?>
						<option value="<?php echo $i; ?>">
							<?php echo $i; ?>
						</option>
						<?php } ?>
					</select></td>
				<td align="center">
					<h4 class="page-header">Liczba pokoi:</h4></td>
			</tr>
			<tr>
				<td align="center">
					<h4 class="page-header">Cena:</h4>
				</td>
				<td align="left">
					<input class="form-control" type="text" name="PROPERTY_PRICE" id="PROPERTY_PRICE" placeholder="Wartość dziesiętna" ng-model="PROPERTY_PRICE" ng-pattern="/^\d{0,9}(\.\d{1,9})/" required/>
					<div ng-messages="form.PROPERTY_PRICE.$error" ng-show="form.$submitted || form.PROPERTY_PRICE.$touched"> 
						<span ng-message="required" class="info-block">Należy podać cenę!</span> 
						<span ng-show="form.PROPERTY_PRICE.$error.pattern" class="info-block">Tylko cyfry! Zapis z dokładnością dziesiętną! </span> 
					</div>
				</td>
			</tr>
			<tr>
				<td align="center">
					<h4 class="page-header">Tytuł:</h4>
				</td>
				<td align="left" colspan="2">
					<input class="form-control" type="text" id="PROPERTY_TITLE" name="PROPERTY_TITLE" ng-model="user.title" placeholder="Podaj tytuł" ng-minlength="3" ng-pattern="/[a-zA-Z]/" required>
					<div id='PROPERTY_TITLE_availability_result' class="info-true"></div>
					<div ng-messages="form.PROPERTY_TITLE.$error" ng-show="form.$submitted || form.PROPERTY_TITLE.$touched"> 
						<span ng-message="required" class="info-block">Należy podać street!</span> 
						<span ng-show="!(form.PROPERTY_TITLE.$error.minlength) &&form.PROPERTY_TITLE.$error.pattern" class="info-block">Tylko litery!</span> 
						<span ng-show="!form.PROPERTY_TITLE.$error.required && (form.PROPERTY_TITLE.$error.minlength) && form.PROPERTY_TITLE.$dirty" class="info-block">Co najmniej 3 litery!</span> 
					</div>
				</td>
			</tr>
			<tr>
				<td align="center">
					<h4 class="page-header">Opis:</h4></td>
				<td align="left" colspan="2">
					<textarea rows="10" class="form-control input_text_area" name="PROPERTY_DESCRIPTION" required></textarea>
				</td>
			</tr>
			<tr class="page-header">
				<td align="center" class="input_file">
					<h4>Zdjęcia:</h4></td>
			</tr>
			<tr>
				<td align="left" class="input_file" colspan="3">Zdjęcie nr 1:
					<input type="file" id="plik" name="plik" />
					<br/> </td>
			</tr>
			<tr>
				<td align="left" class="input_file" colspan="3">Zdjęcie nr 2:
					<input type="file" id="plik2" name="plik2" />
					<br/> </td>
			</tr>
			<tr>
				<td colspan="3">
					<button class="btn btn-block btn-primary" type="submit" name="add">Dodaj</button>
				</td>
			</tr>
		</table>
	</form>

	<script type="text/javascript">
		setInterval("location.reload()", 600000);
	</script>

	<footer class="flex-rw">
		<section class="footer-bottom-section flex-rw">
			&copy;2016 Krzysztof Stuglik, Kraków,PL<br>
			<span class="footer-bottom-rights"> - All Rights Reserved - </span> 
		</section>
	</footer>
</body>
<script src="_js/jquery.js"></script>
<script src="_js/preload.js"></script>
<script src="_js/bootstrap.min.js"></script>
<script src="_js/nowy2.js"></script>
<script src="_js/angular.min.js"></script>
<script src="_js/angular-messages.min.js"></script>
<script>
	var app = angular.module('exampleApp', ['ngMessages']);
</script>
<script type="text/javascript">
	function Choice() {
		document.getElementById("CITY_CHECK2").value = document.getElementById("CITY_CHECK").value;
	}
</script>
<script src="//cdnjs.cloudflare.com/ajax/libs/cookieconsent2/1.0.9/cookieconsent.min.js"></script>

</html>