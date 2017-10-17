<?php
require_once "connect.php";
mysqli_report(MYSQLI_REPORT_STRICT);

try {
	$link = new mysqli($db_host, $db_user,$db_pass,$db_name);
	mysqli_query($link, "SET NAMES 'utf8' COLLATE 'utf8_polish_ci'");
	mysqli_query($link,"SET GLOBAL event_scheduler='ON'");//dodałem sprawdz 
} 

catch (Exception $e ){	
	if (mysqli_connect_errno()) {
		printf("Connect failed: %s\n", mysqli_connect_error());
		exit();}
}	

try{
	foreach ($_POST as $k=>$v) {$_POST[$k] = mysqli_real_escape_string($link, $v);}

	$login=$_POST['login'];

	mysqli_query($link, "
		INSERT INTO LOGTABLE (ID_LOGTABLE,LOGTABLE_IP,LOGTABLE_WEB,LOGTABLE_NAME, LOGTABLE_TIME,LOGTABLE_RESULT) VALUES (NULL,'$_SERVER[REMOTE_ADDR]','$_SERVER[HTTP_USER_AGENT]','$login',NULL,0)");

	if(isset($_POST['login'])){
		$qq = mysqli_fetch_assoc( mysqli_query($link, "SELECT USER_SALT FROM USER WHERE USER_LOGIN='{$_POST['login']}';"));

		$salt = $qq['USER_SALT'];
		$sha1_pass = sha1(md5($_POST['pass'].$salt));
		$token = rand(0,10000);
		$t = date_create()->format('Y-m-d H:i:s');
		$login=$_POST['login'];

		$q = mysqli_fetch_assoc( mysqli_query($link, "SELECT COUNT(*) CNT, ID_USER_PK FROM USER WHERE USER_LOGIN='$login' AND USER_PASS = '$sha1_pass';"));		

		mysqli_query($link, "INSERT INTO LOGTABLE (ID_LOGTABLE,LOGTABLE_IP,LOGTABLE_WEB,LOGTABLE_NAME, LOGTABLE_TIME,LOGTABLE_RESULT) VALUES 
		(NULL,'$_SERVER[REMOTE_ADDR]','$_SERVER[HTTP_USER_AGENT]','$login',NULL,NULL)");

		if($q['CNT']){

			$id = $q['ID_USER_PK'];
			$id_user_pk = $q['ID_USER_PK'];
			$qqq = mysqli_fetch_assoc( mysqli_query($link, "SELECT VISIT_CNT FROM VISIT WHERE ID_USER_FK='$id';"));
			$cnt = $qqq['VISIT_CNT'];

			if ($cnt == NULL) {
				$cnt = 1;
				mysqli_query($link, "INSERT INTO VISIT(ID_VISIT_PK,ID_USER_FK,VISIT_CNT,VISIT_TIME) VALUES (NULL,'$q[ID_USER_PK]','$cnt','$t')");}

			if($qqq['VISIT_CNT']){
				$cnt = $cnt+ 1;
				mysqli_query($link, "UPDATE VISIT SET VISIT_CNT = '$cnt', VISIT_TIME = '$t' WHERE ID_USER_FK = '$id' AND MINUTE(TIMEDIFF(VISIT_TIME,NOW())) > 2 ;");}

			$id = md5(rand(-10000,10000) . microtime()) . md5(crc32(microtime()) . $_SERVER['REMOTE_ADDR']);
			mysqli_query($link, "DELETE FROM SESSION WHERE ID_USER_FK = '$q[ID_USER_PK]';"); 

			mysqli_query($link, "INSERT INTO SESSION (ID_SESSION_PK,ID_USER_FK,SESSION_TOKEN, SESSION_ID, SESSION_IP, SESSION_WEB,SESSION_TIME) 
			VALUES (NULL,'$q[ID_USER_PK]','$token','$id','$_SERVER[REMOTE_ADDR]','$_SERVER[HTTP_USER_AGENT]','$t')");

			if (! mysqli_errno($link)){
				mysqli_query($link, "UPDATE LOGTABLE SET LOGTABLE_RESULT = 1 WHERE LOGTABLE_NAME ='$login'");    
				setcookie("id", $id,time()+600);
				setcookie("token", $token,time()+600);

				$q2 = mysqli_fetch_assoc(mysqli_query($link,"select id_usertype_fk from user where id_user_pk ='$id_user_pk';"));	
				$ID_USERTYPE_FK = $q2['id_usertype_fk'];
				
				if($ID_USERTYPE_FK==1){
					header("refresh:0; url=_admin/index.php");}
				else
					header("refresh:0; url=main.php"); 
			} 
			else {
				echo "	
				<link href='_css/bootstrap.css' rel='stylesheet'>
				<link href='_css/style.css' rel='stylesheet'>
					<nav class='navbar navbar-inverse navbar-static-top marginBottom-0' role='navigation'>
						<div class='navbar-header'>
							<header class='page-header text-center'><h1>Serwis z nieruchomościami</h1></header>		
						</div>
					</nav>
						<div class='well container alert alert-danger'>
							<p style='text-align: center'>Błąd podczas logowania!<a href='main.php?logout=true'>logowanie</a></p>
						</div>";
				
				header("refresh:10; url=index.php");
			}
		} 
		else {
			echo "	
			<link href='_css/bootstrap.css' rel='stylesheet'>
			<link href='_css/style.css' rel='stylesheet'>
				<nav class='navbar navbar-inverse navbar-static-top marginBottom-0' role='navigation'>
					<div class='navbar-header'>
						<header class='page-header text-center'><h1>Serwis z nieruchomościami</h1></header>		
					</div>
				</nav>
					<div class='well container alert alert-danger'>
					<p style='text-align: center'>Błędny login bądź hasło!</br>Za chwilę nastąpi przekierowanie do strony logowania</br>
						Możesz również kliknąć: <a href='main.php?logout=true'>logowanie</a>
					<p>
				</div";
			
			header("refresh:6; url=index.php");
		} 
	}
}
catch (customException $e) {echo $e->errorMessage();}
?>