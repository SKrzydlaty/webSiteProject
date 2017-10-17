<?php
session_start();
require_once "connect.php";
include("getProperty.php");
include("makeReserve.php");
include("deleteReserve.php");
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
<html lang="pl">
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
				<li class="active" id="liHome"><a href="main.php"><span class="glyphicon glyphicon-home"></span> 	Home ></a></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">Wykonaj akcję<b class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><a href="main_add_property.php">Dodaj nieruchomość</a></li>
					</ul>
				</li>
				<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">Kategorie<b class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><a href="main.php?typ=1">Domy</a></li>
						<li><a href="main.php?typ=3">Dzialki</a></li>
						<li><a href="main.php?typ=2">Mieszkania</a></li>
						<li><a href="main.php?typ=4">Uzytkowe</a></li>
						<li class="divider"></li>
						<li class="dropdown dropdown-submenu"><a href="#" class="dropdown-toggle" data-toggle="dropdown">Dropdown Link 4</a></li>
						<li class="dropdown dropdown-submenu"><a href="#" class="dropdown-toggle" data-toggle="dropdown">Dropdown Link 5</a></li>
					</ul>
				</li>
				<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-user"></span>Profil<b class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><a href="#"><span class="glyphicon glyphicon-user"></span>Profil</a></li>
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
				<li class="totalPrice"><?php totalPrice();?></li>
			</ul>
		</div>
	</nav>
	<noscript class="noscript">
		<div id="divno">
			<p>Do pełnej funkcjonalności tej strony konieczne jest włączenie obsługi JavaScript.
				Tutaj znajduje się link z instrukcją <a href="http://www.enable-javascript.com/" target="_blank">jak włączyć </a>obsługę JavaScript w Twojej przeglądarce.</p>
		</div>
	</noscript>
	
	<canvas id="canva"></canvas>
	<div class="alert jumbotron"> 
		<small>Witaj w panelu użytkownika!</small>
		<div class="text-center">
			<p>Więcej szczegułów dot wybranej nieruchomości</p>
			<p><?php makeReserve();?></p>
			<p><?php deleteReserve();?></p>
		</div>
	</div>

	<div class="container">
		<div>
			<?php getPropertyMore();?>
		</div>
	</div>
	<script type="text/javascript">
		var t;
		var c = 0;

		function zegar() {
			document.getElementById('txt').value = c;
			c = c + 1;
			t = setTimeout("zegar()", 1000);
		}

		function stopZegar() {
			clearTimeout(t);
		}
	</script>
	<script type="text/javascript">
		setInterval("location.reload()", 300000);
	</script>
	
	<p id="demo" class="container"></p>
	
	<script>
		$('.carousel').carousel();
		(function ($) {
			$(document).ready(function () {
				$('ul.dropdown-menu [data-toggle=dropdown]').on('click', function (event) {
					event.preventDefault();
					event.stopPropagation();
					$(this).parent().siblings().removeClass('open');
					$(this).parent().toggleClass('open');
				});
			});
		})(jQuery);
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
<script src="_js/jquery.js"></script>
<script src="_js/bootstrap.min.js"></script>
<script src="_js/nowy.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/cookieconsent2/1.0.9/cookieconsent.min.js"></script>

</html>