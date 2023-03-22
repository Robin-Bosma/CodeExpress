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
    }
}

?>
    <!-- Navbar -->
    <div id="overview-container">
  <nav class="item">
    <?php include "../include/navbar.php" ?>
  </nav>

  <div id="overview-content" class="content">
    <h1>Dit is overview</h1>

    <?php foreach ($code_array as $key) { ?>
      <h1><a href="code.php?id=<?php echo $key->id ?>"><?php echo $key->title ?></a></h1>
      <p><?php echo $key->description ?></p>
    <?php } ?>
  </div>

  <footer class="footer">
    <?php include "../include/footer.php" ?>
  </footer>
</div>

</body>

</html>