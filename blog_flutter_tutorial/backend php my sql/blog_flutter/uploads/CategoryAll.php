<?php

   $db = mysqli_connect("localhost","root","","flutter_blog_tutorial");
 
 if(!$db){
 	echo"database Connect error".mysql_error();
 }
  $list=array();
  $result=$db->query("SELECT * FROM category ");
   if($result){
       while($row= $result->fetch_assoc()){
       	$list[]=$row;
       }
       echo json_encode($list);
   }
?>