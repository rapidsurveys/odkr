################################################################################
#
#' Updates pre-installed ODK Briefcase \code{jar} file to the latest version
#' downloaded from \url{https://opendatakit.org}.
#'
#' @param destination Path to directory where ODK Briefcase \code{.jar} file
#'     will be downloaded into
#' @param briefcase Filename of the downloaded ODK Briefcase \code{.jar} file.
#'     Default is \code{"odkBriefcase_latest"}
#'
#' @return NULL
#'
#' @examples
#'   # Get latest version of ODK Briefcase and save in a temporary directory
#'     \dontrun{
#'       dirPath <- tempdir()
#'       get_briefcase(destination = dirPath)
#'     }
#' @export
#'
#
################################################################################

get_briefcase <- function(destination = "",
                          briefcase = "odkBriefcase_latest") {

  ## Check if appropriate Java runtime version is available
  rJava::.jinit()
  jv <- rJava::.jcall("java/lang/System", "S", "getProperty", "java.runtime.version")
  if(substr(jv, 1L, 2L) == "1.") {
    jvn <- as.numeric(paste0(strsplit(jv, "[.]")[[1L]][1:2], collapse = "."))
    if(jvn < 1.8) stop("Java >= 8 is needed for this package but not available")
  }

  ## Check that destination has been specified
  if(destination == "") {
    stop("No destination path for ODK Briefcase specified. Try again.", call. = TRUE)
  }

  ## Get the url for latest release download of Briefcase from GitHub
  x <- curl::curl("https://api.github.com/repos/getodk/briefcase/releases/latest")

  ## Close connection to Briefcase download URL
  on.exit(expr = close(x))

  y <- readLines(x, warn = FALSE)
  z <- unlist(stringr::str_split(y, pattern = ","))
  download.url <- stringr::str_extract(string = z[stringr::str_detect(z, "browser_download_url")],
                                       pattern = " ?(f|ht)tp(s?)://(.*)[.][a-z]+")

  ## Download the latest release Briefcase from GitHub
  download.file(url = download.url,
                destfile = paste(destination, "/", briefcase, ".jar", sep = ""),
                mode = "wb")
}
