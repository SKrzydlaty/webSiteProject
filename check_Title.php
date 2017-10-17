<?php
mysql_connect('localhost', 'root', '');  
mysql_select_db('pai');  

$PROPERTY_TITLE = mysql_real_escape_string($_POST['PROPERTY_TITLE']);  
$result = mysql_query('SELECT PROPERTY_TITLE FROM PROPERTY WHERE PROPERTY_TITLE = "'.$PROPERTY_TITLE.'"');  

if(mysql_num_rows($result)>0){echo 0;}
else{echo 1;}  
?>