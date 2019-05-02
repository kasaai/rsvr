#' @export
triangle <- function(data) {
  # We'd do input checking here, probably will have to standardize on a set of column
  #  names. Also we'd implement `print()` and `plot()` methods for `tbl_triangle`
  new_tibble(data, nrow = nrow(data), class = "tbl_triangle")
}
