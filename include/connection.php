<?php

$host = "localhost";
$dbname = "codeexpress";
$password = "";
$username = "root";

$conn = mysqli_connect($host, $username, $password, $dbname);

if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}
 ?>