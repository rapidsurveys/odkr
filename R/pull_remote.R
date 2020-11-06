################################################################################
#
#' Pull ODK forms from remote ODK Aggregate via ODK Briefcase
#'
#' @param target Path to directory of ODK Briefcase \code{.jar} file. Directory
#'   path should match directory path used when calling \code{get_briefcase()}.
#'   If ODK Briefcase \code{.jar} file was downloaded manually from
#'   \url{https://opendatakit.org}, \code{target} should match the directory
#'   path where \code{.jar} file has been downloaded into.
#' @param briefcase Filename of the downloaded ODK Briefcase \code{.jar} file.
#'   Default is \code{odkBriefcase_latest} to match the default filename used
#'   by \code{get_briefcase()}. If ODK Briefcase \code{.jar} file was
#'   downloaded manually from \url{https://opendatakit.org}, filename should
#'   match the default filename used by Open Data Kit which is usually
#'   "ODK Briefcase vX.Y.Z Production.jar" where vX.Y.Z is the version number
#' @param sd Logical. If TRUE, create an ODK Briefcase Storage in the path
#'   specified by \code{to}. Default is FALSE.
#' @param id Form ID of form to be pulled
#' @param to Destination directory for pulled ODK forms
#' @param from URL of remote ODK Aggregate server to pull ODK forms data from
#' @param include_incomplete Logical. Should incomplete forms be pulled? Default
#'   to FALSE
#' @param max_http_connections Integer value for maximum simultaneous HTTP
#'   connections allowed. Defaults to NULL which will allow for the default 8
#'   simultaneous HTTP connections. Specify this parameter if more simultaneous
#'   connections are required. Maximum value is 32.
#' @param username Username for account in remote ODK Aggregate server from
#'   which forms are to be pulled
#' @param password Password for account in remote ODK Aggregate server from
#'   which forms are to be pulled
#'
#' @return Folder in destination directory named "ODK Briefcase Storage"
#'   containing forms pulled from remote ODK Aggregate server
#'
#' @examples
#'   # Use latest ODK Briefcase and connect to a test
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

pull_remote <- function(target = "",
                        briefcase = "odkBriefcase_latest",
                        sd = FALSE,
                        id = "",
                        to = "",
                        from = "",
                        include_incomplete = FALSE,
                        max_http_connections = NULL,
                        username,
                        password) {

  ## Check if appropriate Java runtime version is available
  rJava::.jinit()
  jv <- rJava::.jcall("java/lang/System", "S", "getProperty", "java.runtime.version")
  if(substr(jv, 1L, 2L) == "1.") {
    jvn <- as.numeric(paste0(strsplit(jv, "[.]")[[1L]][1:2], collapse = "."))
    if(jvn < 1.8) stop("Java >= 8 is needed for this package but not available")
  }

  ## Check if target is specified
  if(target == "") {
    stop("Cannot locate ODK Briefcase .jar file. Check target location of .jar file is correct.", call. = TRUE)
  }

  ## Check if id is specified
  if(id == "") {
    stop("Form id not specified. Try again.", call. = TRUE)
  }

  ## Check if from is specified
  if(from == "") {
    stop("URL of remote ODK Aggregate not specified. Try again.", call. = TRUE)
  }

  ## Check if to is specified
  if(to == "") {
    stop("Cannot locate destination folder for ODK Briefcase Storage. Check destination location is correct.", call. = TRUE)
  }

  ## Check if storage directory needed
  if(sd == TRUE) {
    create_sd(path = to)
  }

  ## Check that max_http_connections is numeric
  if(!is.numeric(max_http_connections) & !is.null(max_http_connections)) {
    warning("Value for maximum simultaneous HTTP connections (max_http_connecions) should be numeric. Setting value back to default.", call. = TRUE)
    max_http_connections <- NULL
  }

  ## Check that max_http_connections value for maximum HTTP connections is not more than 32
  if(max_http_connections > 32) {
    warning("Value for maximum simultaneous HTTP connections (max_http_connecions) should not be more than 32. Setting value back to default.", call. = TRUE)
    max_http_connections <- NULL
  }

  ## Create command line inputs based on required specifications
  z <- paste("java -jar ", target, "/", briefcase, ".jar",
             " --pull_aggregate ",
             " --form_id ", id,
             " --storage_directory ", to,
             " --odk_url ", from,
             " --odk_username ", username,
             " --odk_password ", password,
             if(include_incomplete) " --include_incomplete ",
             " --max_http_connections ",
             if(is.null(max_http_connections)) " 8" else paste(" ", max_http_connections, sep = ""),
             sep = "")

  ## Execute inputs on command line
  system(z)
}
