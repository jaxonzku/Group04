<?php
//Getting user uplooaded file
$file1= $_FILES["file"];
//Saving file in Uploads folder
move_uploaded_file($file1["tmp_file"], "Uploads/" . $file1["name"]);
header("Location : data.php");
?>