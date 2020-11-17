---
output: md_document
---

# GP Responses -- Simulation Study




```r
Sys.time()
```

```
## [1] "2020-11-16 12:10:28 CET"
```

```r
devtools::session_info()
```

```
## ─ Session info ───────────────────────────────────────────────────────────────
##  setting  value                       
##  version  R version 3.6.3 (2020-02-29)
##  os       Ubuntu 20.04.1 LTS          
##  system   x86_64, linux-gnu           
##  ui       X11                         
##  language (EN)                        
##  collate  en_US.UTF-8                 
##  ctype    en_US.UTF-8                 
##  tz       Europe/Berlin               
##  date     2020-11-16                  
## 
## ─ Packages ───────────────────────────────────────────────────────────────────
##  package     * version    date       lib source          
##  assertthat    0.2.1      2019-03-21 [1] CRAN (R 3.6.1)  
##  bamlss      * 1.1-2      2020-02-19 [1] CRAN (R 3.6.1)  
##  bamlssAPI     0.0.0.9000 2020-11-16 [1] git2r (@33b95a0)
##  bamlssGP    * 0.0.0.9000 2020-11-16 [1] git2r (@3c39162)
##  callr         3.5.1      2020-10-13 [1] CRAN (R 3.6.3)  
##  cli           2.1.0      2020-10-12 [1] CRAN (R 3.6.3)  
##  coda        * 0.19-4     2020-09-30 [1] CRAN (R 3.6.3)  
##  colorspace  * 2.0-0      2020-11-11 [1] CRAN (R 3.6.3)  
##  crayon        1.3.4      2017-09-16 [1] CRAN (R 3.6.1)  
##  desc          1.2.0      2018-05-01 [1] CRAN (R 3.6.1)  
##  devtools      2.3.2      2020-09-18 [1] CRAN (R 3.6.3)  
##  digest        0.6.27     2020-10-24 [1] CRAN (R 3.6.3)  
##  ellipsis      0.3.1      2020-05-15 [1] CRAN (R 3.6.3)  
##  evaluate      0.14       2019-05-28 [1] CRAN (R 3.6.1)  
##  fansi         0.4.1      2020-01-08 [1] CRAN (R 3.6.1)  
##  Formula       1.2-4      2020-10-16 [1] CRAN (R 3.6.3)  
##  fs            1.5.0      2020-07-31 [1] CRAN (R 3.6.3)  
##  geosphere   * 1.5-10     2019-05-26 [1] CRAN (R 3.6.1)  
##  glue          1.4.2      2020-08-27 [1] CRAN (R 3.6.3)  
##  here        * 1.0.0      2020-11-15 [1] CRAN (R 3.6.3)  
##  knitr         1.30       2020-09-22 [1] CRAN (R 3.6.3)  
##  lattice       0.20-41    2020-04-02 [1] CRAN (R 3.6.1)  
##  magrittr      1.5        2014-11-22 [1] CRAN (R 3.6.1)  
##  Matrix        1.2-18     2019-11-27 [1] CRAN (R 3.6.1)  
##  MBA           0.0-9      2017-03-08 [1] CRAN (R 3.6.1)  
##  memoise       1.1.0      2017-04-21 [1] CRAN (R 3.6.1)  
##  mgcv        * 1.8-33     2020-08-27 [1] CRAN (R 3.6.3)  
##  mvtnorm       1.1-1      2020-06-09 [1] CRAN (R 3.6.3)  
##  nlme        * 3.1-150    2020-10-24 [1] CRAN (R 3.6.3)  
##  pkgbuild      1.1.0      2020-07-13 [1] CRAN (R 3.6.3)  
##  pkgload       1.1.0      2020-05-29 [1] CRAN (R 3.6.3)  
##  prettyunits   1.1.1      2020-01-24 [1] CRAN (R 3.6.1)  
##  processx      3.4.4      2020-09-03 [1] CRAN (R 3.6.3)  
##  ps            1.4.0      2020-10-07 [1] CRAN (R 3.6.3)  
##  purrr       * 0.3.4      2020-04-17 [1] CRAN (R 3.6.1)  
##  R6            2.5.0      2020-10-28 [1] CRAN (R 3.6.3)  
##  remotes       2.2.0      2020-07-21 [1] CRAN (R 3.6.3)  
##  rlang         0.4.8      2020-10-08 [1] CRAN (R 3.6.3)  
##  rprojroot     2.0.2      2020-11-15 [1] CRAN (R 3.6.3)  
##  sessioninfo   1.1.1      2018-11-05 [1] CRAN (R 3.6.1)  
##  sp            1.4-4      2020-10-07 [1] CRAN (R 3.6.3)  
##  stringi       1.5.3      2020-09-09 [1] CRAN (R 3.6.3)  
##  stringr       1.4.0      2019-02-10 [1] CRAN (R 3.6.1)  
##  survival      3.2-7      2020-09-28 [1] CRAN (R 3.6.3)  
##  testthat      3.0.0      2020-10-31 [1] CRAN (R 3.6.3)  
##  usethis       1.6.3      2020-09-17 [1] CRAN (R 3.6.3)  
##  withr         2.3.0      2020-09-22 [1] CRAN (R 3.6.3)  
##  xfun          0.19       2020-10-30 [1] CRAN (R 3.6.3)  
## 
## [1] /home/hriebl/R/x86_64-pc-linux-gnu-library/3.6
## [2] /usr/local/lib/R/site-library
## [3] /usr/lib/R/site-library
## [4] /usr/lib/R/library
```

```r
system2("git", "log -1", stdout = TRUE)
```

```
## [1] "commit 93550536d62517f40fe78c27b63ee2965efbf5df"
## [2] "Author: Hannes Riebl <hriebl@uni-goettingen.de>"
## [3] "Date:   Mon Nov 16 11:29:43 2020 +0100"         
## [4] ""                                               
## [5] "    Update .gitignore"
```

```r
system2("git", "diff", stdout = TRUE)
```

```
## character(0)
```

```r
set.seed(1337)
```

## Joint sampling



## Time-varying covariates



## Processes on a sphere


