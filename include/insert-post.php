<?php 

include "../include/connection.php";

// als de form word gepost
if ($_SERVER["REQUEST_METHOD"] == "POST") {
  // Get the form data
  $title = $_POST["title"];
  $category = $_POST["category"];
  $date = $_POST["date"];
  $description = $_POST["description"];

  // plaats de data in de table
  $sql = "INSERT INTO configuration (title, category, date, description) VALUES (?, ?, ?, ?)";

  if ($conn->query($sql) === TRUE) {
    echo "New record created successfully";
  } else {
    echo "Error: " . $sql . "<br>" . $conn->error;
  }
}

// Close database conectie
$conn->close();

?>