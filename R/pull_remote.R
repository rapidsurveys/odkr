################################################################################
#
#' pull_remote
#'
#' Pull ODK forms from remote ODK Aggregate via ODK Briefcase
#'
#' @param briefcase Path to ODK Briefcase jar file; default is jar file
#' installed with package (ODK Briefcase v1.8.0)
#' @param id Form ID of form to be pulled
#' @param to Destination directory for pulled ODK forms; default destination
#' is at current working directory
#' @param from URL of remote ODK Aggregate server
#' @param username Username for account in remote ODK Aggregate server from
#' which forms are to be pulled
#' @param password Password for account in remote ODK Aggregate server from
#' which forms are to be pulled
#' @return Folder in destination directory named "ODK Briefcase Storage"
#' containing forms pulled from remote ODK Aggregate server
#' @examples
#'   # Use pre-installed ODK Briefcase (version 1.8,0) and connect to a test
#'   # remote ODK Aggregate server from ONA (https://ona.io); pulled forms to
#'   # be saved in default location at current working directory
#'   pull_remote(id = "stakeholders",
#'               from = "https://ona.io/validmeasures",
#'               username = "validtrial",
#'               password = "zEF-STN-5ze-qom")
#'
pull_remote <- function(briefcase = system.file("java",
                                                "ODK Briefcase v1.8.0 Production.jar",
                                                package = "odkr"),
                        id, to = getwd(), from, username, password) {
  z <- paste("java -jar '", briefcase,
             "' --form_id ", id,
             " --storage_directory ", to,
             " --aggregate_url ", from,
             " --odk_username ", username,
             " --odk_password ", password, sep = "")
  system(z)
}
