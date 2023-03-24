  <?php

  include "connection.php";

  // Define an array to store the true/false values for each category
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
    if (isset($_POST["submit-public"])) {
        if (!empty($_POST["category"])) {
            foreach ($_POST["category"] as $category) {
                $category_values[$category] = true;
            }
      // Get the form data
      $code = $_POST["code"];
      $title = $_POST["title"];
      $creator = $_POST["creator"];
      $category = implode(',', $_POST["category"]);
      $description = $_POST["description"];
      $email = $_POST["email"];

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
      $creator = $_POST["creator"];
      $email = $_POST["email"];

      $date = date("Y-m-d H:i:s");

      // plaats de data in de table
      $sql = "INSERT INTO configuration (code,title, html, css, php, javascript, SQLcode, date, description, creator, email) 
      VALUES (:code,  :title, :html, :css, :php, :javascript, :SQLcode, :date, :description, :creator, :mail)";
      // Prepare the statement
      $stmt = $pdo->prepare($sql);

      // Bind the parameters
      $stmt->bindParam(":code", $code);
      $stmt->bindParam(":title", $title);
      $stmt->bindParam(":html", $html);
      $stmt->bindParam(":css", $css);
      $stmt->bindParam(":php", $php);
      $stmt->bindParam(":javascript", $javascript);
      $stmt->bindParam(":SQLcode", $sqlcode);
      $stmt->bindParam(":date", $date);
      $stmt->bindParam(":description", $description);
      $stmt->bindParam(":creator", $creator);
      $stmt->bindParam(":email", $email);
      // Execute the statement
      if ($stmt->execute()) {
        echo "New record created successfully";
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
      $html = $category_values["HTML"] ? '' : 'HTML';
      $css = $category_values["CSS"] ? '' : 'CSS';
      $php = $category_values["PHP"] ? '' : 'PHP';
      $javascript = $category_values["JavaScript"] ? '' : 'JavaScript';
      $sqlcode = $category_values["SQL"] ? '' : 'SQL';
      $date = date("Y-m-d H:i:s");
      $description = $_POST["description"];
      $email = $_POST["email"];

      // plaats de data in de table
      $sql = "INSERT INTO private_posts (url, code, email, description, title, html, css, php, javascript, SQLcode, creator, date) VALUES (:url, :code, :email, :description, :title, :html, :css, :php, :javascript, :SQLcode, :creator, :date)";

      // Prepare the statement
      $stmt2 = $pdo->prepare($sql);

      // Bind the parameters

      $stmt2->bindParam(":url", $url);
      $stmt2->bindParam(":code", $code);
      $stmt2->bindParam(":title", $title);
      $stmt2->bindParam(":html", $html);
      $stmt2->bindParam(":css", $css);
      $stmt2->bindParam(":php", $php);
      $stmt2->bindParam(":javascript", $javascript);
      $stmt2->bindParam(":SQLcode", $sqlcode);
      $stmt2->bindParam(":date", $date);
      $stmt2->bindParam(":description", $description);
      $stmt2->bindParam(":creator", $creator);
      $stmt2->bindParam(":email", $email);

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
  }
  ?>