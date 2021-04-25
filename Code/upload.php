<?php
if (isset($_POST['upload'])) {
    $file_name = $_FILES['file']['name'];
    $file_type = $_FILES['file']['type'];
    $file_tem_loc = $_FILES['file']['tmp_name'];
    $file_tem_loc1 = $_FILES['file']['tmp_name'];
    $file_size = $_FILES['file']['size'];
    $file_store = "image/".$file_name;

    move_uploaded_file($file_tem_loc, $file_store);
  
 }
// if (isset($_POST['download'])){
 // $file = $_GET['file'];
//  header("content-disposition: attachment; filename=".urlencode($file));
//  $fb = fopen($file, "r");

 // while(!feof($fb)){
  //  echo fread($fb, 8192);
  //  flush();
 //}
// fclose($fb);
//}
?>
<!DOCTYPE html>
<html>
<head>
    <title>Enter Details</title>
   
</head>
<body>
<form action="?" method="post" enctype="multipart/form-data">
  <label>Select image to upload:</label>
  <input type="file" name="file"/>
  <input type="submit" value="Upload Image" name="upload">
</form>
<a href="image\Attendance.xlsx" download>
    <input type="button" value="Download">
</a>
</body>

</html>