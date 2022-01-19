<?php

    try{
        $db = new PDO("mysql:host=localhost;dbname=tuning", "root", "");
        $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        
        //echo "Connected!";
    }catch(PDOException $ex){
        //echo "Error: " . $ex->getMessage();
    }

?>