<?php

   $db = mysqli_connect("localhost","root","","flutter_blog_tutorial");
 
 if(!$db){
 	echo"database Connect error".mysql_error();
 }

 $username=$_POST['username'];
 $password=$_POST['password'];
 $name=$_POST['name'];

 $sql="SELECT * FROM login_register WHERE username ='".$username."'";
 $query=mysqli_query($db,$sql);
 $userdata=array();
 $count=mysqli_num_rows($query);
  if($count==1){
     echo json_encode("ERROR");
  }else{
  	$insert="INSERT INTO login_register(username,password,name) VALUES('".$username."','".$password."','".$name."')";

  	$result=mysqli_query($db,$insert);

  	if($result){
  		$sql="SELECT * FROM login_register WHERE username ='".$username."'";
  		$query=mysqli_query($db,$sql);
        $data=mysqli_fetch_array($query);
        $userdata=$data;
  	}
  	echo json_encode($userdata);
  }
 ?>