#' Query CELEX database
#'
#' These functions make life easier when querying the behavioral datasets.
#'
#' @name lvdr_aggregate_matrix
#' @param form A word or affix
#' @param type A part-of-speach (of universal variety) or "PRE"|"SUF"
#' @return A data.frame
#' @import Matrix.utils Matrix
#'
#'
#' @export
#' @rdname lvdr_aggregate_matrix


lvdr_aggregate_matrix <- function(tfm,
                                  group,
                                  fun = 'sum') {  ## Need to add column/row/both parameter.

  ##For columns
  tfm1  <- Matrix.utils::aggregate.Matrix(x = tfm,
                                          groupings = group,
                                          fun = fun)

  tfm1 <- Matrix.utils::aggregate.Matrix(x = Matrix::t(tfm1),
                                         groupings = group,
                                         fun = fun)


  Matrix::t(tfm1)
  ## Assumes x~y == y~x, which we have always been assuming.
}
