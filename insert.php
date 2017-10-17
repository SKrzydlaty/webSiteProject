<?php
require_once "connect.php";
mysqli_report(MYSQLI_REPORT_ERROR | MYSQLI_REPORT_STRICT);
ini_set("display_errors", 0);//DZIEKI TEMU NIE MA KRZACZOROW NA EKRANIE

if(isset($_POST['add'])){
	try {
		$link = new mysqli($db_host, $db_user,$db_pass,$db_name);
		mysqli_query($link, "SET NAMES 'utf8' COLLATE 'utf8_polish_ci'");} 
	catch (Exception $e ) {	if (mysqli_connect_errno()) {
		printf("Connect failed: %s\n", mysqli_connect_error());
		exit();}
	}	
	try{
		echo "	
<link href='_css/bootstrap.css' rel='stylesheet'>
<link href='_css/style.css' rel='stylesheet'>
	<nav class='navbar navbar-inverse navbar-static-top marginBottom-0' role='navigation'>
		<div class='navbar-header'>
			<header class='page-header text-center'><h1>Serwis z nieruchomościami</h1><p>REJESTRACJA</p></header>		
		</div>
	</nav>
		<div class='well container alert alert-info'>";

		foreach ($_POST as $k=>$v) { $_POST[$k] = mysqli_real_escape_string($link, $v);}

		//start transakcji
		$link->autocommit(false);
		mysqli_query($link,'SET TRANSACTION ISOLATION LEVEL SERIALIZABLE');
		
		$q = mysqli_fetch_assoc(mysqli_query($link, "SELECT ID_USER_FK FROM SESSION WHERE SESSION_IP = '$_SERVER[REMOTE_ADDR]';"));
		
		$ID_USER_FK = $q['ID_USER_FK'];
		
		if ($q==false) {
			echo '<p>Nieudana proba zweryfikowania uzytkownika</p>';
			echo "<a href=\"javascript:history.go(-1)\">Wróć do formularza</a>";
			throw new Exception('Nieudana proba zweryfikowania uzytkownika');}
		
		$SPACE_TIME = date_create()->format('Y-m-d H:i:s');
		$SPACE_HECTARE = $_POST['SPACE_HECTARE']; 
		$SPACE_M2 = $_POST['SPACE_M2']; 
		$SPACE_INT_FLAT = $_POST['SPACE_INT_FLAT'];
		
		$result1 = mysqli_query($link, "INSERT INTO SPACE VALUES(NULL , '$ID_USER_FK', '$SPACE_HECTARE', '$SPACE_M2', '$SPACE_INT_FLAT', '$SPACE_TIME')");
		
		if ($result1==false) {
			echo '<p>Nieudana proba dodania rekordu to tabeli SPACE</p>';
			echo "<a href=\"javascript:history.go(-1)\">Wróć do formularza</a>";
			throw new Exception('Nieudana proba dodania rekordu to tabeli SPACE');}

		$qSpace = mysqli_fetch_assoc( mysqli_query($link, "SELECT ID_SPACE_PK FROM SPACE WHERE SPACE_TIME='$SPACE_TIME' and 
		ID_USER_FK ='$ID_USER_FK';"));

		if ($qSpace==false) {
			echo '<p>Nieudana proba pobrania rekordu z tabeli SPACE</p>';
			echo "<a href=\"javascript:history.go(-1)\">Wróć do formularza</a>";
			throw new Exception('Nieudana proba pobrania rekordu z tabeli SPACE');}

		$ID_SPACE_FK  = $qSpace['ID_SPACE_PK'];
		$CITY_TITLE = strip_tags($_POST['CITY_CHECK2']);
		
		$q = mysqli_fetch_assoc( mysqli_query($link, "SELECT ID_CITY_PK,COUNT(*) CNT FROM CITY WHERE CITY_TITLE='$CITY_TITLE';"));
		
		if($q['CNT']){$ID_CITY_FK = $q['ID_CITY_PK'];}
		
		if(!$q['CNT']){
			$q2 = mysqli_query($link, "INSERT INTO CITY VALUES(NULL ,'$CITY_TITLE')");
			
			if($q2 == false){
				echo "<a href=\"javascript:history.go(-1)\">Wróć do formularza</a>";
				throw new Exception('<p>Nieudana proba wstawienia danych do tabeli CITY</p>');}
			
			$q3 = mysqli_fetch_assoc( mysqli_query($link, "SELECT ID_CITY_PK FROM CITY WHERE CITY_TITLE='$CITY_TITLE';"));
			
			if($q3 == false){
				echo "<a href=\"javascript:history.go(-1)\">Wróć do formularza</a>";
				throw new Exception('<p>Nieudana proba pobrania danych z tabeli CITY</p>');}
			$ID_CITY_FK = $q3['ID_CITY_PK'];}

		$LOCALIZATION_STREET = strip_tags($_POST['LOCALIZATION_STREET']);
		$LOCALIZATION_STREET_NUMBER = strip_tags($_POST['LOCALIZATION_STREET_NUMBER']);
		$LOCALIZATION_POSTAL_CODE = strip_tags($_POST['LOCALIZATION_POSTAL_CODE']);
		$result2 = mysqli_query($link, "INSERT INTO LOCALIZATION VALUES(NULL , '$ID_CITY_FK', '$LOCALIZATION_STREET', '$LOCALIZATION_STREET_NUMBER', '$LOCALIZATION_POSTAL_CODE')");
		
		if ($result2==false) {
			echo '<p>Nieudana proba dodania rekordu to tabeli LOCALIZATION</p>';
			echo "<a href=\"javascript:history.go(-1)\">Wróć do formularza</a>";
			throw new Exception('Nieudana proba dodania rekordu to tabeli LOCALIZATION');}
		
		$qqq = mysqli_fetch_assoc( mysqli_query($link, "SELECT ID_LOCALIZATION_PK FROM localization WHERE id_city_fk='$ID_CITY_FK' and LOCALIZATION_STREET ='$LOCALIZATION_STREET' 
		and LOCALIZATION_STREET_number ='$LOCALIZATION_STREET_NUMBER' and LOCALIZATION_postal_code = '$LOCALIZATION_POSTAL_CODE';"));
		
		if($qqq == false){
			echo '<p>Nieudana proba pobrania danych z tabeli LOCALIZATION</p>';
			echo "<a href=\"javascript:history.go(-1)\">Wróć do formularza</a>";
			throw new Exception('Nieudana proba pobrania danych z tabeli LOCALIZATION');}
		
		$ID_LOCALIZATION_FK = $qqq['ID_LOCALIZATION_PK'];

		$PROPERTY_TITLE = strip_tags($_POST['PROPERTY_TITLE']);
		$PROPERTY_PRICE = strip_tags($_POST['PROPERTY_PRICE']);
		$PROPERTY_DESCRIPTION = strip_tags($_POST['PROPERTY_DESCRIPTION']);
		$ID_TYPE_FK = strip_tags($_POST['ID_TYPE_PK']);

		$q4 = mysqli_query($link, "INSERT INTO PROPERTY (ID_PROPERTY_PK, ID_LOCALIZATION_FK, ID_SPACE_FK, ID_TYPE_FK, ID_USER_FK, PROPERTY_TITLE, PROPERTY_PRICE, PROPERTY_DESCRIPTION, PROPERTY_TIME) values (NULL,'$ID_LOCALIZATION_FK','$ID_SPACE_FK','$ID_TYPE_FK','$ID_USER_FK','$PROPERTY_TITLE',$PROPERTY_PRICE,'$PROPERTY_DESCRIPTION',NULL);");
		
		if($q4 == false){
			echo '<p>Nieudana proba wstawienia danych do tabeli PROPERTY</p>';
			echo "<a href=\"javascript:history.go(-1)\">Wróć do formularza</a>";
			throw new Exception('Nieudana proba wstawienia danych do tabeli PROPERTY');}

		$f = $_FILES['plik'];
		$f2 = $_FILES['plik2'];

		$file_name = $_FILES['plik']['name'];
		$file_name2 = $_FILES['plik2']['name'];
		$file_size = number_format(($_FILES["plik"]["size"])/1024, 2);
		$file_size2 = number_format(($_FILES["plik2"]["size"])/1024, 2);

		$q5 = mysqli_fetch_assoc( mysqli_query($link, "SELECT ID_PROPERTY_PK FROM PROPERTY WHERE PROPERTY_TITLE='$PROPERTY_TITLE';"));
		$ID_PROPERTY_FK = $q5['ID_PROPERTY_PK'];
		
		$target_dir = "_upload/$ID_USER_FK/$ID_PROPERTY_FK/";
		$target_file = $target_dir . basename($_FILES["plik"]["name"]);
		$target_file2 = $target_dir . basename($_FILES["plik2"]["name"]);
		
		if($q5 == false){
			echo "<a href=\"javascript:history.go(-1)\">Wróć do formularza</a>";
			throw new Exception('Nieudana proba pobrania informacji z tabeli PROPERTY');}

		if((is_uploaded_file($_FILES['plik']['tmp_name']))&&(is_uploaded_file($_FILES['plik2']['tmp_name']))) {
			if ($_FILES["plik"]["size"] > 1024000) {
				echo "<p>Rozmiar pliku: $file_name przekracza 1.0MB!</p>";
				echo "<a href=\"javascript:history.go(-1)\">Wróć do formularza</a>";
				throw new Exception("Rozmiar pliku nr 1 przekracza 1.0MB!");}
			if($_FILES["plik2"]["size"] > 1024000){
				echo "<p>Rozmiar pliku: $file_name2 przekracza 1.0MB!</p>";
				echo "<a href=\"javascript:history.go(-1)\">Wróć do formularza</a>";
				throw new Exception("Rozmiar pliku nr 2 przekracza 1.0MB!");}
			if (file_exists($target_file)) {
				echo '<p>Przykro nam, ale plik o nazwie "$file_name" istnieje już w katalogu. Prosze nadać dla tego pliku inną nazwę</p>';
				echo "<a href=\"javascript:history.go(-1)\">Wróć do formularza</a>";
				throw new Exception('Przykro nam, ale plik o nazwie "$file_name" istnieje już w katalogu. Prosze nadać dla tego pliku inną nazwę');}
			if (file_exists($target_file2)) {
				echo '<p>Przykro nam, ale plik o nazwie "$file_name2" istnieje już w katalogu. Prosze nadać dla tego pliku inną nazwę</p>';
				echo "<a href=\"javascript:history.go(-1)\">Wróć do formularza</a>";
				throw new Exception('Przykro nam, ale plik o nazwie "$file_name2" istnieje już w katalogu. Prosze nadać dla tego pliku inną nazwę');}
			elseif ($target_file === $target_file2) {
				echo '<p>Wybrałeś 2 takie same zdjęcia!</p>';
				echo "<a href=\"javascript:history.go(-1)\">Wróć do formularza</a>";
				throw new Exception('Wybrałeś 2 takie same zdjęcia!');}
			elseif(($f['type'] == 'image/png' or $f['type'] == 'image/jpeg' or $f['type'] == 'image/gif') && ($f2['type'] == 'image/png' or $f2['type'] == 'image/jpeg' or $f2['type'] == 'image/gif')){

				//$link = new mysqli("localhost", "root", "","pai");
				//foreach (strip_tags($_POST as $k=>$v) { strip_tags($_POST[$k] = mysqli_real_escape_string($link, $v);}

				$q6 = mysqli_query($link, "INSERT INTO IMAGE VALUES(NULL, '$ID_PROPERTY_FK', '$target_file', '$file_name', '$file_size',NULL)");
				
				if ($q6==false) {
					echo '<p>Nieudana proba dodania rekordu to tabeli IMAGE</p>';
					echo "<a href=\"javascript:history.go(-1)\">Wróć do formularza</a>";
					throw new Exception('Nieudana proba dodania rekordu to tabeli IMAGE');}
				
				$q7 = mysqli_query($link, "INSERT INTO IMAGE VALUES(NULL, '$ID_PROPERTY_FK', '$target_file2', '$file_name2', '$file_size2',NULL)");
				
				if ($q7==false) {
					echo '<p>Nieudana proba dodania rekordu2 to tabeli IMAGE</p>';
					echo "<a href=\"javascript:history.go(-1)\">Wróć do formularza</a>";
					throw new Exception('Nieudana proba dodania rekordu2 to tabeli IMAGE');}
				echo "
				<div class=alert jumbotron alert-success>
					<div class=text-center>
						<p>Odebrano plik: $file_name, rozmiar: $file_size KB</p>
						<p>Odebrano plik: $file_name2, rozmiar: $file_size2 KB</p>
					</div>
				</div>";
				
				
				if (!file_exists("_upload/$ID_USER_FK/$ID_PROPERTY_FK")) {
					mkdir("_upload/$ID_USER_FK/$ID_PROPERTY_FK", 0777, true);
				}

				
				move_uploaded_file($_FILES['plik']['tmp_name'],$_SERVER['DOCUMENT_ROOT'].'/_project/_upload/'.$ID_USER_FK.'/'.$ID_PROPERTY_FK.'/'.$_FILES['plik']['name']);
				move_uploaded_file($_FILES['plik2']['tmp_name'],$_SERVER['DOCUMENT_ROOT'].'/_project/_upload/'.$ID_USER_FK.'/'.$ID_PROPERTY_FK.'/'.$_FILES['plik2']['name']);
			}
			
			else{
				if(!($f['type'] == 'image/png' or $f['type'] == 'image/jpeg' or $f['type'] == 'image/gif')){
					echo 'Plik: '.$file_name.' ma nie poprawne rozszerzenie.</br>';}
				if(!($f2['type'] == 'image/png' or $f2['type'] == 'image/jpeg' or $f2['type'] == 'image/gif')){
					echo 'Plik2: '.$file_name2.' ma nie poprawne rozszerzenie.</br>';}
				echo "
						<p>Niedozwolony plik!</br>Upewnij się, że plik który wskazałeś jest obrazem!</p>
				</div>";
			}
			if($link == false){
				echo "<a href=\"javascript:history.go(-1)\">Wróć do formularza</a>";
				
				echo "<a href=\"javascript:history.go(-1)\">Wróć do formularza</a>";new Exception('Nieudana proba przeslania danych do tabeli IMAGE');}
		}
		
		if($q4==true && $q6==true && $q7==true){
			echo "
						<p>Proces dodawawania zakonczony powodzeniem</p>
				</div>";
			$link->commit();}
		header("refresh:3; url=main.php"); 
	}
	catch (customException $e) {
		$link->rollback();
		echo $e->errorMessage();
		header("refresh:3; url=main.php");}
}
?>