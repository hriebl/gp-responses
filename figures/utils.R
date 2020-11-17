library(dplyr)
library(tidyr)

samples_to_df <- function(samples) {
  if (inherits(samples, "data.frame")) {
    return(samples)
  }

  if (inherits(samples, "mcmc")) {
    return(as.data.frame(samples))
  }

  if (inherits(samples, "list")) {
    out <- unlist(samples, recursive = FALSE)
    out <- do.call(cbind.data.frame, out)

    nm <- lapply(names(samples), function(predictor) {
      lapply(names(samples[[predictor]]), function(smooth) {
        covariates <- colnames(samples[[predictor]][[smooth]])
        paste(predictor, smooth, covariates, sep = ".")
      })
    })

    nm <- unlist(nm)
    names(out) <- nm
    return(out)
  }

  stop("samples of provided class not supported")
}

tidy_samples <- function(samples) {
  samples %>%
    samples_to_df %>%
    select(
      -ends_with("alpha"),
      -ends_with("accepted"),
      -ends_with("edf"),
      -any_of("logLik")
    ) %>%
    mutate(iteration = row_number()) %>%
    pivot_longer(
      cols = -iteration,
      names_to = c("predictor", "smooth", "covariate"),
      names_sep = "\\.",
      values_to = "sample"
    ) %>%
    select(predictor, smooth, covariate, iteration, sample) %>%
    arrange(predictor, smooth, covariate, iteration)
}
