GP Responses – Application
==========================

    Sys.time()

    ## [1] "2020-11-18 00:10:05 CET"

    devtools::session_info()

    ## ─ Session info ───────────────────────────────────────────────────────────────
    ##  setting  value                          
    ##  version  R version 4.0.3 (2020-10-10)   
    ##  os       Fedora 32 (Workstation Edition)
    ##  system   x86_64, linux-gnu              
    ##  ui       X11                            
    ##  language (EN)                           
    ##  collate  en_US.UTF-8                    
    ##  ctype    en_US.UTF-8                    
    ##  tz       Europe/Berlin                  
    ##  date     2020-11-18                     
    ## 
    ## ─ Packages ───────────────────────────────────────────────────────────────────
    ##  package     * version    date       lib source          
    ##  assertthat    0.2.1      2019-03-21 [1] CRAN (R 4.0.2)  
    ##  bamlss      * 1.1-2      2020-02-19 [1] CRAN (R 4.0.2)  
    ##  bamlssAPI     0.0.0.9000 2020-08-17 [1] git2r (@33b95a0)
    ##  bamlssGP    * 0.0.0.9000 2020-11-06 [1] git2r (@3c39162)
    ##  callr         3.5.1      2020-10-13 [1] CRAN (R 4.0.3)  
    ##  class         7.3-17     2020-04-26 [2] CRAN (R 4.0.3)  
    ##  classInt      0.4-3      2020-04-07 [1] CRAN (R 4.0.2)  
    ##  cli           2.1.0      2020-10-12 [1] CRAN (R 4.0.3)  
    ##  coda        * 0.19-4     2020-09-30 [1] CRAN (R 4.0.2)  
    ##  colorspace  * 2.0-0      2020-11-11 [1] CRAN (R 4.0.3)  
    ##  crayon        1.3.4      2017-09-16 [1] CRAN (R 4.0.2)  
    ##  DBI           1.1.0      2019-12-15 [1] CRAN (R 4.0.2)  
    ##  desc          1.2.0      2018-05-01 [1] CRAN (R 4.0.2)  
    ##  devtools      2.3.2      2020-09-18 [1] CRAN (R 4.0.2)  
    ##  digest        0.6.27     2020-10-24 [1] CRAN (R 4.0.3)  
    ##  dplyr       * 1.0.2      2020-08-18 [1] CRAN (R 4.0.2)  
    ##  e1071         1.7-4      2020-10-14 [1] CRAN (R 4.0.3)  
    ##  ellipsis      0.3.1      2020-05-15 [1] CRAN (R 4.0.2)  
    ##  evaluate      0.14       2019-05-28 [3] CRAN (R 4.0.2)  
    ##  fansi         0.4.1      2020-01-08 [1] CRAN (R 4.0.2)  
    ##  Formula       1.2-4      2020-10-16 [1] CRAN (R 4.0.3)  
    ##  fs            1.5.0      2020-07-31 [1] CRAN (R 4.0.2)  
    ##  generics      0.1.0      2020-10-31 [1] CRAN (R 4.0.3)  
    ##  geosphere   * 1.5-10     2019-05-26 [1] CRAN (R 4.0.2)  
    ##  ggnuplot    * 0.1.0      2020-06-04 [1] CRAN (R 4.0.3)  
    ##  ggplot2     * 3.3.2      2020-06-19 [1] CRAN (R 4.0.2)  
    ##  glue          1.4.2      2020-08-27 [1] CRAN (R 4.0.2)  
    ##  gtable        0.3.0      2019-03-25 [1] CRAN (R 4.0.2)  
    ##  here        * 1.0.0      2020-11-15 [1] CRAN (R 4.0.3)  
    ##  hms           0.5.3      2020-01-08 [1] CRAN (R 4.0.2)  
    ##  htmltools     0.5.0      2020-06-16 [1] CRAN (R 4.0.2)  
    ##  janitor     * 2.0.1      2020-04-12 [1] CRAN (R 4.0.3)  
    ##  KernSmooth    2.23-18    2020-10-29 [1] CRAN (R 4.0.3)  
    ##  knitr         1.30       2020-09-22 [1] CRAN (R 4.0.2)  
    ##  lattice       0.20-41    2020-04-02 [2] CRAN (R 4.0.3)  
    ##  lifecycle     0.2.0      2020-03-06 [1] CRAN (R 4.0.2)  
    ##  lubridate     1.7.9.2    2020-11-13 [1] CRAN (R 4.0.3)  
    ##  magrittr      2.0.1      2020-11-17 [1] CRAN (R 4.0.3)  
    ##  Matrix        1.2-18     2019-11-27 [2] CRAN (R 4.0.3)  
    ##  MBA           0.0-9      2017-03-08 [1] CRAN (R 4.0.2)  
    ##  memoise       1.1.0      2017-04-21 [1] CRAN (R 4.0.2)  
    ##  mgcv        * 1.8-33     2020-08-27 [1] CRAN (R 4.0.2)  
    ##  munsell       0.5.0      2018-06-12 [1] CRAN (R 4.0.2)  
    ##  mvtnorm     * 1.1-1      2020-06-09 [1] CRAN (R 4.0.2)  
    ##  nlme        * 3.1-150    2020-10-24 [1] CRAN (R 4.0.3)  
    ##  pillar        1.4.6      2020-07-10 [1] CRAN (R 4.0.2)  
    ##  pkgbuild      1.1.0      2020-07-13 [1] CRAN (R 4.0.2)  
    ##  pkgconfig     2.0.3      2019-09-22 [1] CRAN (R 4.0.2)  
    ##  pkgload       1.1.0      2020-05-29 [1] CRAN (R 4.0.2)  
    ##  prettyunits   1.1.1      2020-01-24 [1] CRAN (R 4.0.2)  
    ##  processx      3.4.4      2020-09-03 [1] CRAN (R 4.0.2)  
    ##  ps            1.4.0      2020-10-07 [1] CRAN (R 4.0.2)  
    ##  purrr       * 0.3.4      2020-04-17 [1] CRAN (R 4.0.2)  
    ##  R6            2.5.0      2020-10-28 [1] CRAN (R 4.0.3)  
    ##  Rcpp          1.0.5      2020-07-06 [1] CRAN (R 4.0.2)  
    ##  readr       * 1.4.0      2020-10-05 [1] CRAN (R 4.0.2)  
    ##  remotes       2.2.0      2020-07-21 [1] CRAN (R 4.0.2)  
    ##  rlang         0.4.8      2020-10-08 [1] CRAN (R 4.0.2)  
    ##  rmarkdown     2.5        2020-10-21 [1] CRAN (R 4.0.3)  
    ##  rprojroot     2.0.2      2020-11-15 [1] CRAN (R 4.0.3)  
    ##  scales        1.1.1      2020-05-11 [1] CRAN (R 4.0.2)  
    ##  sessioninfo   1.1.1      2018-11-05 [1] CRAN (R 4.0.2)  
    ##  sf          * 0.9-6      2020-09-13 [1] CRAN (R 4.0.2)  
    ##  snakecase     0.11.0     2019-05-25 [1] CRAN (R 4.0.3)  
    ##  sp            1.4-4      2020-10-07 [1] CRAN (R 4.0.2)  
    ##  stringi       1.5.3      2020-09-09 [1] CRAN (R 4.0.2)  
    ##  stringr       1.4.0      2019-02-10 [3] CRAN (R 4.0.2)  
    ##  survival      3.2-7      2020-09-28 [1] CRAN (R 4.0.2)  
    ##  testthat      3.0.0      2020-10-31 [1] CRAN (R 4.0.3)  
    ##  tibble        3.0.4      2020-10-12 [1] CRAN (R 4.0.3)  
    ##  tidyr       * 1.1.2      2020-08-27 [1] CRAN (R 4.0.2)  
    ##  tidyselect    1.1.0      2020-05-11 [1] CRAN (R 4.0.2)  
    ##  units         0.6-7      2020-06-13 [1] CRAN (R 4.0.2)  
    ##  usethis       1.6.3      2020-09-17 [1] CRAN (R 4.0.2)  
    ##  vctrs         0.3.5      2020-11-17 [1] CRAN (R 4.0.3)  
    ##  withr         2.3.0      2020-09-22 [1] CRAN (R 4.0.2)  
    ##  xfun          0.19       2020-10-30 [1] CRAN (R 4.0.3)  
    ##  yaml          2.2.1      2020-02-01 [2] CRAN (R 4.0.2)  
    ## 
    ## [1] /home/hannes/R/x86_64-redhat-linux-gnu-library/4.0
    ## [2] /usr/lib64/R/library
    ## [3] /usr/share/R/library

    system2("git", "log -1", stdout = TRUE)

    ## [1] "commit 35c7c54b3b9fc7875d76c2b13efadba43bb7e3bc"
    ## [2] "Author: Hannes Riebl <hriebl@uni-goettingen.de>"
    ## [3] "Date:   Wed Nov 18 00:02:46 2020 +0100"         
    ## [4] ""                                               
    ## [5] "    Update list of required packages"

    system2("git", "diff", stdout = TRUE)

    ## character(0)

    set.seed(1337)

Model
-----

Summary statistics
------------------

Figures
-------

    ## Warning in if (grepl("model.matrix.", sn2)) sn2 <- gsub("model.matrix.", : the
    ## condition has length > 1 and only the first element will be used

    ## Warning in if (grepl("model.matrix.", sn2)) sn2 <- gsub("model.matrix.", : the
    ## condition has length > 1 and only the first element will be used

    ## Warning in if (grepl("model.matrix.", sn2)) sn2 <- gsub("model.matrix.", : the
    ## condition has length > 1 and only the first element will be used

![](/home/hannes/ownCloud/Research/gp-responses/gp-responses/figures/output/application-data-1.pdf)
