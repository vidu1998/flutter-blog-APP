<?php

   $db = mysqli_connect("localhost","root","","flutter_blog_tutorial");
 
 if(!$db){
 	echo"database Connect error".mysql_error();
 }
 $username=$_POST['username'];
 $password=$_POST['password'];

$sql="SELECT * FROM login_register WHERE username ='".$username."' AND password='".$password."'";
 $query=mysqli_query($db,$sql);
 $userdata=array();
 $count=mysqli_num_rows($query);


 if($count==1){

 	   $sql="SELECT *FROM login_register WHERE username='".$username."'";
 	   $query=mysqli_query($db,$sql);
 	   $data=mysqli_Fetch_array($query);
 	   $userdata=$data;
     echo json_encode($userdata);
  }else{
  	
  	echo json_encode("ERROR");
  }
 ?>