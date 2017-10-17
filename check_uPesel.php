<?php
mysql_connect('localhost', 'root', '');  
mysql_select_db('pai');  

$uPesel = mysql_real_escape_string($_POST['uPesel']);  
$result = mysql_query('SELECT USER_PESEL FROM USER WHERE USER_PESEL = "'.$uPesel.'"');  

if(mysql_num_rows($result)>0){echo 0;}
else{echo 1;}  
?>