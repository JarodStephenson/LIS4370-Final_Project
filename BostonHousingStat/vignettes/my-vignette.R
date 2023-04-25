## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(BostonHousingStat)
library(MASS)
library(ggplot2)
library(dplyr)
library(tidyr)

## -----------------------------------------------------------------------------
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


## -----------------------------------------------------------------------------
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

## -----------------------------------------------------------------------------
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

