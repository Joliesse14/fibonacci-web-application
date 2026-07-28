#!/bin/bash
docker exec -ti apache bash -c 'php /var/www/html/queue-worker.php|pv --line-mode > /dev/null'
