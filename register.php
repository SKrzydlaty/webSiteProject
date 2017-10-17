<!DOCTYPE html>
<html lang="pl" ng-app="exampleApp">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>NIERUCHOMOŚCI</title>
	<link href='http://fonts.googleapis.com/css?family=Open+Sans:700,300,600,400&subset=latin,latin-ext' rel='stylesheet' type='text/css'>
	<link href="_css/bootstrap.css" rel="stylesheet">
	<link href="_css/style.css" rel="stylesheet">
</head>

<body>
	<nav class="navbar navbar-inverse navbar-static-top marginBottom-0" role="navigation">
		<div class="navbar-header">
			<header class="page-header text-center"><h1>Serwis z nieruchomościami</h1><p>REJESTRACJA</p></header>		
		</div>
	</nav>
	<noscript class="noscript">
		<div id="divno">
			<p>Do pełnej funkcjonalności tej strony konieczne jest włączenie obsługi JavaScript.
				Tutaj znajduje się link z instrukcją <a href="http://www.enable-javascript.com/" target="_blank">jak włączyć </a>obsługę JavaScript w Twojej przeglądarce.</p>
		</div>
	</noscript>
	<div class="well container">
		<div class="row">
			<form name="form" class="form-horizontal" method="post" action="rejestracja.php">
				<div ng-show="form.$submitted">
					<div ng-show="form.$valid" class="alert alert-success"> 
						<strong>Sukces!</strong> Twoje dane zostały zapisane! 
					</div>
					<div ng-show="form.$invalid" class="alert alert-warning"> 
						<strong>Uwaga!</strong> Popraw błędy formularza! 
					</div>
				</div>
				<div class="form-group">
					<label for="uName" class="col-sm-2 control-label">Imię*</label>
					<div class="col-sm-4">
						<input type="text" name="uName" id="uName" ng-model="user.name" ng-minlength="3" ng-maxlength="20" ng-pattern="/^[A-z][A-z]*$/" required="" class="form-control">
						<div ng-messages="form.uName.$error" ng-show="form.$submitted || form.uName.$touched"> 
							<span ng-message="required" class="info-block">
								<li>Należy podać imię!</li>
							</span> 
							<span ng-show="!form.uName.$error.minLength && !form.uName.$error.maxLength && form.uName.$error.pattern && form.uName.$dirty" class="info-block">
								<li>Musi zaczynać się od litery i zawierać litery &amp; żadnych cyfr</li>
							</span> 
							<span ng-show="!form.uName.$error.required && (form.uName.$error.minlength || form.uName.$error.maxlength) && form.uName.$dirty" class="info-block">
								<li>Imię musi składać się z conajmniej 3 znaków</li>
							</span> 
						</div>
					</div>
				</div>
				<div class="form-group">
					<label for="uSurname" class="col-sm-2 control-label">Nazwisko*</label>
					<div class="col-sm-4">
						<input type="text" name="uSurname" id="uSurname" ng-model="user.surname" ng-minlength="3" ng-maxlength="20" ng-pattern="/^[A-z][A-z]*$/" required="" class="form-control">
						<div ng-messages="form.uSurname.$error" ng-show="form.$submitted || form.uSurname.$touched"> 
							<span ng-message="required" class="info-block">
								<li>Należy podać nazwisko!</li>
							</span> 
							<span ng-show="form.uSurname.$error.minLength && form.uSurname.$error.maxLength && form.uSurname.$error.pattern && form.uSurname.$dirty" class="info-block">
								<li>Musi zaczynać się od litery i zawierać litery &amp; żadnych cyfr</li>
							</span> 
							<span ng-show="!form.uSurname.$error.required && (form.uSurname.$error.minlength || form.uSurname.$error.maxlength) && form.uSurname.$dirty" class="info-block">
								<li>Nazwisko musi składać się z conajmniej 3 znaków</li>
							</span> 
						</div>
					</div>
				</div>
				<div class="form-group">
					<label for="uEmail" class="col-sm-2 control-label">E-mail*</label>
					<div class="col-sm-4">
						<input type="email" id="uEmail" name="uEmail" ng-model="user.email" required="required" class="form-control">
						<div ng-messages="form.uEmail.$error" ng-show="form.$submitted || form.uEmail.$touched"> 
							<span ng-message="required" class="info-block">
								<li>Należy podać e-mail!</li>
							</span> 
							<span ng-message="email" class="info-block">
								<li>Podany e-mail jest nieprawidłowy</li>
							</span> 
						</div>
						<div id='uEmail_availability_result' class="info-true"></div>
					</div>
				</div>
				<div class="form-group">
					<label for="uLogin" class="col-sm-2 control-label">Login*</label>
					<div class="col-sm-4">
						<input type="text" id="uLogin" name="uLogin" ng-model="user.login" required="required" class="form-control">
						<div ng-messages="form.uLogin.$error" ng-show="form.$submitted || form.uLogin.$touched"> 
							<span ng-message="required" class="info-block">
								<li>Należy podać login!</li>
							</span> 
						</div>
						<div id='uLogin_availability_result' class="info-true"></div>
					</div>
				</div>
				<div class="form-group">
					<label for="uPass" class="col-sm-2 control-label">Hasło*</label>
					<div class="col-sm-4">
						<input type="password" id="uPass" name="uPass" ng-model="user.pass" required="required" ng-minlength="8" ng-maxlength="20" ng-pattern="/(?=.*[a-z])(?=.*[A-Z])(?=.*[^a-zA-Z])/" class="form-control">
						<div ng-messages="form.uPass.$error" ng-show="form.$submitted || form.uPass.$touched"> 
							<span class="info-block" ng-message="required"><li>Należy podać hasło!</li></span>
							<span class="info-block" ng-show="!form.uPass.$error.required && (form.uPass.$error.minlength) && form.uPass.$dirty"><li>Hasło musi składać się z przynajmniej 8 znaków</li></span> 
							<span class="info-block" ng-message="pattern"><li>Hasło musi zawierać przynajmniej jedną małą i wielką literę, przynajmniej jednej znak-symbol lub cyfrę.</li></span>
						</div>
					</div>
				</div>
				<div class="form-group">
					<label for="uPass2" class="col-sm-2 control-label">Powtórz hasło*</label>
					<div class="col-sm-4">
						<input type="password" id="uPass2" name="uPass2" ng-model="user.pass2" required="required" ng-pattern="\b{{user.pass}}\b" class="form-control">
						<div ng-messages="form.uPass2.$error" ng-show="form.$submitted || form.uPass2.$touched"> 
							<span ng-message="required" class="info-block"><li>Należy ponownie podać hasło!</li></span>
							<span class="info-block" ng-show="!form.uPass.$error.required && (form.uPass.$error.minlength) && form.uPass.$dirty"><li>Hasło musi składać się z przynajmniej 8 znaków</li></span> 
						</div>
						<div id='uPass2_result' class="info-true"></div>
					</div>
				</div>
				<div class="form-group">
					<label for="uPesel" class="col-sm-2 control-label">Pesel*</label>
					<div class="col-sm-4">
						<input type="text" id="uPesel" name="uPesel" ng-model="user.pesel" required="required" class="form-control" ng-minlength="11" ng-maxlength="11" ng-pattern="/^[0-9]*$/">
						<div ng-messages="form.uPesel.$error" ng-show="form.$submitted || form.uPesel.$touched"> 
							<span ng-message="required" class="info-block">
								<li>Należy podać pesel!</li></span> 
							<span ng-show="form.uPesel.$error.pattern" class="info-block">
								<li>Tylko cyfry!</li></span> 
							<span ng-show="!form.uPesel.$error.required && (form.uPesel.$error.maxlength) && form.uPesel.$dirty" class="info-block">
								<li>Za dużo cyfr zostało wpisanych!</li></span> 
						</div>
						<span ng-message="pattern" class="info-block">Tylko cyfry!</span>
						<div id='uPesel_availability_result' class="info-true"></div>
						<div id='wynik' class="info"></div>
					</div>
				</div>
				<div class="form-group">
					<label for="uPhone" class="col-sm-2 control-label">Telefon</label>
					<div class="col-sm-4">
						<input type="text" id="uPhone" name="uPhone" ng-model="user.phone" pattern="\d{3}-\d{3}-\d{3}" placeholder="format: 123-456-789" class="form-control">
						<div ng-messages="form.uPhone.$error" ng-show="form.$submitted || form.uPhone.$touched"> 
							<span ng-message="pattern" class="info-block">
								<li>Numer telefonu należy podać w formacie 123-456-789</li>
							</span> 
						</div>
						<div id='uPhone_availability_result'></div>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-8 col-sm-offset-1">
						<div class="checkbox">
							<label>
								<input type="checkbox" id="uConfirm" name="uConfirm" ng-model="user.confirm" required="">Chcę utworzyć konto</label>
						</div>
						<div ng-messages="form.uConfirm.$error" ng-show="form.$submitted || form.uConfirm.$touched"> 
							<span ng-message="required" class="info-block"><li>Czy chcesz utworzyć konto?</li></span> 
						</div>
					</div>
				</div>
				<div style="text-align:center;">
					<button class="btn btn-success" type=submit>Zarejestruj</button>
				</div>
			</form>
		</div>
	</div>
	<script src="_js/jquery.js"></script>
	<script src="_js/bootstrap.min.js"></script>
	<script src="_js/angular.min.js"></script>
	<script src="_js/angular-messages.min.js"></script>
	<script src="_js/nowy.js"></script>
	<script src="_js/pesel.js"></script>
	<script>
		var app = angular.module('exampleApp', ['ngMessages']);
	</script>
	
	<script>
		$('#uPass2').keyup(function () {
			var len = $('#uPass2').val().length;
			
			if (len < 8) {
				$('#uPass2_result').html("<li>Hasło jest za krótkie!</li>");}
			if (len >= 8) {
				var pass1 = $('#uPass').val();
				var pass2 = $('#uPass2').val();
				var znak = pass1.charCodeAt(0);
				
				
				if(pass1 === pass2){
					$('#uPass2_result').html("<li>Podane hasła są takie same</li>");
				}
				else{
					$('#uPass2_result').html("<li>Podane hasła różnią się!</li>");
				}
		}});

	</script>
	<br><a href="index.php" class="btn btn-primary">Wróc do panelu logowania</a> </body>

</html>