################################################################################
#
#' Function to expand response to a more than one answer multiple choice
#' question coded as a concatenated string
#'
#' @param df A dataframe containing the vector data that requires expansion.
#' @param x Name of variable in \code{df} containing vector needing expansion.
#' @param values Vector of string values used to create concatenated string
#'   response.
#' @param pattern Pattern used to separate values in the concatenated string.
#'   Default is "" for concatenated strings with no separator.
#' @param prefix Prefix to names of newly created variables.
#' @param labels Vector of names to use for columns of resulting data.frame.
#'   If not specified, columns are named using \code{values}.
#' @param sep Charater to separate \code{prefix} from \code{labels} in the
#'   names of newly created variables.
#'
#' @return A data.frame with same rows as \code{df} containing columns
#'   corresponding to each newly created variable.
#'
#' @examples
#' \dontrun{
#' expandMultipleChoice(df = individual,
#'                      x = "mddw1",
#'                      values = as.character(0:18),
#'                      pattern = " ",
#'                      prefix = "mddw",
#'                      sep = "")
#' }
#'
#' @export
#'
#
################################################################################

expand_choice <- function(df, x, values, pattern = "",
                          prefix = x, labels = values, sep = ".") {
  labels <- paste(prefix, labels, sep = sep)
  temp <- stringr::str_split(df[ , x], pattern = pattern)
  result <- NULL
  for(i in 1:length(temp)) {
    for(j in values){
      result <- c(result, ifelse(j %in% temp[[i]], 1, 0))
    }
  }
  result <- data.frame(matrix(result,
                              ncol = length(values),
                              nrow = length(temp),
                              byrow = TRUE))
  names(result) <- paste(prefix, labels, sep = sep)
  return(result)
}
