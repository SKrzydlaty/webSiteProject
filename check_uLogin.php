<?php
mysql_connect('localhost', 'root', '');  
mysql_select_db('pai');  

$uLogin = mysql_real_escape_string($_POST['uLogin']);  
$result = mysql_query('SELECT USER_LOGIN FROM USER WHERE USER_LOGIN = "'.$uLogin.'"');  
 
if(mysql_num_rows($result)>0){echo 0;}
else{echo 1;}  
?>