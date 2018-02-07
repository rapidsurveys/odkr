################################################################################
#
#' pull_remote
#'
#' Pull ODK forms from remote ODK Aggregate via ODK Briefcase
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
#'   get_briefcase()
#'   pull_remote(id = "stakeholders",
#'               from = "https://ona.io/validtrial",
#'               username = "validtrial",
#'               password = "zEF-STN-5ze-qom")
#'   }
#' @export
#'
#
################################################################################

pull_remote <- function(target = getwd(), briefcase = "odkBriefcase_latest",
                        id, to = getwd(), from, username, password) {
  z <- paste("java -jar ", target, "/", briefcase, ".jar",
             " --form_id ", id,
             " --storage_directory ", to,
             " --aggregate_url ", from,
             " --odk_username ", username,
             " --odk_password ", password, sep = "")
  system(z)
}
