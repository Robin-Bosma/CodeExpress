<?php

include "../include/connection.php";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
  // krijg de data
  $code = $_POST["code"];
  $title = $_POST["title"];
  $creator = $_POST["creator"];
  $category = implode(',', $_POST["category"]);
  $description = $_POST["description"];


  $date = date("Y-m-d H:i:s");

  // plaats de data in de table
  $sql = "INSERT INTO configuration (code, title, creator, category, date, description) VALUES (:code ,:title, :creator, :category, :date, :description)";

  // Prepare the statement
  $stmt = $pdo->prepare($sql);

  // Bind the parameters
  $stmt->bindParam(":code", $code);
  $stmt->bindParam(":title", $title);
  $stmt->bindParam(":creator", $creator);
  $stmt->bindParam(":category", $category);
  $stmt->bindParam(":date", $date);
  $stmt->bindParam(":description", $description);


  // Execute the statement
  if ($stmt->execute()) {
    echo "New record created successfully";
  } else {
    $error = $stmt->errorInfo()[2];
    echo "Error: " . $error;
  }
}
