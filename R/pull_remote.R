################################################################################
#
#' pull_remote
#'
#' Pull ODK forms from remote ODK Aggregate via ODK Briefcase
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
#'   # Use latest ODK Briefcase (version 1.8,0) and connect to a test
#'   # remote ODK Aggregate server from ONA (https://ona.io); pulled forms to
#'   # be saved in default location at current working directory
#'   \dontrun{
#'   dirPath <- tempdir()
#'   get_briefcase(destination = dirPath)
#'   pull_remote(target = dirPath,
#'               id = "stakeholders",
#'               from = "https://ona.io/validtrial",
#'               to = dirPath,
#'               username = "validtrial",
#'               password = "zEF-STN-5ze-qom")
#'   }
#'
#' @export
#'
#
################################################################################

pull_remote <- function(target = "", briefcase = "odkBriefcase_latest",
                        id, to = "", from = "", username, password) {
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
  # Check if from is specified
  #
  if(from == "") {
    stop("Cannot locate remote ODK Aggregate server. Check target URL of remote ODK Aggregate server is correct.", call. = TRUE)
  }
  #
  # Check if to is specified
  #
  if(to == "") {
    stop("Cannot locate distination folder for ODK Briefcase Storage. Check destination location is correct.", call. = TRUE)
  }
  #
  # Create command line inputs based on required specifications
  #
  z <- paste("java -jar ", target, "/", briefcase, ".jar",
             " --form_id ", id,
             " --storage_directory ", to,
             " --aggregate_url ", from,
             " --odk_username ", username,
             " --odk_password ", password, sep = "")
  #
  # Execute inputs on command line
  #
  system(z)
}
