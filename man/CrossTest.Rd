% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/subtypeFunction.R
\name{CrossTest}
\alias{CrossTest}
\title{CrossTest}
\usage{
CrossTest(prob, test_set)
}
\arguments{
\item{prob}{A matrix generated by Train(cellType-genes prob-matrix)}

\item{test_set}{testset with rows being cells, and columns being genes.}
}
\value{
cellType prediction result
}
\description{
CrossTest
}
