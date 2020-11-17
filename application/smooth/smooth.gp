unset key

set xrange [] noextend
set yrange [] noextend
set cbrange [-0.8:0.8]

set size ratio -1

unset xtics
unset ytics
set cbtics 0.2 nomirror out

set title offset 0,-1

load "gnuplot-palettes/parula.pal"

set terminal pdfcairo font "TeXGyreHeros,8" fontscale 1 size 15cm,15cm
set output "smooth.pdf"

set multiplot layout 2,3

unset colorbox

set title "Alb, 2012"

set tmargin at screen 0.95
set bmargin at screen 0.843

set lmargin at screen 0.11
set rmargin at screen 0.284

plot "ALB-2012.dat" u 1:2:3 w image, "ALB-plots.dat" u 1:2 lc "black"

set title "Hainich, 2012"

set tmargin at screen 0.742
set bmargin at screen 0.55

set lmargin at screen 0.11
set rmargin at screen 0.312

plot "HAI-2012.dat" u 1:2:3 w image, "HAI-plots.dat" u 1:2 lc "black"

set title "Schorfheide, 2012"

set tmargin at screen 0.95
set bmargin at screen 0.55

set lmargin at screen 0.362
set rmargin at screen 0.597

plot "SCH-2012.dat" u 1:2:3 w image, "SCH-plots.dat" u 1:2 lc "black"

set title "Alb, 2013"

set tmargin at screen 0.45
set bmargin at screen 0.343

set lmargin at screen 0.11
set rmargin at screen 0.284

plot "ALB-2013.dat" u 1:2:3 w image, "ALB-plots.dat" u 1:2 lc "black"

set title "Hainich, 2013"

set tmargin at screen 0.242
set bmargin at screen 0.05

set lmargin at screen 0.11
set rmargin at screen 0.312

plot "HAI-2013.dat" u 1:2:3 w image, "HAI-plots.dat" u 1:2 lc "black"

set title "Schorfheide, 2013"

set tmargin at screen 0.45
set bmargin at screen 0.05

set lmargin at screen 0.362
set rmargin at screen 0.597

set colorbox user origin 0.647,0.05 size 0.025,0.9

plot "SCH-2013.dat" u 1:2:3 w image, "SCH-plots.dat" u 1:2 lc "black"

unset multiplot
