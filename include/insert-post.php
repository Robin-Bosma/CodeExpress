<?php

include "../include/connection.php";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
  // Get the form data
  $code = $_POST["code"];
  $title = $_POST["title"];
  $category = $_POST["category"];
  $date = $_POST["date"];
  $description = $_POST["description"];

  // plaats de data in de table
  $sql = "INSERT INTO configuration (code, title, category, date, description) VALUES (:code ,:title, :category, :date, :description)";

  // Prepare the statement
  $stmt = $pdo->prepare($sql);

  // Bind the parameters
  $stmt->bindParam(":code", $code);
  $stmt->bindParam(":title", $title);
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
