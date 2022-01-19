<?php
    session_start();
?>

<!DOCTYPE html>
<html lang="hu">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="sajat.css">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="../bootstrap/js/bootstrap.js"></script>
    <title>Tuningolj! - Professzionális tuning alkatrészek japán motorokhoz</title>
</head>
<body>
    
    <div class="container">
        <nav class="navbar navbar-expand-sm">
            <ul class="navbar-nav">
                <li class="nav-item"><a  href="index.php?opcio=fooldal.php" class="nav-link">Főoldal</a></li>
                <li class="nav-item"><a href="index.php?opcio=alkatreszek.php" class="nav-link">Alkatrészek</a></li>
                <li class="nav-item"><a href="index.php?opcio=motorok.php" class="nav-link">Motorok</a></li>
                <li class="nav-item"><a href="index.php?opcio=markak.php" class="nav-link">Márkák</a></li>
                <li class="nav-item"><a href="index.php?opcio=rolunk.php" class="nav-link">Rólunk</a></li>
            </ul>
        </nav>
    </div>

    <div class="container">
        <?php
            if(isset($_GET["opcio"]))
                include $_GET["opcio"];
            else
                include "fooldal.php";
        ?>
    </div>


</body>
</html>