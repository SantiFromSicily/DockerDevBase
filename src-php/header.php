<header class="site-header" role="banner">
  <div class="container">
    <!-- Logo -->
    <div class="logo">
      <a href="index.php" aria-label="Homepage">
        <img src="img/logo.png" alt="Logo" />
      </a>
    </div>

    <!-- Menu principale di navigazione -->
    <nav class="main-nav" role="navigation" aria-label="Primary navigation">
      <ul>
        <li class="nav-item">
          <a href="index.php" class="nav-link">Home</a>
        </li>
        <li class="nav-item">
          <a href="index.php" class="nav-link">Chi Siamo</a>
        </li>
        <li class="nav-item has-submenu" aria-haspopup="true" aria-expanded="false">
          <a href="#" class="nav-link has-arrow" aria-controls="submenu-progetti" aria-expanded="false" aria-haspopup="true" aria-label="Apri il submenu Progetti">
            Progetti <span class="arrow" aria-hidden="true">▼</span>
          </a>
          <ul id="submenu-progetti" class="submenu" hidden>
            <!-- <li><a href="#" class="disabled-link" tabindex="-1" onclick="return false;">Progetto 1</a></li>
            <li><a href="#" class="disabled-link" tabindex="-1" onclick="return false;">Progetto 2</a></li>
            <li><a href="#" class="disabled-link" tabindex="-1" onclick="return false;">Progetto 3</a></li> -->
          </ul>
        </li>
        <li class="nav-item">
          <a href="index.php" class="nav-link">Contatti</a>
        </li>
      </ul>
    </nav>

    <!-- Controlli del tema e del menu mobile -->
    <nav class="nav-controls" role="navigation" aria-label="Theme and menu controls">
      <button id="theme-toggle" aria-label="Cambia tema" class="icon-btn theme-icon" type="button">🌗</button>
      <button id="menu-toggle" aria-label="Apri menu" class="icon-btn hamburger" aria-expanded="false" aria-controls="overlay-menu" type="button">
        <span class="bar bar1"></span>
        <span class="bar bar2"></span>
        <span class="bar bar3"></span>
      </button>
    </nav>
  </div>
</header>

<?php include 'menu.php'; ?>

<!-- <script src="js/header.js" defer></script> -->
<script src="js/submenu.js" defer></script>
<!-- <script src="js/menu.js" defer></script> -->

</body>
</html>
