library(bamlss)
library(bamlssGP)
library(geosphere)
library(purrr)

c_fun_exp <- bamlssGP:::c_fun_exp
c_fun_matern <- bamlssGP:::c_fun_matern
c_fun_gauss <- bamlssGP:::c_fun_gauss

m_fun <- bamlssGP:::m_fun

rmvnorm_c <- bamlssGP:::rmvnorm_c


# joint sampling --------------------------------------------------------------

joint <- function(N = 30, n = 30, rep = 1, seed = 1337, intercept = 0) {
  set.seed(seed)

  x1 <- runif(N)
  x2 <- runif(N)
  x3 <- runif(N)
  x4 <- runif(N)

  mean <- x1
  stddev <- exp(x2 + x4)
  range <- exp(intercept + x3 + x4)

  s <- seq.int(0, 1, length.out = n)
  D <- as.matrix(dist(s))

  y <- pmap(
    .l = list(mean, stddev, range),
    .f = ~ drop(rmvnorm_c(1, ..1, c_fun_matern(D, ..2, ..3)))
  )

  D <- rep.int(list(D), N)

  initial_par <- data.frame(mean, stddev, range)
  family <- gp_constant_bamlss(y, D, initial_par)

  formula <- list(rep.int(0, N) ~ x1, ~ x2 + x4, ~ x3 + x4)
  model <- bamlss(formula, family, sampler = NULL)
  joint <- sample_bamlss_gp(model, n = 1200)

  environment()
}


# time-varying covariates -----------------------------------------------------

covariates <- function(N = 30, n = 60, rep = 1, seed = 1337) {
  set.seed(seed)

  q_fun <- function(s) {
    ifelse(s < 30, 0.1 + 0.9 / 30 * s, 1)
  }

  limit <- 1500
  shape <- 3.5
  scale <- 100
  stddev <- 40
  range <- 2

  linear1 <- x <- runif(N, 1, 2)

  s <- seq.int(0, 182, length.out = n)
  D <- as.matrix(dist(s))

  q <- q_fun(s)
  qq <- tcrossprod(q)

  mean <- m_fun(s, limit, shape, scale)
  covariance <- c_fun_matern(D, stddev, range, qq)
  y <- rmvnorm_c(N, mean, covariance)

  Z <- rmvnorm_c(N, 0, c_fun_gauss(D, 80, 30, qq) + diag(n))

  y <- array_branch(y, 2)
  Z <- array_branch(Z, 2)
  y <- pmap(list(y, linear1, Z), ~ ..1 + ..2 * ..3)
  Z <- map(Z, matrix, ncol = 1)
  s <- rep.int(list(s), N)
  D <- rep.int(list(D), N)
  q <- rep.int(list(q), N)

  initial_par <- data.frame(limit, shape, scale, linear1, stddev, range)
  family <- gp_weibull_bamlss(y, s, Z, D, q, initial_par)

  formula <- list(rep.int(0, N) ~ 1, ~ 1, ~ 1, ~ x, ~ 1, ~ 1)
  model <- bamlss(formula, family, sampler = FALSE)
  joint <- sample_bamlss_gp(model, n = 1200)

  environment()
}


# processes on a sphere -------------------------------------------------------

sphere <- function(N = 30, n = 379, rep = 1, seed = 1337) {
  set.seed(seed)

  x1 <- runif(N)
  x2 <- runif(N)
  x3 <- runif(N)
  x4 <- runif(N)
  x5 <- runif(N)

  radius <- exp(x1)
  south <- exp(x2)
  height <- exp(1 + x3)
  stddev <- exp(x4)
  range <- exp(x5)

  s <- expand.grid(
    lon = seq.int(-180, 180, length.out = 30)[-30],
    lat = seq.int(-90, 90, length.out = 15)[c(-1, -15)]
  )

  s <- as.matrix(s)
  s <- rbind(c(-180, -90), s, c(-180, 90))
  D <- apply(s, 1, distCosine, p2 = s, r = 1)
  s <- s * (pi / 180)

  Z <- cbind(
    radius = rep.int(1, nrow(s)),
    south = cos(s[, 2]) * (cos(s[, 1]) + 1),
    height = s[, 2] + pi / 2
  )

  m <- pmap(
    .l = list(radius, south, height),
    .f = ~ drop(Z %*% c(..1, ..2, ..3))
  )

  y <- pmap(
    .l = list(m, stddev, range),
    .f = ~ drop(rmvnorm_c(1, ..1, c_fun_exp(D, ..2 , ..3)))
  )

  s <- rep.int(list(s), N)
  D <- rep.int(list(D), N)

  initial_par <- data.frame(radius, south, height, stddev, range)
  family <- gp_sphere_bamlss(y, s, D, initial_par)

  formula <- list(rep.int(0, N) ~ x1, ~ x2, ~ x3, ~ x4, ~ x5)
  model <- bamlss(formula, family, sampler = FALSE)
  joint <- sample_bamlss_gp(model, n = 1200)

  environment()
}
