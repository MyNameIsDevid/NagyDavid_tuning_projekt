<?php
    require "DB.php";
    
    if(isset($_GET["marka"])){
        $marka = $_GET["marka"];
        $sql = "SELECT motor FROM Motor INNER JOIN Marka ON Marka.id = markaId WHERE Marka.marka = '$marka'"; 

        $stm = $db->prepare($sql);
        $stm->execute();
        $result = $stm->fetchAll(PDO::FETCH_ASSOC);
    
        echo json_encode($result);
    }

  
?>