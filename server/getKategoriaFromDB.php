<?php

require "DB.php";

    if(isset($_GET["motor"])){
        $motor = $_GET["motor"];
        $sql = "SELECT kategoriak FROM Motor WHERE motor = '$motor'"; 

        $stm = $db->prepare($sql);
        $stm->execute();
        $result = $stm->fetchColumn();
    
        $idk = explode(',', $result);

        $array = [];

        for($i = 0; $i < count($idk); $i++){
            $sql = "SELECT kategoria FROM Kategoria WHERE id = $idk[$i]";
            $stm = $db->prepare($sql);
            $stm->execute();
            $result = $stm->fetchColumn();
            array_push($array, $result);
        }

        echo json_encode($array);

        //print_r($array);

        //echo json_encode($result);
    }

  
?>