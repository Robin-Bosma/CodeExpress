<?php

include "../include/connection.php";

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
    // Loop through the category checkboxes and set the corresponding value to true if checked
    if (!empty($_POST["category"])) {
        foreach ($_POST["category"] as $category) {
            $category_values[$category] = true;
        }
    }

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

    $sql = "INSERT INTO configuration (code, title, html, css, php, javascript, SQLcode, date, description)
            VALUES ('$code', '$title', '$html', '$css', '$php', '$javascript', '$sqlcode', '$date', '$description')";
    $pdo->exec($sql);
}
?>