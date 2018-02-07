################################################################################
#
#' get_help
#'
#' Get help with command line interface for ODK Briefcase
#'
#' @param briefcase Path to pre-installed ODK Briefcase \code{jar} file. Default
#'     is \code{jar} file (currently ODK Briefcase v1.8.0) installed with the
#'     current version of the package accessed via \code{system.file()}. Path
#'     can be set to access an ODK Briefcase \code{jar} file downloaded locally
#'     in user's machine
#'
#' @return Help notes on usage of ODK Briefcase via command line interface
#'
#' @examples
#' get_help()
#'
#' @export
#'
#
################################################################################

get_help <- function(briefcase = system.file("java",
                                             "odkBriefcase_latest.jar",
                                             package = "odkr")) {
  z <- paste("java -jar ", briefcase, " --help", sep = "")
  system(z)
}
