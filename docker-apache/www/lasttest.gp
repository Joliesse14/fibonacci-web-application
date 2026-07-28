set terminal pngcairo size 2000,800 enhanced font 'Verdana,14'
set output 'lasttest.png'

set title "Registrierung Lasstest 1000 Benutzer:innen" font ",16"
set xlabel "Benutzer" font ",14"
set ylabel "Zeit in ms" font ",14"

set grid 
set border lw 1.5

set logscale y

# Dünnere Linie, kleinere Punkte
set style line 1 lt 1 lw 1 pt 5 ps 0.8 lc rgb "#1f77b4"


plot 'lasttest.dat' using 1:2 with lines linestyle 1 title 'Testdurchlauf'
