################################################################################
#
#'
#' Function to get ODK survey datasets and forms from an ODK Aggregate server.
#'
#' This function is a wrapper for set of functions from the `odkr` package that
#' performs pulling of from from local or remote ODK directories and then
#' exports the embedded data as a comma-separate value (CSV) file.
#'
#' @param id Form ID of form to get data from.
#' @param username ODK Aggregate server username credentials.
#' @param password ODK Aggregate server password credentials.
#' @param start Include data from submission dates after (inclusive) this
#'   start date in export to CSV. Date format \code{<yyyy/MM/dd>} and default is
#'   current system date
#' @param end Include data from submission dates before (exclusive) this date
#'   in export to CSV. Date format is \code{<yyyy/MM/dd>} and default value is
#'   current system date
#' @param filename Filename to use for data without the CSV file extension.
#' @param overwrite Overwrite existing output data in destination
#'   directory with the same filename; default is FALSE
#' @param exclude Exclude media files on export; default is TRUE
#' @param group.names Logical. Should group names be removed from column names
#'   on export? Default TRUE.
#' @param split Logical. Should select multiple fields be split on export?
#'   Default FALSE.
#' @param rep Logical. Does the form have repeat/s? Default FALSE.
#' @param rep.name A vector of repeat names to read in the form. Default
#'   is NULL. Must be specified if \code{rep} is TRUE.
#'
#' @return If \code{rep} is FALSE, a data.frame containing the dataset
#'   corresponding to the form ID specified. If \code{rep} is TRUE, a list of
#'   data.frames corresponding to the dataset from the main form of the survey
#'   and each of the repeats in the form.
#'
#' @examples
#' \dontrun{
#'   get_data(id = "stakholders",
#'            username = "validtrial",
#'            password = "zEF-STN-5ze-qom",
#'            filename = "test")
#' }
#'
#' @export
#'
#
################################################################################

get_data <- function(id,
                     username,
                     password,
                     start = Sys.Date(),
                     end = Sys.Date(),
                     filename,
                     overwrite = FALSE,
                     exclude = TRUE,
                     group.names = FALSE,
                     split = FALSE,
                     rep = FALSE,
                     rep.name = NULL) {
  ## Create temporary directory
  temp <- tempdir()
  ## Check if ODK Briefcase already available in tempdir
  if(!file.exists(paste(temp, "/odkBriefcase_latest.jar", sep = ""))) {
    ## Get latest briefcase and put in temporary directory
    odkr::get_briefcase(destination = tempdir())
  }
  ## Pull ODK forms definitions and submissions from server
  odkr::pull_remote(target = temp,
                    id = id,
                    from = "https://ona.io/validmeasures",
                    to = temp,
                    username = username,
                    password = password)
  ## Export dataset
  odkr::export_data(target = temp,
                    id = id,
                    from = temp,
                    to = temp,
                    start = start,
                    end = end,
                    filename = paste(filename, ".csv", sep = ""),
                    overwrite = overwrite,
                    exclude = exclude,
                    group.names = group.names,
                    split = split,
                    overwrite = overwrite)
  ## Read specified dataset
  surveyData <- read.csv(paste(temp, "/", filename, ".csv", sep = ""),
                         stringsAsFactors = FALSE)
  ##
  fullData <- surveyData
  ##
  if(rep) {
    fullData <- vector(mode = "list", length = length(rep.name) + 1)
    names(fullData) <- c("surveyData", rep.name)
    fullData[[1]] <- surveyData
    for(i in rep.name) {
      fullData[[i]] <- read.csv(paste(temp, "/", filename, "-", i, ".csv", sep = ""),
                                stringsAsFactors = FALSE)
    }
  }
  ## Return data.frame
  return(fullData)
}
