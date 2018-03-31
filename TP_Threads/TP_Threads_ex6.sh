#!/bin/sh

echo "calcul avec 1 thread..."
./TP_Threads_ex6.out 1000 1 > graph1.dat
./TP_Threads_ex6.out 5000 1 >> graph1.dat
./TP_Threads_ex6.out 10000 1 >> graph1.dat
./TP_Threads_ex6.out 25000 1 >> graph1.dat
./TP_Threads_ex6.out 50000 1 >> graph1.dat
./TP_Threads_ex6.out 75000 1 >> graph1.dat
./TP_Threads_ex6.out 100000 1 >> graph1.dat

echo "calcul avec 2 threads..."
./TP_Threads_ex6.out 1000 2 > graph2.dat
./TP_Threads_ex6.out 5000 2 >> graph2.dat
./TP_Threads_ex6.out 10000 2 >> graph2.dat
./TP_Threads_ex6.out 25000 2 >> graph2.dat
./TP_Threads_ex6.out 50000 2 >> graph2.dat
./TP_Threads_ex6.out 75000 2 >> graph2.dat
./TP_Threads_ex6.out 100000 2 >> graph2.dat

echo "calcul avec 4 threads..."
./TP_Threads_ex6.out 1000 4 > graph4.dat
./TP_Threads_ex6.out 5000 4 >> graph4.dat
./TP_Threads_ex6.out 10000 4 >> graph4.dat
./TP_Threads_ex6.out 25000 4 >> graph4.dat
./TP_Threads_ex6.out 50000 4 >> graph4.dat
./TP_Threads_ex6.out 75000 4 >> graph4.dat
./TP_Threads_ex6.out 100000 4 >> graph4.dat

echo "generation et affichage des resultats..."
paste graph1.dat graph2.dat graph4.dat > graph.dat
rm graph1.dat graph2.dat graph4.dat

gnuplot -e " \
  set out 'graph_time.png'; \
  set terminal png size 800,600; \
  set grid; \
  set style data linespoints; \
  set title 'time'; \
  set key inside left top; \
  plot 'graph.dat' using 1:3 lw 2 title '1 thread', 'graph.dat' using 1:6 lw 2 title '2 threads', 'graph.dat' using 1:9 lw 2 title '4 threads' ; \
  "

gnuplot -e " \
  set out 'graph_speedup.png'; \
  set terminal png size 800,600; \
  set grid; \
  set style data linespoints; \
  set title 'speed-up'; \
  set key inside left top; \
  plot 'graph.dat' using 1:(\$3/\$9) lw 2 title '2 threads', 'graph.dat' using 1:(\$3/\$6) lw 2 title '4 threads'; \
  "

eog graph_time.png graph_speedup.png
