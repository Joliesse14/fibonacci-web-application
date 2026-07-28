<?php
require_once("dbconnection.inc.php");
//include '/home/$USER/vns-2025-e/docker-vns-2025-e/docker-apache/www/dbconnection.inc.php';

if(!is_dir("logs")){
	mkdir("logs", 0777, true);
}

$email = $argv[1] ?? '';
if (!$email) {
  exit("Keine E-mail angegeben\n");
}

$redis = new Redis();
$redis->connect($redisserver, 6379);
$redis->auth($redispwd);

$message = "Hallo $email,\n\n"
         . "deine Registrierung war erfolgreich! \n"
         . "Viel Spaß beim Berechnen von Fibonacci-Zahlen auf unserer Seite.\n\n"
         . "Liebe Grüße,\n"
         . "Dein Fibo-Team";

$job = [
  'email'   => $email,
  'subject' => 'Willkommen!',
  'message' => $message
];

$job_json = json_encode($job);

$redis->lPush('mail_queue', $job_json);

file_put_contents("/var/www/html/logs/queue.log", date('Y-m-d H:i:s') . " - Job für $email in Redis Queue gelegt\n", FILE_APPEND);
$redis->close();

