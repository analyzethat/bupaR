% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/sample_n.eventlog.R
\docType{import}
\name{sample_n}
\alias{sample_n}
\alias{sample_n.eventlog}
\alias{sample_n.grouped_eventlog}
\title{Sample function for eventlog}
\usage{
\method{sample_n}{eventlog}(tbl, size, replace = FALSE, weight, .env)

\method{sample_n}{grouped_eventlog}(tbl, size, replace = FALSE, weight, .env)
}
\arguments{
\item{tbl}{Eventlog}

\item{size}{Number of cases to sample}

\item{replace}{Sample with replacement or not}

\item{weight}{N/A}

\item{.env}{N/A}
}
\section{Methods (by class)}{
\itemize{
\item \code{eventlog}: Sample n cases of eventlog

\item \code{grouped_eventlog}: Stratified sampling of a grouped eventlog: sample n cases within each group
}}

\keyword{internal}
\description{
These objects are imported from other packages. Follow the links
below to see their documentation.

\describe{
  \item{dplyr}{\code{\link[dplyr]{sample_n}}}
}}

