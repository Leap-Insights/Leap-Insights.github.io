set xzeroaxis
set timefmt "%Y-%m-%d"
set xdata time
set grid
set ylabel "Sources of change in reserve money (Rs. crore)"
set format x "%b %y"
set linestyle 1  lw 4
set linestyle 2 lt 2 lw 4
set linestyle 3 lt 0 lw 4
set terminal postscript eps
set output 'rgf_1.eps'
plot  [] [:200000] 'rgf_1.csv' using 1:2 title 'Reserve Money' with lines ls 1, \
        'rgf_1.csv' using 1:3 title 'Net credit to government' with lines ls 2, \
        'rgf_1.csv' using 1:4 title 'Net foreign exchange assets' with lines ls 3
show output

