set terminal pngcairo size 800,600
set output "plot_ab.png"

set title "Apache vs HAProxy Benchmark"
set xlabel "Clients"
set ylabel "Requests per second"

set grid
set key top left
set xtics 20

set style line 1 lc rgb "#0060ad" lw 2 pt 7
set style line 2 lc rgb "#dd181f" lw 2 pt 7

plot "messung_apache.dat" using 1:2 with linespoints ls 1 title "Apache", \
     "messung_haproxy.dat" using 1:2 with linespoints ls 2 title "HAProxy"
