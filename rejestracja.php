<?php
require_once "connect.php";
mysqli_report(MYSQLI_REPORT_ERROR | MYSQLI_REPORT_STRICT);
ini_set("display_errors", 0);//DZIEKI TEMU NIE MA KRZACZOROW NA EKRANIE

echo "	
<link href='_css/bootstrap.css' rel='stylesheet'>
<link href='_css/style.css' rel='stylesheet'>
	<nav class='navbar navbar-inverse navbar-static-top marginBottom-0' role='navigation'>
		<div class='navbar-header'>
			<header class='page-header text-center'><h1>Serwis z nieruchomościami</h1><p>REJESTRACJA</p></header>		
		</div>
	</nav>
		<div class='well container alert alert-info'>";



if(isset($_POST['uLogin'])){
	mysqli_report(MYSQLI_REPORT_STRICT);

	try {
		$link = new mysqli($db_host, $db_user,$db_pass,$db_name);
		mysqli_query($link, "SET NAMES 'utf8' COLLATE 'utf8_polish_ci'");
	} 
	catch (Exception $e ) {	
		if (mysqli_connect_errno()) {
			printf("Connect failed: %s\n", mysqli_connect_error());
			exit();}
		else
			echo $e->errorMessage();}	
	
	try{
//		foreach ($_POST as $k=>$v) { $_POST[$k] = mysqli_real_escape_string($link, $v);}
		
		$login = $_POST['uLogin'];
		$check_login = strlen($login); 
		if ($check_login < 3) {
			echo '<p>Nieprawidłowa ilość znaków podana w login</p>';
			echo "<a href=\"javascript:history.go(-1)\">Wróć do formularza</a>";
			//throw new Exception('Nieprawidłowa ilość znaków podana w login');
		
		}
		
		$name = $_POST['uName'];
		
		$check_name = strlen($name);
		if ($check_name < 3 || $check_name > 20) {
			echo '<p>Nieprawidłowa ilość znaków podana w imieniu</p>';
			echo "<a href=\"javascript:history.go(-1)\">Wróć do formularza</a>";
			//throw new Exception('Nieprawidłowa ilość znaków podana w imieniu');
		
		}
		
		if (!ereg('^[a-zA-ZąćęłńóśżźĄĆĘŁŃÓŚŻŹ ]+$', $name)) {
			echo '<p>Tylko znaki alfabetu mogą występować w imieniu!</p>';
			echo "<a href=\"javascript:history.go(-1)\">Wróć do formularza</a>";
			//throw new Exception('Tylko znaki alfabetu mogą występować w imieniu!');
		}

		$surname = $_POST['uSurname'];

		$check_surname = strlen($surname);
		if ($check_surname < 3 || $check_surname > 20) {
			echo '<p>Nieprawidłowa ilość znaków podana w nazwisku</p>';
			echo "<a href=\"javascript:history.go(-1)\">Wróć do formularza</a>";
			//throw new Exception('Nieprawidłowa ilość znaków podana w nazwisku');
		}
		
		if (!ereg('^[a-zA-ZąćęłńóśżźĄĆĘŁŃÓŚŻŹ ]+$', $surname)) {
			echo '<p>Tylko znaki alfabetu mogą występować w nazwisku!</p>';
			echo "<a href=\"javascript:history.go(-1)\">Wróć do formularza</a>";
			//throw new Exception('Tylko znaki alfabetu mogą występować w nazwisku!');
		}
				
		$pesel = $_POST['uPesel'];
		$check_pesel = strlen($pesel);
		if ($check_pesel < 11 || $check_pesel > 11) {
			echo '<p>Nieprawidłowa ilość znaków podana w pesel</p>';
			echo "<a href=\"javascript:history.go(-1)\">Wróć do formularza</a>";
			//throw new Exception('Nieprawidłowa ilość znaków podana w pesel');
		}	
		if (!ereg('^[0-9 ]+$', $pesel)) {
			echo '<p>Tylko cyfry w numerze pesel!</p>';
			echo "<a href=\"javascript:history.go(-1)\">Wróć do formularza</a>";
			//throw new Exception('Tylko cyfry w numerze pesel!');
		}
		
		$email = $_POST['uEmail'];
		$check_email = strlen($email);
		if ($check_email < 7) {
			echo '<p>Nieprawidłowa ilość znaków podana w email</p>';
			echo "<a href=\"javascript:history.go(-1)\">Wróć do formularza</a>";
			//throw new Exception('Nieprawidłowa ilość znaków podana w email');
		}		
		
		$phone = $_POST['uPhone'];
		$check_phone = strlen($phone);
		if ($check_phone < 11 || $check_phone > 11) {
			echo '<p>Nieprawidłowa ilość znaków podana w phone</p>';
			echo "<a href=\"javascript:history.go(-1)\">Wróć do formularza</a>";
			//throw new Exception('Nieprawidłowa ilość znaków podana w phone');
		}

		$salt = rand(0,1000);
		
		if($_POST['uPass'] === $_POST['uPass2']){
			$sha1_pass = sha1(MD5($_POST['uPass'].$salt));
			$t = date_create()->format('Y-m-d H:i:s');

			//start transakcji
			$link->autocommit(false);
			mysqli_query($link,'SET TRANSACTION ISOLATION LEVEL SERIALIZABLE');

			$q = mysqli_fetch_assoc( mysqli_query($link, "SELECT ID_USER_PK FROM USER WHERE USER_LOGIN='$login';"));

			if ($q==true) {
				echo '<p>Podany login jest już zajęty!</p>';
				echo "<a href=\"javascript:history.go(-1)\">Wróć do formularza</a>";
				//throw new Exception('Podany login jest już zajęty!');
			}

			$result1 = mysqli_query($link,"INSERT INTO USER VALUES(NULL ,'2', '$login', '$sha1_pass', '$salt', '$name', '$surname', '$pesel','$t')");

			if ($result1 == false) {
				echo '<p>Nieudana proba dodania użytkownika do bazy danych!</p>';
				echo "<a href=\"javascript:history.go(-1)\">Wróć do formularza</a>";
				//throw new Exception('Nieudana proba dodania użytkownika do bazy danych!');
			}

			$q2 = mysqli_fetch_assoc( mysqli_query($link, "SELECT ID_USER_PK FROM USER WHERE USER_LOGIN='$login';"));

			if ($q2 == false) {
				echo '<p>Nieudana proba pobrania informacji nr ID użytkownika!</p>';
				echo "<a href=\"javascript:history.go(-1)\">Wróć do formularza</a>";
				//throw new Exception('Nieudana proba pobrania informacji o ID użytkownika!');
			}

			$result2 = mysqli_query($link, "INSERT INTO CONTACT VALUES(NULL,'$q2[ID_USER_PK]','$email','$phone')");
			
			if ($result2 == false) {
				echo '<p>Nieudana proba dodania do bazy informacji kontaktowych!</p>';
				echo "<a href=\"javascript:history.go(-1)\">Wróć do formularza</a>";
				//throw new Exception('Nieudana proba dodania do bazy informacji kontaktowych!');
			}


			if($result1==true && $result2==true){
				echo "<br><br>Dodano pomyślnie<br><br>";
				$link->commit();}
			 
			}
			else {
				echo '<p>Podane hasła są różne</p>';
				echo "<a href=\"javascript:history.go(-1)\">Wróć do formularza</a>";
				//throw new Exception('Podane hasła są różne!');
			}
		echo "</div>";
		header("refresh:3; url=index.php");	
	}
	catch (customException $e) 
	{		
		$link->rollback();
		echo $e->errorMessage();
	}
}
?>