<?php

   $db = mysqli_connect("localhost","root","","flutter_blog_tutorial");
 
 if(!$db){
 	echo"database Connect error".mysql_error();
 }
$id=$_POST['id'];

   $db->query("DELETE FROM category WHERE id='".$id."' ");

   ?>