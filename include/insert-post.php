<?php
include "connection.php";

// kiest of het true of false is 
$category_values = array(
  'HTML' => isset($_POST["category"]["HTML"]),
  'CSS' => isset($_POST["category"]["CSS"]),
  'PHP' => isset($_POST["category"]["PHP"]),
  'JavaScript' => isset($_POST["category"]["JavaScript"]),
  'SQL' => isset($_POST["category"]["SQL"]),
);

// checked of de post word gesubmit
if ($_SERVER["REQUEST_METHOD"] == "POST") {
  if (isset($_POST["submit-public"])) {
    // Get the form data
    $code = $_POST["code"];
    $title = $_POST["title"];
    $creator = $_POST["creator"];
    $category = implode(',', $_POST["category"]);
    $description = $_POST["description"];

    // Check if the post already exists
    $sql = "SELECT * FROM configuration WHERE code = :code";
    $stmt = $pdo->prepare($sql);
    $stmt->execute(array(':code' => $code));
    $row = $stmt->fetch(PDO::FETCH_ASSOC);

    if ($row) {
      // Post already exists, do not insert again
      echo "This post already exists in the database.";
    } else {
      // insert de informatie
      $html = $category_values["HTML"] ? '' : 'HTML';
      $css = $category_values["CSS"] ? '' : 'CSS';
      $php = $category_values["PHP"] ? '' : 'PHP';
      $javascript = $category_values["JavaScript"] ? '' : 'JavaScript';
      $sqlcode = $category_values["SQL"] ? '' : 'SQL';
      $date = date("Y-m-d H:i:s");

      $sql = "INSERT INTO configuration (code, title, html, css, php, javascript, sqlcode, date, description, creator) 
              VALUES (:code, :title, :html, :css, :php, :javascript, :sqlcode, :date, :description, :creator)";
      $stmt = $pdo->prepare($sql);
      $stmt->execute(array(
        ':code' => $code,
        ':title' => $title,
        ':html' => $html,
        ':css' => $css,
        ':php' => $php,
        ':javascript' => $javascript,
        ':sqlcode' => $sqlcode,
        ':date' => $date,
        ':description' => $description,
        ':creator' => $creator
      ));

      echo "Post inserted successfully.";
    }
  }
}
?>