################################################################################
#
#' get_briefcase
#'
#' Updates pre-installed ODK Briefcase \code{jar} file to the latest version
#' downloaded from \url{https://opendatakit.org}.
#'
#' @param destination Path to directory where ODK Briefcase \code{.jar} file
#'     will be downloaded into. Default is the current working directory.
#' @param briefcase Filename of the downloaded ODK Briefcase \code{.jar} file.
#'     Default is \code{"odkBriefcase_latest"}
#'
#' @return NULL
#'
#' @examples
#'   # Get latest version of ODK Briefcase and save in default location
#'   \dontrun{
#'     get_briefcase()
#'   }
#' @export
#'
#
################################################################################

get_briefcase <- function(destination = getwd(),
                          briefcase = "odkBriefcase_latest") {
  download.file(url = "https://opendatakit.org/download/4476/",
                destfile = paste(destination, "/", briefcase, ".jar", sep = ""),
                mode = "wb")
}
