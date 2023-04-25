#' Boston Housing Statistics
#'
#' This function returns summary statistics of any specified variable in the Boston Housing Dataset.
#'
#' @import ggplot2
#' @import dplyr
#' @import tidyr
#' @import MASS
#'
#' @return an object of class "boston_stats" containing the summary statistics.
#' @export
boston_stats <- function(data, variable) {
  data <- Boston
  stats <- data %>%
    reframe(
      min.variable = min(!!sym(variable)),
      max.variable = max(!!sym(variable)),
      sd.variable = sd(!!sym(variable)),
      mean.variable = mean(!!sym(variable)),
      var.variable = var(!!sym(variable))
    )

  stats <- as_tibble(stats)
  stats_object <- new("boston_stats",
                   Minimum = stats$min.variable,
                   Maximum = stats$max.variable,
                   Standard_Deviation = stats$sd.variable,
                   Mean = stats$mean.variable,
                   Variance = stats$var.variable
  )
  return(stats_object)
}

#' @title boston_stats class
#' @description A class for summary statistics of the median value of owner-occupied homes in $1000s.
#' @exportClass boston_stats
setClass("boston_stats",
         slots = list(
           Minimum = "numeric",
           Maximum = "numeric",
           Standard_Deviation = "numeric",
           Mean = "numeric",
           Variance = "numeric"
         )
)

#Defines a summary method for the S4 boston_stats class.
setMethod("summary", signature = "boston_stats", function(object, ...) {
  cat("Summary of Boston Housing Statistics\n")
  cat("Minimum: ", object@Minimum, "\n")
  cat("Maximum: ", object@Maximum, "\n")
  cat("Standard_Deviation: ", object@Standard_Deviation, "\n")
  cat("Mean: ", object@Mean, "\n")
  cat("Variance: ", object@Variance, "\n")
})
