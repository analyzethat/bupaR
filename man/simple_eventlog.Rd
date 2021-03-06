% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/simple_eventlog.R
\name{simple_eventlog}
\alias{simple_eventlog}
\alias{isimple_eventlog}
\title{Simple Eventlog}
\usage{
simple_eventlog(eventlog, case_id = NULL, activity_id = NULL,
  timestamp = NULL)

isimple_eventlog(eventlog)
}
\arguments{
\item{eventlog}{The data object to be used as event log. This can be a
\code{data.frame} or \code{tbl_df}.}

\item{case_id}{The case classifier of the event log.}

\item{activity_id}{The activity classifier of the event log.}

\item{timestamp}{The timestamp of the event log.}
}
\description{
A function to instantiate an object of class \code{eventlog} by specifying a
\code{data.frame} or \code{tbl_df} and the minimally required case identifier, activity identifier and timestamp
}
\examples{
\dontrun{
data <- data.frame(case = rep("A",5),
activity_id = c("A","B","C","D","E"),
timestamp = 1:5,
simple_eventlog(data,case_id = "case",
activity_id = "activity_id",
timestamp = "timestamp")
}
}
\seealso{
\code{\link{eventlog}},\code{\link{case_id}}, \code{\link{activity_id}},
\code{\link{activity_instance_id}},\code{\link{lifecycle_id}},
 \code{\link{timestamp}}
}
