<?php
mysql_connect('localhost', 'root', '');  
mysql_select_db('pai');  

$ID_PROPERTY_FK = mysql_real_escape_string($_POST['avProperty']);  
$result = mysql_query('SELECT * FROM BUY WHERE ID_PROPERTY_FK = "'.$ID_PROPERTY_FK.'"');  

if(mysql_num_rows($result)>0){echo 0;}
else{echo 1;}  
?>