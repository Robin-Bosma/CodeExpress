<?php

include "../include/connection.php";


if (isset($_POST["submit"])) {
    $email = $_POST["email"]; // get the identifier from the form

    // Query the database to find the corresponding private post    
    $stmt = $pdo->prepare("SELECT * FROM private_posts WHERE email = ?");
    $stmt->execute([$email]);
    $post = $stmt->fetch(PDO::FETCH_ASSOC);

    if ($post) {
        $url = $post["url"]; //get the URL from post
        echo "Your private URL is: http://localhost/project-2/page/private-post.php?url=$url";
    } else {
        echo "Sorry, we couldn't find your private URL. Please check your email and try again.";
    }
}

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Retrieve Private URL</title>
</head>

<body>
    <h1>R   etrieve Private URL</h1>
    <form method="post">
        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required>
        <br>
        <input type="submit" name="submit" value="Retrieve URL">
    </form>
</body>

</html>