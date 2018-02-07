################################################################################
#
#' get_help
#'
#' Get help with command line interface for ODK Briefcase
#'
#' @param target Path to directory of ODK Briefcase \code{.jar} file. Default
#'     is current working directory matching the default directory path used by
#'     \code{get_briefcase()}. If ODK Briefcase \code{.jar} file was downloaded
#'     manually from \url{https://opendatakit.org}, \code{target} should match
#'     the directory path where \code{.jar} file has been downloaded.
#' @param briefcase Filename of the downloaded ODK Briefcase \code{.jar} file.
#'     Default is \code{odkBriefcase_latest} to match the default filename used
#'     by \code{get_briefcase()}. If ODK Briefcase \code{.jar} file was
#'     downloaded manually from \url{https://opendatakit.org}, filename should
#'     match the default filename used by Open Data Kit which is usually
#'     "ODK Briefcase vX.Y.Z Production.jar" where vX.Y.Z is the version number
#'
#' @return Help notes on usage of ODK Briefcase via command line interface
#'
#' @examples
#' \dontrun{
#'   get_briefcase()
#'   get_help()
#' }
#' @export
#'
#
################################################################################

get_help <- function(target = getwd(), briefcase = "odkBriefcase_latest") {
  z <- paste("java -jar ", target, "/", briefcase, " --help", sep = "")
  system(z)
}
