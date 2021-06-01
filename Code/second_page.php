<html lang="en">


<?php
   if(isset($_FILES['image'])){
      $errors= array();
      $file_name = $_FILES['image']['name'];
      $file_size =$_FILES['image']['size'];
      $file_tmp =$_FILES['image']['tmp_name'];
      $file_type=$_FILES['image']['type'];
      $tmp=explode('.',$file_name);
      $file_ext=strtolower(end($tmp));
      $file_namew='logo.jpg';
      
      $extensions= array("jpeg","jpg","png");
      
      if(in_array($file_ext,$extensions)=== false){
         $errors[]="extension not allowed, please choose a JPEG or PNG file.";
      }
      
      if($file_size > 2097152){
         $errors[]='File size must be excately 2 MB';
      }
      
      if(empty($errors)==true){

        
         move_uploaded_file($file_tmp,"images/".$file_namew);
         echo "Success";
      }else{
         print_r($errors);
      }
   }

   if(isset($_FILES['image2'])){
    $errors= array();
    $file_name = $_FILES['image2']['name'];
    $file_size =$_FILES['image2']['size'];
    $file_tmp =$_FILES['image2']['tmp_name'];
    $file_type=$_FILES['image2']['type'];
    $tmp=explode('.',$file_name);
    $file_ext=strtolower(end($tmp));

    $file_namew ="collegeimage.jpg";
    
    $extensions= array("jpeg","jpg","png");
    
    if(in_array($file_ext,$extensions)=== false){
       $errors[]="extension not allowed, please choose a JPEG or PNG file.";
    }
    
    if($file_size > 2097152){
       $errors[]='File size must be excately 2 MB';
    }
    
    if(empty($errors)==true){
       move_uploaded_file($file_tmp,"images/".$file_namew);
       echo "Success";
    }else{
       print_r($errors);
    }
 }
?>

<head>
    <!-- Required meta tags-->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Colorlib Templates">
    <meta name="author" content="Colorlib">
    <meta name="keywords" content="Colorlib Templates">

    <!-- Title Page-->
    <title>Buil your collegeAPP</title>

    <!-- Icons font CSS-->
    <link href="vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">
    <link href="vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
    <!-- Font special for pages-->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i"
        rel="stylesheet">

    <!-- Vendor CSS-->
    <link href="vendor/select2/select2.min.css" rel="stylesheet" media="all">
    <link href="vendor/datepicker/daterangepicker.css" rel="stylesheet" media="all">

    <!-- Main CSS-->
    <link href="css/main.css" rel="stylesheet" media="all">
</head>

<body>

    <div class="page-wrapper bg-gra-03 p-t-45 p-b-50">
        <div class="wrapper wrapper--w790">
            <div class="card card-5">
                <div class="card-heading">
                    <h2 class="title">College Social Media</h2>
                </div>
                <div class="card-body">
                    <form action="third_page.php" method="POST" enctype="multipart/form-data">
                        <div class="form-row">
                            <div class="label">Upload Your College LOGO </div>
                            <br> <br> <br>

                            <input type="file" name="image" value="" required>
                        </div>

                        <div class="form-row">
                            <div class="label">Upload a Photo of Your College</div>
                            <br> <br> <br>

                            <input type="file" name="image2" value="" required>
                        </div>

                       
                     


                        <div>
                            <button class="btn btn--radius-2 btn--red" type="submit">Proceed</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Jquery JS-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <!-- Vendor JS-->
    <script src="vendor/select2/select2.min.js"></script>
    <script src="vendor/datepicker/moment.min.js"></script>
    <script src="vendor/datepicker/daterangepicker.js"></script>

    <!-- Main JS-->
    <script src="js/global.js"></script>

</body><!-- This templates was made by Colorlib (https://colorlib.com) -->

</html>


<?php
    extract($_REQUEST);
    $file=fopen("details.txt","w");
    fwrite($file, $inst_name ."\n");
    fwrite($file, $app_name ."\n");
    fwrite($file, $details ."\n");
    fwrite($file, $reason ."\n");
    fwrite($file, $library ."\n");
    fwrite($file, $website ."\n");
    fwrite($file, $adminpass ."\n");
    fclose($file);
    $command = escapeshellcmd('python C:\xampp\htdocs\python\clean.py');
    $output = shell_exec($command);
    echo $output;
  
    
  ?>



<!-- end document-->