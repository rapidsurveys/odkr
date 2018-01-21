################################################################################
#
#' pull_remote
#'
#' Pull ODK forms from remote ODK Aggregate via ODK Briefcase
#'
#' @params briefcase Path to ODK Briefcase jar file; default is jar file
#' installed with package
#' @params id Form ID of form to be pulled
#' @params to Destination directory for pulled ODK forms
#' @params remote URL of remote ODK Aggregate server
#' @params username Username for account in remote ODK Aggregate server from
#' which forms are to be pulled
#' @params password Password for account in remote ODK Aggregate server from
#' which forms are to be pulled
#' @return Folder in destination directory named "ODK Briefcase Storage"
#' containing forms pulled from remote ODK Aggregate server
#' @examples
#'
pull_remote <- function(briefcase = "inst/java/ODK Briefcase v1.8.0 Production.jar",
                        id, to = getwd(), from, username, password) {
  z <- paste("java -jar '", briefcase,
             "' --form_id ", id,
             " --storage_directory ", to,
             " --aggregate_url ", remote,
             " --odk_username ", username,
             " --odk_password ", password, sep = "")
  system(z)
}
