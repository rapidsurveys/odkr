################################################################################
#
#' get_briefcase
#'
#' Updates pre-installed ODK Briefcase \code{jar} file to the latest version
#' downloaded from \url{https://opendatakit.org}.
#'
#' @param destination Path to directory where ODK Briefcase \code{.jar} file
#'     will be downloaded into
#' @param briefcase Filename of the downloaded ODK Briefcase \code{.jar} file.
#'     Default is \code{"odkBriefcase_latest"}
#'
#' @return NULL
#'
#' @examples
#'   # Get latest version of ODK Briefcase and save in a temporary directory
#'     dirPath <- tempdir()
#'     get_briefcase(destination = dirPath)
#' @export
#'
#
################################################################################

get_briefcase <- function(destination = "",
                          briefcase = "odkBriefcase_latest") {
  if(destination == "") {
    stop("No destination path for ODK Briefcase specified. Try again.", call. = TRUE)
  }
  download.file(url = "https://opendatakit.org/download/4476/",
                destfile = paste(destination, "/", briefcase, ".jar", sep = ""),
                mode = "wb")
}
