################################################################################
#
#' Retrieve parent data, matching to a nested (child) dataset by keys of a
#' nested dataset exported from an ODK Aggregate Server.
#'
#' @param parent Data frame of household data
#' @param child Data frame of child (repeat) data
#' @param byPARENT_KEY Should data frames be matched based on PARENT_KEY (child)
#' and KEY (parent) columns? (Currently only option is TRUE)
#' @param removeCols Character vector of column names to remove from the parent
#' data frame (optional)
#' @param removeRows Index of which rows should be removed from child data frame
#' (optional)
#'
#' @return Merged dataframe
#'
#' @examples
#' # marge sampleData2 and sampleData3
#' x <- renameODK(sampleData2)
#' y <- renameODK(sampleData3)
#' temp <- mergeNestedODK(parent = x, child = y, byPARENT_KEY = FALSE)
#'
#' @export
#'
#
################################################################################

mergeNestedODK <- function(parent,
                           child,
                           byPARENT_KEY = TRUE,
                           removeCols = NULL,
                           removeRows = NULL) {
  if(!is.null(removeCols)) {
    parent <- parent[ , which(names(parent) %nin% removeCols)]
  }

  if(!is.null(removeRows)) {
    child <- child[-removeRows, ]
  }

  if(byPARENT_KEY) {

    names(parent)[names(parent) == "KEY"] <- "PARENT_KEY"

    temp <- c(names(parent), names(child))
    temp <- temp[temp != "PARENT_KEY"]

    if(anyDuplicated(temp) != 0) {
      duplicates <- paste0(paste0(temp[duplicated(temp)], collapse = ", "), " column(s) duplicated")
      stop(duplicates)
    }

    result <- merge(parent, child, by = "PARENT_KEY")
    return(result)
  }
}
