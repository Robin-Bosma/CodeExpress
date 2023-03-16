<?php

include "connection.php";

// Define an array to store the true/false values for each category
$category_values = array(
    'HTML' => false,
    'CSS' => false,
    'PHP' => false,
    'JavaScript' => false,
    'SQL' => false,
);

// Check if the form has been submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
  if (isset($_POST["public_post"])) {
    // Get the form data
    $code = $_POST["code"];
    $title = $_POST["title"];
    $creator = $_POST["creator"];
    $category = implode(',', $_POST["category"]);
    $description = $_POST["description"];

    // Insert the configuration data into the database
    $code = $_POST["code"];
    $title = $_POST["title"];
    $html = $category_values["HTML"] ? 'true' : 'false';
    $css = $category_values["CSS"] ? 'true' : 'false';
    $php = $category_values["PHP"] ? 'true' : 'false';
    $javascript = $category_values["JavaScript"] ? 'true' : 'false';
    $sqlcode = $category_values["SQL"] ? 'true' : 'false';
    $date = date("Y-m-d");
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
  } else if (isset($_POST["private_post"])) {
    // Create a private post
    // Generate a random URL
    $url = bin2hex(random_bytes(8));

    // Insert the post into the private_posts table

    $code = $_POST["code"];
    $title = $_POST["title"];
    $creator = $_POST["creator"];
    $category = implode(',', $_POST["category"]);
    $description = $_POST["description"];


    $date = date("Y-m-d H:i:s");

    // plaats de data in de table
    $sql = "INSERT INTO private_posts (url, code, description, title, creator, date, category) VALUES (:url, :code, :description, :title, :creator, :date, :category)";

    // Prepare the statement
    $stmt2 = $pdo->prepare($sql);

    // Bind the parameters
    $stmt2->bindParam(":url", $url);
    $stmt2->bindParam(":code", $code);
    $stmt2->bindParam(":title", $title);
    $stmt2->bindParam(":creator", $creator);
    $stmt2->bindParam(":category", $category);
    $stmt2->bindParam(":date", $date);
    $stmt2->bindParam(":description", $description);

    // Execute the statement
    if ($stmt2->execute()) {
      echo "New record created successfully";
    } else {
      $error = $stmt2->errorInfo()[2];
      echo "Error: " . $error;
    }
    // Redirect the user to the generated URL
    header("Location: ../page/private-post.php?url=$url");
    exit;
  }
}
?>