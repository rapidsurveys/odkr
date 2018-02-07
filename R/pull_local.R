################################################################################
#
#' pull_local
#'
#' Pull ODK forms from a local ODK folder (\code{/odk}) collected from
#' ODK Collect mobile clients
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
#'   pull_local(id = "stakeholders",
#'              from = ~/Desktop/odk)
#' }
#'
#' @export
#'
#
################################################################################

pull_local <- function(target = getwd(), briefcase = "odkBriefcase_latest",
                       id, to = getwd(), from, pem = NULL) {
  z <- paste("java -jar ", target, "/", briefcase, ".jar",
             " --form_id ", id,
             " --storage_directory ", to,
             " --odk_directory ", from, sep = "")

  if(!is.null(pem)) z <- paste(z, " --pem_file ", pem, sep = "")

  system(z)
}
