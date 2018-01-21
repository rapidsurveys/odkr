################################################################################
#
#' pull_local
#'
#' Pull ODK forms from a local ODK folder (\code{/odk}) collected from
#' ODK Collect mobile clients
#'
#' @param briefcase Path to ODK Briefcase jar file; default is jar file
#' installed with package (ODK Briefcase v1.8.0)
#' @param id Form ID of form to be pulled
#' @param to Destination directory for pulled ODK forms; default destination
#' is at current working directory
#' @param from Source ODK directory (\code{/odk}) from ODK Collect mobile client
#' @return Folder in destination directory named "ODK Briefcase Storage"
#' containing forms pulled from local ODK folder
#' @examples
#'   # Use pre-installed ODK Briefcase (version 1.8,0) and pull data from a
#'   # local ODK folder to current working directory
#'   pull_remote(id = "stakeholders",
#'               from = system.file("odk", package = "odkr"))
#'
pull_local <- function(briefcase = system.file("java",
                                               "ODK Briefcase v1.8.0 Production.jar",
                                               package = "odkr"),
                       id, to = getwd(), from) {
  z <- paste("java -jar '", briefcase,
             "' --form_id ", id,
             " --storage_directory ", to,
             " --odk_directory ", from, sep = "")
  system(z)
}
