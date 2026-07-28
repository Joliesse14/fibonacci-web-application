<!DOCTYPE html>
<html lang="de">
<head>
    <meta charset="UTF-8">
    <title>Login</title>
</head>
<body>
    <h1>Login</h1>
    
    <?php if (isset($_COOKIE["success"])): ?>
        <p style="color: green;"><?php echo htmlspecialchars($_COOKIE["success"]); ?></p>
    <?php endif; ?>
    
    <?php if (isset($_GET["error"])): ?>
        <p style="color: red;">
            <?php
                if ($_GET["error"] === "false") {
                    echo "Passwort oder E-Mail ungültig";
                }
                if ($_GET["error"] === "empty") {
                    echo "Füllen Sie alle Felder aus!";
                }
                if ($_GET["error"] === "out") {
                    echo "Ausgeloggt";
                }
            ?>
        </p>
    <?php endif; ?>
    
    <form action="log.php" method="post">
        <p>
            <input type="email" name="email" placeholder="E-Mail" required>
        </p>
        <p>
            <input type="password" name="password" placeholder="Passwort" required>
        </p>
        <p>
            <button type="submit">Anmelden</button>
        </p>
    </form>
    
    <p>Du hast noch kein Konto? <a href="register.php">Registrieren</a></p>
</body>
</html>
