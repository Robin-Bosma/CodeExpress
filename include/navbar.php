<!DOCTYPE html>
<html lang="en">

<head>
  <title>Code Express</title>
  <link rel="icon" href="../img/CodeExpress-logo.png" type="image/x-icon">
</head>

<body>
<nav class="navbar">
  <div class="logo">
    <a href="../page/index.php"><img src="../img/CodeExpress-logo-text.png" alt="Logo"></a>
  </div>
  <ul class="navbar-all-code-links">
    <li><a href="../page/index.php">Home</a></li>
    <li>
    <div>ㅤ</div>
    </li>
    <li>
      <div class="separator">|</div>
    </li>
    <li>
    <div>ㅤ</div>
    </li>
    <li><a href="../page/overview.php">Overview</a></li>
    <li>
    <div>ㅤ</div>
    </li>
    <li>
      <div class="separator">|</div>
    </li>
    <li>
    <div>ㅤ</div>
    </li>
    <li><a href="mailto:infocodeexpress@gmail.com">Contact</a></li>
  </ul>

  <form action="../page/overview.php" method="get">
    <div class="search-bar">
      <input id="search-input" type="text" name="q" placeholder="What are you looking for?" value="<?php echo isset($_GET['q']) ? htmlspecialchars($_GET['q']) : '' ?>">
      <img src="../img/spyglass.png" alt="spyglass"></button>
    </div>
  </form>
</nav>

</body>

</html>