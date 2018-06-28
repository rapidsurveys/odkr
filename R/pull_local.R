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
#' # Pull forms from a local ODK folder to current working directory
#' \dontrun{
#'   dirPath <- tempdir()
#'   get_briefcase(destination = dirPath)
#'   pull_local(target = dirPath,
#'              id = "stakeholders",
#'              from = system.file("odk", package = "odkr"),
#'              to = dirPath)
#' }
#'
#' @export
#'
#
################################################################################

pull_local <- function(target = "", briefcase = "odkBriefcase_latest",
                       id = "", to = "", from = "", pem = NULL) {
  #
  # Check if appropriate Java runtime version is available
  #
  rJava::.jinit()
  jv <- rJava::.jcall("java/lang/System", "S", "getProperty", "java.runtime.version")
  if(substr(jv, 1L, 2L) == "1.") {
    jvn <- as.numeric(paste0(strsplit(jv, "[.]")[[1L]][1:2], collapse = "."))
    if(jvn < 1.8) stop("Java >= 8 is needed for this package but not available")
  }
  #
  # Check if target is specified
  #
  if(target == "") {
    stop("Cannot locate ODK Briefcase .jar file. Check target location of .jar file is correct.", call. = TRUE)
  }
  #
  # Check if id is specified
  #
  if(id == "") {
    stop("Form id not specified. Try again.", call. = TRUE)
  }
  #
  # Check if from is specified
  #
  if(from == "") {
    stop("Cannot locate source ODK directory. Check target location of source ODK directory is correct.", call. = TRUE)
  }
  #
  # Chec if to is specified
  #
  if(to == "") {
    stop("Cannot locate destination folder for ODK Briefcase Storage. Check destination location is correct.", call. = TRUE)
  }
  #
  # Create command line inputs based on required specifications
  #
  z <- paste("java -jar ", target, "/", briefcase, ".jar",
             " --pull_collect ",
             " --form_id ", id,
             " --storage_directory ", to,
             " --odk_directory ", from, sep = "")
  #
  # Add optional specifications to command line inputs
  #
  if(!is.null(pem)) z <- paste(z, " --pem_file ", pem, sep = "")
  #
  # Execute inputs on command line
  #
  system(z)
}
