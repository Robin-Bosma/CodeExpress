<?php
session_start();
include "../include/connection.php";

if (isset($_GET['q'])) {
    $query = $_GET['q'];
    try {
        $stmt = $pdo->prepare("SELECT * FROM configuration WHERE title LIKE ? OR tags LIKE ?");
        $stmt->execute(["%$query%", "%$query%"]);
        $result = $stmt->fetchAll(PDO::FETCH_ASSOC);
    } catch (\PDOException $e) {
        echo 'Error searching for code: ' . $e->getMessage();
    }
} else {
    echo "Please provide a search term.";
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Search Results</title>
</head>
<body>
    <?php if (isset($result) && count($result) > 0): ?>
        <h1>Search Results:</h1>
        <ul>
            <?php foreach ($result as $row): ?>
                <li><a href="../page/code.php?id=<?php echo $row['id']; ?>"><?php echo $row['title']; ?></a></li>
            <?php endforeach; ?>
        </ul>
    <?php elseif (isset($result) && count($result) === 0): ?>
        <p>No results found.</p>
    <?php endif; ?>
</body>
</html>
