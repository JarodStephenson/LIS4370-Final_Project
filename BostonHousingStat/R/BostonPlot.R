#' Plots MEDV against the three most significant variables.
#'
#' @param data A dataframe that contains the Boston Housing Dataset.
#' @param n_vars The number of variables that is plotted against MEDV (number is 3).
#'
#' @import ggplot2
#' @import dplyr
#' @import tidyr
#'
#' @export
BostonMEDV <- function(data, n_vars=3) {
  # Gets the variables with the highest correlation with MEDV.
  corrs <- cor(data)
  abs_corrs <- abs(corrs[,"medv"])
  top3_vars <- names(sort(abs_corrs, decreasing = TRUE)[2:(n_vars+1)])

  # Creates the visualizations.
  plot_data <- data %>%
    select(medv, all_of(top3_vars))

  plot <- ggplot(plot_data, aes(x = Value, y = medv)) +
    geom_point() +
    facet_wrap(~Variable, scales = "free_x", ncol = 1) +
    labs(x = "", y = "MEDV")

  return(plot)
}
