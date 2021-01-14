################################################################################
#
#' Rename column names of data exported from an ODK Aggregate Server or from
#' ODK Briefcase into more usable and human readable variable names.
#'
#' @param data Dataframe object of dataset exported from ODK Aggregate Server
#'   or from local ODK directory
#' @param sep Character value for separator used in variable names. Choices
#'   are "." or "-". Default is ".".
#'
#' @return Data frame object with renamed variables
#'
#' @examples
#' # Rename sampleData1 dataset to remove '.' from variable names
#' names(sampleData1)
#' renameODK(sampleData1)
#' names(sampleData1)
#'
#' # Rename sampleData2 dataset
#' names(sampleData2)
#' renameODK(sampleData2)
#' names(sampleData2)
#'
#' # Rename sampleData3 dataset
#' names(sampleData3)
#' renameODK(sampleData3)
#' names(sampleData3)
#'
#' @export
#'
#
################################################################################

renameODK <- function(data, sep = c(".", "-")) {
  ##
  sep <- match.arg(sep)
  sep <- if (sep == ".") "\\." else sep
  #
  # take column names and split strings around "."
  #
  colNames <- stringr::str_split(names(data), sep)
  temp <- vector(length = length(names(data)))
  for (i in seq_len(length(colNames))) {
    #
    # take only the last element from each split and write to vector
    #
    temp[i] <- colNames[i][[1]][length(colNames[i][[1]])]
  }
  #
  # rename columns using new vector of shortened names
  #
  colnames(data) <- temp
  data <- data[duplicated(data) == FALSE, ]
  #
  # return the data frame
  #
  return(data)
}
