<?php
mysql_connect('localhost', 'root', '');  
mysql_select_db('pai');  

$uEmail = mysql_real_escape_string($_POST['uEmail']);  
$result = mysql_query('SELECT CONTACT_EMAIL FROM CONTACT WHERE CONTACT_EMAIL ="'.$uEmail.'"');  

if(mysql_num_rows($result)>0){echo 0;}
else{echo 1;}  
?>