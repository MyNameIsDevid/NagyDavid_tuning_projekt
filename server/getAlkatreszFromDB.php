<?php
    require "DB.php";

    $kategoria = $_GET["kategoria"];

    $sql = "SELECT nev, nev_bg FROM alkatresz INNER JOIN kategoria ON katId = kategoria.id WHERE kategoria.kategoria = '$kategoria'";

    $stm = $db->prepare($sql);
    $stm->execute();
    $result = $stm->fetchAll(PDO::FETCH_ASSOC);

    echo json_encode($result);

?>