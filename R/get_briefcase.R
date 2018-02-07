################################################################################
#
#' get_briefcase
#'
#' Updates pre-installed ODK Briefcase \code{jar} file to the latest version
#' downloaded from \url{https://opendatakit.org}.
#'
#' @param destination Path to directory where ODK Briefcase \code{.jar} file
#'     will be downloaded into. Default is the \code{java} directory in the
#'     \code{odkr} package installation
#' @param filename Filename of the downloaded ODK Briefcase \code{.jar} file.
#'     Default is \code{"odkBriefcase_latest"}
#'
#' @return NULL
#'
#' @examples
#'   #
#'
#' @export
#'
#
################################################################################

get_briefcase <- function(destination = system.file("java", package = "odkr"),
                          filename = "odkBriefcase_latest") {
  download.file(url = "https://opendatakit.org/download/4476/",
                destfile = paste(destination, "/", filename, ".jar", sep = ""))
}
