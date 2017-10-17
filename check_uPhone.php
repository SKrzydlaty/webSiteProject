<?php
mysql_connect('localhost', 'root', '');  
mysql_select_db('pai');  

$uPhone = mysql_real_escape_string($_POST['uPhone']);  
$result = mysql_query('SELECT CONTACT_PHONE FROM CONTACT WHERE CONTACT_PHONE = "'.$uPhone.'"');  

if(mysql_num_rows($result)>0){echo 0;}
else{echo 1;}  
?>