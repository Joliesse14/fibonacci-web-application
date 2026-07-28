set terminal png size 800,600
set output "plot_ab.png"

set xlabel "Clients"
set ylabel "Requests per second"
set title "Apache vs HAProxy Benchmark"

plot "messung_apache.dat" using 1:2 with linespoints pt 7 lc rgb "blue" title
"Apache", \
     "messung_haproxy.dat" using 1:2 with linespoints pt 7 lc rgb "red" title
"HAProxy"
