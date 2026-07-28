<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

session_start();
//include '/home/$USER/vns-2025-e/docker-vns-2025-e/docker-apache/www/dbconnection.inc.php';
require_once("dbconnection.inc.php");
$mysqli = new mysqli($host, $user, $password, $database);
if ($mysqli->connect_error) {
  die("DB Verbindung fehlgeschlagen: " . $mysqli->connect_error);
}

$email = $_POST['email'] ?? '';
$password = $_POST['password'] ?? '';

if(!$email || !$password){
  header("Location: login.php?error=empty");
  exit;
}

$stmt = $mysqli->prepare("SELECT id, password FROM Users WHERE email=?");
$stmt->bind_param("s", $email);
$stmt->execute();
$stmt->bind_result($userid , $hash);
$stmt->fetch();
$stmt->close();
$mysqli->close();

if ($hash && password_verify($password , $hash)) {
  session_regenerate_id(true);
  $_SESSION['userid'] = $userid;
  $_SESSION['email'] = $email;

  header("Location: fibu.html");
  exit ;
}else{
  header("Location: login.php?error=false");
  exit ;
}
