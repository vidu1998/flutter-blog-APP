<?php

   $db = mysqli_connect("localhost","root","","flutter_blog_tutorial");
 
 if(!$db){
 	echo"database Connect error".mysql_error();
 }
 $name=$_POST['name'];
  $list=array();
  
$result=$db->query("SELECT * FROM post_table 
  	WHERE category_name = '".$name."'");
   if($result){
       while($row= $result->fetch_assoc()){
       	$list[]=$row;
       }
       echo json_encode($list);
   }
?>