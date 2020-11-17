set hidden3d

set mapping spherical
set angles degrees

set view equal xyz
set view 100,310

set xtics offset graph 0,0.10,0
set ytics offset graph 0.11,0,0

set xrange [-15:20]
set yrange [-20:20]
set zrange [-12:25]

set xyplane at -12
set grid

set terminal pdfcairo font "TeXGyreHeros,9" fontscale 1 size 6in,6in

set output "sphere-m.pdf"
splot "sphere.dat" u 1:2:3 w l lc 2 t ""

set output "sphere-y.pdf"
splot "sphere.dat" u 1:2:4 w l lc 1 t ""
