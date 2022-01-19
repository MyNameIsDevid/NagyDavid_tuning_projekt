<?php
    require "DB.php";
    
    $sql = "SELECT marka FROM Marka"; 

    
    $stm = $db->prepare($sql);
    $stm->execute();
    $result = $stm->fetchAll(PDO::FETCH_ASSOC);

    echo json_encode($result);
?>