################################################################################
#
#' pull_remote
#'
#' Pull ODK forms from remote ODK Aggregate via ODK Briefcase
#'
#' @param briefcase Path to pre-installed ODK Briefcase \code{jar} file. Default
#'     is \code{jar} file (currently ODK Briefcase v1.8.0) installed with the
#'     current version of the package accessed via \code{system.file()}. Path
#'     can be set to access an ODK Briefcase \code{jar} file downloaded locally
#'     in user's machine
#' @param id Form ID of form to be pulled
#' @param to Destination directory for pulled ODK forms; default destination
#' is at current working directory
#' @param from URL of remote ODK Aggregate server
#' @param username Username for account in remote ODK Aggregate server from
#' which forms are to be pulled
#' @param password Password for account in remote ODK Aggregate server from
#' which forms are to be pulled
#'
#' @return Folder in destination directory named "ODK Briefcase Storage"
#' containing forms pulled from remote ODK Aggregate server
#'
#' @examples
#'   # Use pre-installed ODK Briefcase (version 1.8,0) and connect to a test
#'   # remote ODK Aggregate server from ONA (https://ona.io); pulled forms to
#'   # be saved in default location at current working directory
#'   \dontrun{
#'   pull_remote(id = "stakeholders",
#'               from = "https://ona.io/validtrial",
#'               username = "validtrial",
#'               password = "zEF-STN-5ze-qom")
#'   }
#' @export
#'
#
################################################################################

pull_remote <- function(briefcase = system.file("java",
                                                "odkBriefcase_latest.jar",
                                                package = "odkr"),
                        id, to = getwd(), from, username, password) {
  z <- paste("java -jar ", briefcase,
             " --form_id ", id,
             " --storage_directory ", to,
             " --aggregate_url ", from,
             " --odk_username ", username,
             " --odk_password ", password, sep = "")
  system(z)
}
