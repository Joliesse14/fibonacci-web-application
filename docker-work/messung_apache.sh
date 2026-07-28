echo "Clients Requests_per_sec" > messung_apache.dat

for c in 0 20 40 60 80 100 120 140 160 180 200
do
    r=$(ab -k -c$c -n100000 http://apache/register.php 2>&1 | grep "Requests per second" | cut -d: -f2)
    echo "$c $r" >> messung_apache.dat
done
