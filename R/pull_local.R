################################################################################
#
#' pull_local
#'
#' Pull ODK forms from a local ODK folder (\code{/odk}) collected from
#' ODK Collect mobile clients
#'
#' @param briefcase Path to pre-installed ODK Briefcase \code{jar} file. Default
#'     is \code{jar} file (currently ODK Briefcase v1.8.0) installed with the
#'     current version of the package accessed via \code{system.file()}. Path
#'     can be set to access an ODK Briefcase \code{jar} file downloaded locally
#'     in user's machine
#' @param id Form ID of form to be pulled
#' @param to Destination directory for pulled ODK forms; default destination
#' is at current working directory
#' @param from Source ODK directory (\code{/odk}) from ODK Collect mobile client
#' @param pem If form to be pulled is encrypted, a PEM private key file would be
#' required to pull forms; default is NULL; if form is encrypted, provide path
#' to PEM file
#'
#' @return Folder in destination directory named "ODK Briefcase Storage"
#' containing forms pulled from local ODK folder
#'
#' @examples
#' # Use pre-installed ODK Briefcase (version 1.8.0) and pull forms from a
#' # local ODK folder found in Desktop to current working directory
#' \dontrun{
#'   get_briefcase()
#'
#'   pull_local(id = "stakeholders",
#'              from = ~/Desktop/odk)
#' }
#'
#' @export
#'
#
################################################################################

pull_local <- function(briefcase = system.file("java",
                                               "odkBriefcase_latest.jar",
                                               package = "odkr"),
                       id, to = getwd(), from, pem = NULL) {
  z <- paste("java -jar ", briefcase,
             " --form_id ", id,
             " --storage_directory ", to,
             " --odk_directory ", from, sep = "")

  if(!is.null(pem)) z <- paste(z, " --pem_file ", pem, sep = "")

  system(z)
}
