<html>
<body>

<h1>The a download attribute</h1>

<p>Click on the image to download it:<p>
    <?php

    $filePath = $_GET['C:\Users\jackson\Desktop\main.dart'];
    $fileName = basename($filePath);
    if (empty($filePath)) {
        echo "'path' cannot be empty";
        exit;
    }
    
    if (!file_exists($filePath)) {
        echo "'$filePath' does not exist";
        exit;
    }
    
    header("Content-disposition: attachment; filename=" . $fileName);
    header("Content-type: " . mime_content_type($filePath));
    readfile($filePath);
 
    ?>

</a>


</body>
</html>
