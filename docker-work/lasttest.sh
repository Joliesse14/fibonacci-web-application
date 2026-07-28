#!/bin/bash

URL="http://apache:80/reg_process.php"

echo "Nummer Zeit_ms" > register_test.dat

for i in {1..1000}
do
    NAME="user$i"
    EMAIL="user$i@test.de"
    PASS="test123"

    start=${EPOCHREALTIME/[.,]/}

    (
        curl -s -X POST $URL \
        -d "name=$NAME" \
        -d "email=$EMAIL" \
        -d "passwort1=$PASS" \
        -d "passwort2=$PASS" > /dev/null 2>&1

        current=${EPOCHREALTIME/[.,]/}
        ms=$(( (current - start) / 1000 ))

        echo "$i $ms" >> register_test.dat
    ) &

done

wait
echo "1000 Registrierungen abgeschlossen"
