#!/bin/sh
NB_THREADS=10
RADIUS=20
DAT_FILE=ex3.dat
OUT_FILE=./TP_MPI_ex3b.out
PNG_FILE=ex3_scalability.png

if [ -f $DAT_FILE ]
then
    rm $DAT_FILE
fi

for i in `seq $NB_THREADS`
do
    echo "calcul avec $i threads..."
    mpirun -n $i $OUT_FILE $RADIUS $i 1 >> $DAT_FILE
done

echo "generation et affichage des resultats..."
T1=`head -n 1 $DAT_FILE | awk '{print $3}'`
gnuplot -e "set out '$PNG_FILE'; \
    set terminal png; \
    set yrange [1:$NB_THREADS]; \
    set style data linespoints; \
    set grid xtics ytics; \
    set key top left; \
    plot '$DAT_FILE' using 1:1 lw 2 title 'speed-up ideal', '$DAT_FILE' using 1:($T1/\$3) lw 2 title 'speed-up mesuré'"

eog $PNG_FILE

