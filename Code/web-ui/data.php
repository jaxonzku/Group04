<!DOCTYPE html>
<html>
<head>
    <title>College Social Media App</title>
    <link rel="stylesheet" href="style.css" type="text/css">
</head>
<body>
<div class="main">
<div class="register">
    <h2>Register Here</h2>
    <form id="register" method="post">
    <label>College Name : </label>
    <br>
    <input type="text" name="name" id="name" placeholder="Enter College Name">
    <br><br>
    <label>Number of Students : </label>
    <br>
    <input type="number" name="Students" id="name" placeholder="Enter No. of Students">
    <br><br>
    <label>Number of Faculties : </label>
    <br>
    <input type="number" name="Faculties" id="name" placeholder="Enter No. of Faculties">
    <br><br>
    <label>Email id : </label>
    <br>
    <input type="email" name="email" id="name" placeholder="Enter Valid College Email">
    <br><br>
    <label>Upload College Logo</label>
    <br>
    <input type="upload" value="Upload" name="upload" id="upload">
    <br><br>
    <label>Upload Other Details</label>
    <br>
    <input type="upload" value="Upload" name="upload" id="upload">
    <br><br>
    <input type="submit" value="Submit" name="submit" id="submit">
    <br><br>
    <label>Generate College App</label>
    <br>
    <input type="generate" value="Generate" name="generate" id="generate">
    </form>
</div>
</div>
</body>
</html>
<?php
   extract($_REQUEST);
   $file=fopen("details.txt","a");
   
   fwrite($file,"College Name : ");
   fwrite($file, $name ."\n");
   fwrite($file,"Number of Students : ");
   fwrite($file, $Students ."\n");
   fwrite($file,"Number of Faculties : ");
   fwrite($file, $Faculties ."\n");
   fwrite($file,"Email id : ");
   fwrite($file, $email ."\n");
   fclose($file);
?>
   