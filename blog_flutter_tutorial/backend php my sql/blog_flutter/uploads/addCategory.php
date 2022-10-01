<?php

   $db = mysqli_connect("localhost","root","","flutter_blog_tutorial");
 
 if(!$db){
 	echo"database Connect error".mysql_error();
 }
 $name=$_POST['name'];
 $curDate=date('d/m/Y');
 $db->query("INSERT INTO category(name,create_date)VALUES('".$name."','".$curDate."') ");


 ?>