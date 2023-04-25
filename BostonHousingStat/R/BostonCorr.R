#' Boston Housing Statistics
#'
#' This function returns a ranking of the correlation coefficients of all variables
#' in the Boston Housing Dataset against 'medv'.
#'
#' @import MASS
#'
#' @return the results of correlation analysis in descending order of ranking.
#' @export
#correlation analysis, ranks the correlation of variables against medv.
boston_corr <- function(data) {
  corr <- cor(data)
  abs_corr <- abs(corr[,"medv"])
  ranking <- sort(abs_corr, decreasing = TRUE)
  results <- data.frame(rank = ranking, variable = names(ranking))
  return(results)
}
