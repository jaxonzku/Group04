

<?php
   


  
    extract($_REQUEST);
    $file=fopen("details.txt","w");
    fwrite($file, $name ."\n");
    fwrite($file, $text ."\n");
    fwrite($file, $select ."\n");
    fclose($file);
    header("location: page-2.php");
   
   

    
    
  

   
?>