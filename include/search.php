<?php
// Define the database connection parameters
$host = "localhost";
$username = "root";
$password = "";
$dbname = "codeexpress";

// Create a database connection
$conn = mysqli_connect($host, $username, $password, $dbname);

// Check if the connection is successful
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

// Get the search query from the URL parameter
$search_query = $_GET['q'];

// Sanitize the search query to prevent SQL injection attacks
$search_query = mysqli_real_escape_string($conn, $search_query);

// Query the database for code pages that match the search query in the title
$sql = "SELECT * FROM overview WHERE title LIKE '%{$search_query}%'";

// Execute the query
$result = mysqli_query($conn, $sql);

// Display the search results
if (mysqli_num_rows($result) > 0) {
  while ($row = mysqli_fetch_assoc($result)) {
    echo "<a href='Overview.php?code_id={$row['id']}'>{$row['title']}</a><br>";
  }
} else {
  echo "No results found.";
}

// Close the database connection
mysqli_close($conn);
?>
