<?php
ob_implicit_flush(TRUE);
ini_set('default_socket_timeout', -1);

require_once("dbconnection.inc.php");

$redis = new Redis();
$redis->connect($redisserver, 6379);
$redis->auth($redispwd);


while (true) {
    // Blockierend warten auf neuen Job
    $result = $redis->bRPop('mail_queue', 0); // 0 = unbegrenzt warten

    $job_json = $result[1] ?? '';
    $job = json_decode($job_json, true);

    if (!$job) {
        file_put_contents("logs/worker.log", date('Y-m-d H:i:s') . " - Fehler: ungültiger Job: $job_json\n", FILE_APPEND);
        continue;
    }

    $email   = $job['email'] ?? '';
    $subject = $job['subject'] ?? '';
    $message = $job['message'] ?? '';

    // Mail-Simulation
    $sim_entry = date('Y-m-d H:i:s') . " - Mail an $email gesendet: $subject\n$message\n\n";
    file_put_contents("/var/www/html/logs/simulation.log", $sim_entry, FILE_APPEND);

    // Status-Log
    $status_entry = date('Y-m-d H:i:s') . " - Job für $email bearbeitet.\n";
    file_put_contents("/var/www/html/logs/worker.log", $status_entry, FILE_APPEND);

}

$redis->close();
