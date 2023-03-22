<?php
session_start();
include "../include/connection.php"
?>

<!DOCTYPE html>
<html lang="en">

<head>
<title>Code Express</title>
    <link rel="icon" href="../img/logo.png" type="image/x-icon" />
    <style>
        <?php include '../style.css'; ?>
    </style>
</head>

<body>

    <?php

$stmt = $pdo->prepare("SELECT * FROM configuration");
$stmt->execute();
$code_array = $stmt->fetchAll(PDO::FETCH_OBJ);

function echoCode($code_array)
{
    foreach ($code_array as $key) {
        echo "<div><strong>Title:</strong> " . $key->title . "</div>";
        echo "<div><strong>Description:</strong> " . $key->description . "</div>";
        echo "<div><a href='code.php?id=$key->id'>Details</a></div>";
        echo "<div><strong>creator:</strong> " . $key->creator . "</div>";
        echo "<div><strong>date:</strong> " . $key->date . "</div>";
    }
}

?>
    <!-- Navbar -->
    <div id="overview-container">
  <nav class="item">
    <?php include "../include/navbar.php" ?>
  </nav>

  <div id="overview-content" class="content">

    <?php foreach ($code_array as $key) { ?>
      <h1 class="overview-line"><a class="overview-link" href="code.php?id=<?php echo $key->id ?>"><?php echo $key->title ?></a></h1>
      <div id="overview-item">
      <p><?php echo $key->description ?></p>
      <p id="overview-end"> Created by: <?php echo $key->creator ?></p>
      <p class="overview-end">Date created: <?php echo $key->date ?></p>
        </div>
    <?php } ?>


  <footer class="footer">
    <?php include "../include/footer.php" ?>
  </footer>
</div>

</body>

</html>