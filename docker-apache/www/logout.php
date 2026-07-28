<?php
session_start();
session_unset();

header("Location: login.php?error=out");
exit;
session_destroy();
?>
