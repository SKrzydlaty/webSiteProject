<?php
session_start();
require_once "../connect.php";
include("views.php");
include("call.php");
include("../timer.php");
include("deleteItProperty.php");
include("deleteItUser.php");
include("zestawienie.php");

if (! isset($_COOKIE['id'])){
	$q = mysqli_query($link, "delete from session where session_id = '$_COOKIE[id]' and session_web = '$_SERVER[HTTP_USER_AGENT]';");
	header("location:../index.php");
	exit;}

if (isset($_GET['logout'])){
	$q = mysqli_query($link, "delete from session where 
	session_id = '$_COOKIE[id]' and session_web = '$_SERVER[HTTP_USER_AGENT]';");	
	setcookie("id",0,time()-1);
	unset($_COOKIE['id']);
	setcookie("token",0,time()-1);
	unset($_COOKIE['token']);
	header("location:../index.php");exit;
}

if (isset($_COOKIE['id'])){
	$q = mysqli_fetch_assoc(mysqli_query($link, "SELECT SESSION_TOKEN,ID_USER_FK FROM SESSION WHERE SESSION_ID = '$_COOKIE[id]' AND SESSION_WEB = '$_SERVER[HTTP_USER_AGENT]' AND SESSION_IP = '$_SERVER[REMOTE_ADDR]';"));
	$id_user_pk = $q['ID_USER_FK'];
	$q2 = mysqli_fetch_assoc(mysqli_query($link,"select id_usertype_fk from user where id_user_pk ='$id_user_pk';"));	
	$ID_USERTYPE_FK = $q2['id_usertype_fk'];
	
	if($ID_USERTYPE_FK!=1){
		header("refresh:0; url=../main.php"); }
}
?>

<!doctype html>
<html lang="pl">

<head>
	<title>Nieruchomości</title>
	<meta charset="utf-8">
	<link href="../_css/bootstrap.css" rel="stylesheet">
	<link href="../_css/style.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
</head>

<body>
	<nav class="navbar navbar-inverse navbar-static-top marginBottom-0" role="navigation">
		<div class="navbar-header">
			<header class="page-header text-center"><h1>PANEL ADMINISTRATORA</h1></header>
		</div>
		<div class="collapse navbar-collapse" id="navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="active" id="liHome">
					<a href="index.php"><span class="glyphicon glyphicon-home"></span> 	Home</a></li>
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown">Wykonaj akcję<b class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><a href="../main.php">Menu użytkownika</a></li>
						<li><a href="index.php?vUser=1">Widok - użytkownicy</a></li>
						<li><a href="index.php?vProperty=1">Widok - oferty</a></li>
						<li><a href="index.php?pUser=1">Procedura puser(id)</a></li>
						<li><a href="index.php?ileOfert=1">Funkcja - ile ofert</a></li>
						<li><a href="index.php?deleteITU=1">Usuń użytkownika</a></li>
						<li><a href="index.php?deleteITP=1">Usuń nieruchomość</a></li>	
					</ul>
				</li>
				<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-user"></span>Profil<b class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><a href="#"><span class="glyphicon glyphicon-user"></span>Profil</a></li>
						<li><a>
							<?php
							$link = new mysqli($db_host, $db_user,$db_pass,$db_name);
							foreach ($_POST as $k=>$v) { $_POST[$k] = mysqli_real_escape_string($link, $v);}

							$q = mysqli_fetch_assoc(mysqli_query($link, "SELECT SESSION_TOKEN,ID_USER_FK FROM SESSION WHERE SESSION_ID = '$_COOKIE[id]' AND SESSION_WEB = '$_SERVER[HTTP_USER_AGENT]' AND SESSION_IP = '$_SERVER[REMOTE_ADDR]';"));

							$id_pk = $q['ID_USER_FK'];

							if (! empty($q['ID_USER_FK'])){
								$q2 = mysqli_fetch_assoc(mysqli_query($link, "SELECT user_name, user_surname from user where id_user_pk = '$id_pk';"));
								echo $q2['user_name'] ." ". $q2['user_surname'];
							} 
							else {header("location:../index.php");exit;}?>
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
	
	<noscript class="noscript">
		<div id="divno">
			<p>Do pełnej funkcjonalności tej strony konieczne jest włączenie obsługi JavaScript.
			Tutaj znajduje się link z instrukcją <a href="http://www.enable-javascript.com/" target="_blank">jak włączyć </a>obsługę JavaScript w Twojej przeglądarce.</p>
		</div>
	</noscript>
	
	<div class="alert jumbotron jumbo"> 
		<small>Witaj w panelu administratora!</small>
		<div class="alert alert-success" data-dismiss="alert">
			<?php
				$link = new mysqli($db_host, $db_user,$db_pass,$db_name);
				foreach ($_POST as $k=>$v) { $_POST[$k] = mysqli_real_escape_string($link, $v);}

				$q = mysqli_fetch_assoc(mysqli_query($link, "SELECT SESSION_TOKEN,ID_USER_FK FROM SESSION WHERE SESSION_ID = '$_COOKIE[id]' AND SESSION_WEB = '$_SERVER[HTTP_USER_AGENT]' AND SESSION_IP = '$_SERVER[REMOTE_ADDR]';"));
				
				$id_pk = $q['ID_USER_FK'];
				
				if (! empty($q['ID_USER_FK']))
					echo "Zalogowany użytkownik o ID: " . $q['ID_USER_FK']." [kliknij]";
				else {
					header("location:../index.php");exit;}?>
		</div>
		<div>
			<?php 
				if(isset($_GET['pUser'])){
					echo "
					<form method=post action='' class='well container' style='text-align:center'>
						<p>Procedura zwraca imię oraz nazwisko użytkownika.</p>
						<p>Wprowadź id:  <input type='text' name='ida'>
						<button class='btn btn-success' type=submit>Zatwierdź</button><p>
					</form>";}?>
			<?php ile_ofert(); ?>		
			<?php deleteItUser(); ?>
			<?php deleteItProperty(); ?>
			<?php viewOfUser();?>
			<?php viewOfProperty();?>
			<?php viewPuser();?>
		</div>
		

		
	</div>
	
	<script type="text/javascript">
		setInterval("location.reload()", 300000);
	</script>
	
	<footer class="flex-rw">
		<section class="footer-bottom-section flex-rw"> 
			&copy;2016 Krzysztof Stuglik, Kraków,PL<br>
			<span class="footer-bottom-rights"> - All Rights Reserved - </span> 
		</section>
	</footer>
</body>

<script src="../_js/jquery.js"></script>
<script src="../_js/preload.js"></script>
<script src="../_js/bootstrap.min.js"></script>

<script src="//cdnjs.cloudflare.com/ajax/libs/cookieconsent2/1.0.9/cookieconsent.min.js"></script>

</html>