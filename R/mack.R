#' @export
mack_chain_ladder <- function(weights_col = NULL, alpha_col = NULL, est_sigma = "log-linear", tail = FALSE,
                              tail_se = NULL, tail_sigma = NULL, mse_method = "Mack") {
  specs <- list(
    weights_col = weights_col,
    alpha_col = alpha_col,
    est_sigma = est_sigma,
    tail = tail,
    tail_se = tail_se,
    tail_sigma = tail_sigma,
    mse_method = mse_method
  )

  new_rsvr_model_spec(specs, clas = "mack_chain_ladder_spec")
}

new_rsvr_model_spec <- function(specs, class = character()) {
  structure(
    specs,
    class = c(class, "rsvr_model_spec")
  )
}

#' @export
print.mack_chain_ladder_spec <- function(x, ...) {
  cat("Mack Chain Ladder Model Specification")
  # Incldue more info here
}

#' @importFrom generics fit
#' @export
fit.mack_chain_ladder_spec <- function(object, ...) {
  data <- list(...)[[1]]
  specs <- list(
    weights = 1, # TODO gets this from `data`
    alpha = 1,
    est.sigma = object$est_sigma,
    tail = object$tail,
    tail.se = object$tail_se,
    tail.sigma = object$tail_sigma,
    mse.method = object$mse_method
  )

  result <- do.call(ChainLadder::MackChainLadder, args = c(
    list(ChainLadder::as.triangle(data)),
    specs
  ))

  new_rsvr_model(result, class = "mack_chain_ladder_model")
}

new_rsvr_model <- function(object, class = character()) {
  structure(
    object,
    # Here we'd include more (tidy) model info
    class = c(class, "rsvr_model")
    )

}

#' @export
print.mack_chain_ladder_model <- function(x, ...) {
  cat("Mack Chain Ladder Model")
}

