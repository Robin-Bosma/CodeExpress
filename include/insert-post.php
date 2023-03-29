  <?php

  include "connection.php";

  // Check if the form has been submitted
  if ($_SERVER["REQUEST_METHOD"] == "POST") {
    if (isset($_POST["submit-public"])) {


      // Insert the configuration data into the database
      $code = $_POST["code"];
      $title = $_POST["title"];
      $tags = $_POST["tags"];
      $date = date("Y-m-d");
      $description = $_POST["description"];
      $creator = $_POST["creator"];
      $email = $_POST["email"];

      // plaats de data in de table
      $sql = "INSERT INTO configuration (code, email, title, tags, date, description, creator) 
      VALUES (:code, :email, :title, :tags, :date, :description, :creator)";
      // Prepare the statement
      $stmt = $pdo->prepare($sql);

      // Bind the parameters
      $stmt->bindParam(":code", $code);
      $stmt->bindParam(":title", $title);
      $stmt->bindParam(":tags", $tags);
      $stmt->bindParam(":date", $date);
      $stmt->bindParam(":description", $description);
      $stmt->bindParam(":creator", $creator);
      $stmt->bindParam(":email", $email);

      // Execute the statement
      if ($stmt->execute()) {
        // Show a JavaScript alert with the success message
        echo '<script>alert("New record created successfully");</script>';
      } else {
        $error = $stmt->errorInfo()[2];
        echo "Error: " . $error;
      }
    } else if (isset($_POST["submit-private"])) {
      // Create a private post
      // Generate a random URL
      $url = bin2hex(random_bytes(8));

      // Insert the post into the private_posts table

      $code = $_POST["code"];
      $title = $_POST["title"];
      $creator = $_POST["creator"];
      $tags = $_POST["tags"];
      $date = date("Y-m-d H:i:s");
      $description = $_POST["description"];
      $email = $_POST["email"];

      // plaats de data in de table
      $sql = "INSERT INTO private_posts (url, code, email, description, title, tags, creator, date) 
              VALUES (:url, :code, :email, :description, :title, :tags, :creator, :date)";

      // Prepare the statement
      $stmt2 = $pdo->prepare($sql);

      // Bind the parameters

      $stmt2->bindParam(":url", $url);
      $stmt2->bindParam(":code", $code);
      $stmt2->bindParam(":title", $title);
      $stmt2->bindParam(":tags", $tags);
      $stmt2->bindParam(":date", $date);
      $stmt2->bindParam(":description", $description);
      $stmt2->bindParam(":creator", $creator);
      $stmt2->bindParam(":email", $email);

      // Execute the statement
      if ($stmt2->execute()) {

        //
        // *** To Email ***
        $to = "$email";
        //
        // *** Subject Email ***
        $subject = "URL for private post";
        //
        // *** Content Email ***
        $content = "Here is your url for your private post http://localhost/project-2/page/private-post.php?url=$url";
        //
        //*** Head Email ***
        $headers = "From: infocodeexpress@gmail.com\r\n";
        //
        //*** Show the result... ***
        if (mail($to, $subject, $content, $headers)) {
          echo "Success !!!";
        } else {
          echo "ERROR";
        }

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
