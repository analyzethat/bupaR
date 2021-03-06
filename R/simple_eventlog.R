#' @title Simple Eventlog
#'
#' @description A function to instantiate an object of class \code{eventlog} by specifying a
#' \code{data.frame} or \code{tbl_df} and the minimally required case identifier, activity identifier and timestamp
#'
#'
#' @param eventlog The data object to be used as event log. This can be a
#' \code{data.frame} or \code{tbl_df}.
#'
#' @param case_id The case classifier of the event log.
#'
#' @param activity_id The activity classifier of the event log.
#'
#' @param timestamp The timestamp of the event log.
#'
#' @seealso \code{\link{eventlog}},\code{\link{case_id}}, \code{\link{activity_id}},
#' \code{\link{activity_instance_id}},\code{\link{lifecycle_id}},
#'  \code{\link{timestamp}}
#'
#' @examples
#' \dontrun{
#' data <- data.frame(case = rep("A",5),
#' activity_id = c("A","B","C","D","E"),
#' timestamp = 1:5,
#' simple_eventlog(data,case_id = "case",
#' activity_id = "activity_id",
#' timestamp = "timestamp")
#'}
#' @export simple_eventlog


simple_eventlog <- function(eventlog,
					 case_id = NULL,
					 activity_id = NULL,
					 timestamp = NULL){

	eventlog <- tbl_df(as.data.frame(eventlog)) %>%
		mutate(activity_instance_id = 1:nrow(.),
			   resource_id = "undefined",
			   lifecycle_id = "undefined")

	resource_id <- "resource_id"
	activity_instance_id <- "activity_instance_id"
	lifecycle_id = "lifecycle_id"


	eventlog(eventlog,
			 case_id,
			 activity_id,
			 activity_instance_id,
			 lifecycle_id,
			 timestamp,
			 resource_id) %>%
	return()
}
#' @rdname simple_eventlog
#' @export isimple_eventlog
isimple_eventlog <- function(eventlog){

	ui <- miniPage(
		gadgetTitleBar("Create eventlog"),
		miniContentPanel(
			fillRow(fillCol(
				selectizeInput("case_id", "Case identifier", choices = c("",colnames(eventlog)),
							   selected = ifelse(is.null(attr(eventlog, "case_id")), NA, attr(eventlog, "case_id"))),
				selectizeInput("activity_id", "Activity identifier", choices = c("",colnames(eventlog)),
							   selected = ifelse(is.null(attr(eventlog, "activity_id")), NA, attr(eventlog, "activity_id"))),
					selectizeInput("timestamp", "Timestamp", choices =  c("",colnames(eventlog)),
								   selected = ifelse(is.null(attr(eventlog, "timestamp")), NA, attr(eventlog, "timestamp"))))

			))
	)

	server <- function(input, output, session){
		observeEvent(input$done, {
			stopApp(simple_eventlog(eventlog = eventlog,
							 case_id = input$case_id,
							 activity_id = input$activity_id,
							 timestamp = input$timestamp))
		})


	}

	runGadget(ui, server, viewer = dialogViewer("Create simple event log", height = 400))

}

