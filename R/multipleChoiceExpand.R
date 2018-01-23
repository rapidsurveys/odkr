################################################################################
#
#' expandMultChoice
#'
#' Function to recode a choose-multiple column where multiple answers are
#' recorded in the same element (e.g. "ab ac ad", "ef eg eh") to a data frame
#' with multiple separate 0/1 columns e.g.:
#'
#'       ab  ac  ad  ef  eg  eh
#' [1,]  1   1   1   0   0   0
#' [2,]  0   0   0   1   1   1
#'
#' @param answers Character vector with given answers (strings containing the
#' choices)
#' @param choices (optional) Character vector with choices to be used (each will
#' become a column). If not supplied, choices will be determined from the
#' \code{answer} parameter, splitting given answers by an empty space
#' \code{(" ")} and finding unique values.
#' @param naCode (optional) Single element specifying what character code
#' equates to \code{NA}
#' @param naQuestion (optional) TRUE/FALSE vector of the same length as answers;
#' in rows where this is false, all columns will be coded as \code{NA}
#' @return a data frame with multiple separate 0/1 columns
#'
#' NOTE: \code{naCode} must exist as the only answer in a column (an answer that
#' contains both a valid answer and the \code{NA} code will not be recognized as
#' \code{NA} - instead, the \code{NA} code will be output as an extra answer
#' column (if \code{choices} parameter is not given))
#'
#' @examples
#' # Expand responses in variable w7 of sampleData2
#' sampleData2 <- renameODK(sampleData2)
#' temp <- expandMultChoice(sampleData2$ws7)
#'
expandMultChoice <- function(answers,
                             choices = NULL,
                             naCode = NULL,
                             naQuestion = NULL) {
  if(is.null(choices)) {
    strings <- unique(answers[which(stringr::str_length(answers) > 0)])
    strings <- sort(unique(unlist(stringr::str_split(strings, " "))))
  } else strings <- choices

  targetDF <- data.frame(matrix(nrow = length(answers), ncol = length(strings)))
  names(targetDF) <- strings

  for (i in 1:length(strings)) {
    temp <- grep(strings[i], answers)
    targetDF[[strings[i]]] <- 0
    targetDF[[strings[i]]][temp] <- 1
  }

  indices <- which(names(targetDF) %in% strings)
  if(!is.null("naCode")) {
    targetDF[which(answers == naCode), indices] <- NA
  }
  if(!is.null("naQuestion")) targetDF[naQuestion, indices] <- NA
  return(targetDF)
}
