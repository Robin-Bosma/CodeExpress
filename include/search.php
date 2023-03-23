<?php
include "connection.php";

// Check if the search query parameter is set
if (isset($_GET['q'])) {
  // Get the search query from the URL parameter
  $search_query = $_GET['q'];

  // Sanitize the search query to prevent SQL injection attacks
  $search_query = mysqli_real_escape_string($conn, $search_query);

  // Query the database for code pages that match the search query in the title
  $sql = "SELECT * FROM configuration WHERE title LIKE '%{$search_query}%'";

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
} else {
  echo "Please enter a search query.";
}
?>
