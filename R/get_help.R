################################################################################
#
#' Get help with command line interface for ODK Briefcase
#'
#' @param target Path to directory of ODK Briefcase \code{.jar} file. Directory
#'     path should match directory path used when calling \code{get_briefcase()}.
#'     If ODK Briefcase \code{.jar} file was downloaded manually from
#'     \url{https://opendatakit.org}, \code{target} should match the directory
#'     path where \code{.jar} file has been downloaded into.
#' @param briefcase Filename of the downloaded ODK Briefcase \code{.jar} file.
#'     Default is \code{odkBriefcase_latest} to match the default filename used
#'     by \code{get_briefcase()}. If ODK Briefcase \code{.jar} file was
#'     downloaded manually from \url{https://opendatakit.org}, filename should
#'     match the default filename used by Open Data Kit which is usually
#'     "ODK Briefcase vX.Y.Z Production.jar" where vX.Y.Z is the version number
#'
#' @return Help notes on usage of ODK Briefcase via command line interface
#'
#' @examples
#' \dontrun{
#'   dirPath <- tempdir()
#'   get_briefcase(destination = dirPath)
#'   get_help(target = dirPath)
#' }
#'
#' @export
#'
#
################################################################################

get_help <- function(target = "", briefcase = "odkBriefcase_latest") {

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

  ## Create command line input based on required specifications
  z <- paste("java -jar ", target, "/", briefcase, ".jar", " --help", sep = "")

  ## Execute inputs on command line
  system(z)
}
