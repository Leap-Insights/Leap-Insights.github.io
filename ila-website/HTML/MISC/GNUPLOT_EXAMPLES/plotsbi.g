set xzeroaxis
set yzeroaxis
set xlabel 'Parallel shift of the yield curve (basis points)'
set ylabel 'Impact upon SBI (billion rupees)'

set arrow from -320, 27.72 to -320,41.966
set arrow from 320, -27.72 to 320,-17.043

set terminal cgm
set output 'sbi_duration_example.cgm'
plot 'sbi.results' t 'Exact' with lines lt 2 lw 3, \
     -0.08663*x t 'Duration-based' with lines lt 1 lw 1
show output

