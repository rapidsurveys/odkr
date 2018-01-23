################################################################################
#
#' ranameODK
#'
#' Rename column names of data exported from an ODK Aggregate Server or from
#' ODK Briefcase into more usable and human readable variable names.
#'
#' @param data Dataframe object of dataset exported from ODK Aggregate Server
#' @return Data frame object with renamed variables
#'
renameODK <- function(data) {
  #
  # take column names and split strings around "."
  #
  colNames <- str_split(names(data), "\\.")
  temp <- vector(length = length(names(data)))
  for (i in 1:length(colNames))
  {
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
