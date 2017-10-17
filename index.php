<?php
	if(isset($_SESSION['id']))
	{
		header('Location: main.php');
		exit();}
?>

<!doctype html>
<html lang="pl">

<head>
	<title>Nieruchomości</title>
	<meta charset="utf-8">
	<link href="_css/bootstrap.css" rel="stylesheet">
	<link href="_css/style.css" rel="stylesheet" type="text/css" /> </head>

<body>
	<nav class="navbar navbar-inverse navbar-static-top marginBottom-0" role="navigation">
		<div class="navbar-header">
			<header class="page-header text-center"><h1>Serwis z nieruchomościami</h1></header>
		</div>
	</nav>
	<div class="wrapper">
		<noscript class="noscript" style='font-size:0.5em;'>
			<div id="divno">
				<p>Do pełnej funkcjonalności tej strony konieczne jest włączenie obsługi JavaScript.
					Tutaj znajduje się link z instrukcją <a href="http://www.enable-javascript.com/" target="_blank">jak włączyć </a>obsługę JavaScript w Twojej przeglądarce.</p>
			</div>
		</noscript>
		<form class="form-signin" method="post" action="login.php">
			<h2 class="form-signin-heading page-header">Logowanie</h2>
			<input type="text" class="form-control" name="login" id="login" placeholder="Login" required="" autofocus="" />
			<input type="password" class="form-control" name="pass" id="pass" placeholder="Hasło" required="" />
			<label class="checkbox">
				<input type="checkbox" value="remember-me" id="rememberMe" name="rememberMe">
				<h5>Zapamiętaj</h5> </label>
			<button class="btn btn-lg btn-primary btn-block" type="submit">Zaloguj się</button>
			<div class="forgetQuest"><a href="index.php?forget=1">Zapomniałeś hasła?</a></div>
			<div class='forget'>
				<?php forgetPass() ?>
			</div>
		</form>
		<form class="form-signin" method=post action=register.php id="reg">
			<h3 class="form-signin-heading page-header">Rejestracja</h3>
			<button class="btn btn-info btn-primary btn-block" type="submit">Rejestracja</button>
		</form>
	</div>
</body>

</html>

<?php
function forgetPass()
{
	if(isset($_GET['forget'])){
		echo "<form method='post' action=''><input type='email' id='prosbaHaslo'></form><a href='index.php'><div class='alert alert-success' data-dismiss='alert'>Na Twój adres e-mail zostanie wysłany link do odzyskania hasła</div></a>";
	}
}?>