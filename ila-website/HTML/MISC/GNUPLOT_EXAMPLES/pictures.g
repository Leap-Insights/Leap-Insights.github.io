set terminal postscript eps
set timefmt "%Y%m%d"
set xdata time
set format x "%b %y"
set linestyle 1  lw 4
set linestyle 2 lt 2 lw 4
set linestyle 3 lt 0 lw 4
set ylabel "R2 of Frankel-Wei regression"
set grid
set yrange [0.4:1]

set output 'fw_R2.eps'
plot "fw_rolling.res" using 1:2 title '' with lines ls 1
show output

set yrange [0:1.2]
set ylabel "Coefficient in Frankel-Wei regression"

set output 'fw_usd_chf.eps'
plot "fw_rolling.res" using 1:3 title 'USD/CHF' with lines ls 1
show output

set output 'fw_jpy_chf.eps'
plot "fw_rolling.res" using 1:4 title 'JPY/CHF' with lines ls 1
show output

set output 'fw_dem_chf.eps'
plot "fw_rolling.res" using 1:5 title 'DEM/CHF' with lines ls 1
show output

set output 'fw_together.eps'
plot "fw_rolling.res" using 1:3 title 'USD/CHF' with lines ls 1, \
        "fw_rolling.res" using 1:4 title 'JPY/CHF' with lines ls 2, \
        "fw_rolling.res" using 1:5 title 'DEM/CHF' with lines ls 3
show output
