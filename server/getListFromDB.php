<?php

    require "DB.php";

    $motor = $_GET["motor"];
    $alkatresz = $_GET["alkatresz"];


    $sql = "SELECT parts.nev, leiras, ar, kep FROM parts INNER JOIN motor ON motor.id = motorId INNER JOIN alkatresz ON alkatresz.id = alkatreszId WHERE motor.motor = '$motor' AND alkatresz.nev_bg = '$alkatresz'";

    $stm = $db->prepare($sql);
    $stm->execute();
    $result = $stm->fetchAll(PDO::FETCH_ASSOC);


    echo json_encode($result);

?>