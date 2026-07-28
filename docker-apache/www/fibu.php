<?php

$number = $_GET["number"];

$a = 0;
$b = 1;

if ($number == 0) {
    echo 0;
} elseif ($number == 1) {
    echo 1;
} else {
    for ($i = 2; $i <= $number; $i++) {
        $temp = $a + $b;
        $a = $b;
        $b = $temp;
    }

    echo $b;
}

?>

