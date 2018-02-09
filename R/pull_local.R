################################################################################
#
#' pull_local
#'
#' Pull ODK forms from a local ODK folder (\code{/odk}) collected from
#' ODK Collect mobile clients
#'
#' @param target Path to directory of ODK Briefcase \code{.jar} file. Directory
#'     path should match directory path used when calling \code{get_briefcase()}.
#'     If ODK Briefcase \code{.jar} file was downloaded manually from \url{https://opendatakit.org},
#'     \code{target} should match the directory path where \code{.jar} file has
#'     been downloaded into.
#' @param briefcase Filename of the downloaded ODK Briefcase \code{.jar} file.
#'     Default is \code{odkBriefcase_latest} to match the default filename used
#'     by \code{get_briefcase()}. If ODK Briefcase \code{.jar} file was
#'     downloaded manually from \url{https://opendatakit.org}, filename should
#'     match the default filename used by Open Data Kit which is usually
#'     "ODK Briefcase vX.Y.Z Production.jar" where vX.Y.Z is the version number
#' @param id Form ID of form to be pulled
#' @param to Destination directory for pulled ODK forms
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
#' #\dontrun{
#'   dir <- tempdir()
#'   get_briefcase(dir)
#'   pull_local(target = dir,
#'              id = "stakeholders",
#'              from = system.file("odk", package = "odkr"),
#'              to = dir)
#' #}
#'
#' @export
#'
#
################################################################################

pull_local <- function(target = "", briefcase = "odkBriefcase_latest",
                       id, to = "", from = "", pem = NULL) {

  if(target == "") {
    stop("Cannot locate ODK Briefcase .jar file. Check target location of .jar file is correct.", call. = TRUE)
  }

  if(from == "") {
    stop("Cannot locate source ODK directory. Check target location of source ODK directory is correct.", call. = TRUE)
  }

  if(to == "") {
    stop("Cannot locate distination folder for ODK Briefcase Storage. Check destination location is correct.", call. = TRUE)
  }


  z <- paste("java -jar ", target, "/", briefcase, ".jar",
             " --form_id ", id,
             " --storage_directory ", to,
             " --odk_directory ", from, sep = "")

  if(!is.null(pem)) z <- paste(z, " --pem_file ", pem, sep = "")

  system(z)
}
