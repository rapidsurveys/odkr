################################################################################
#
#' Export data in CSV format from local ODK Briefcase Storage directory to a
#' specified destination directory and a specified file name
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
#' @param from Path to source ODK Briefcase Storage from which to extract data.
#'   This should match directory path specified when making a call to
#'   \code{pull_remote()} or \code{pull_local()}
#' @param to Destination directory to save output data file
#' @param filename Filename of output CSV data; default is
#'   \code{paste(id, "_data.csv", sep = "")}
#' @param start Include data from submission dates after (inclusive) this start
#'   date in export to CSV. Date format YYYY-MM-DD or YYYY/MM/DD
#' @param end Include data from submission dates before (inclusive) this date in
#'   export to CSV. Date format YYYY-MM-DD> or YYYY/MM/DD
#' @param overwrite Overwrite existing output data in destination
#'   directory with the same filename; default is FALSE
#' @param exclude Exclude media files on export; default is TRUE
#' @param group.names Logical. Should group names be removed from column names
#'   on export? Default TRUE.
#' @param split Logical. Should select multiple fields be split on export?
#'   Default FALSE.
#' @param pem Path to pem key if using an encrypted form. Null by default.
#' @param pullBefore Logical. If set to true, pull before export. Defult FALSE.
#' @param includeGeo Logical. If set to true, pull geojson. Default FALSE.
#'
#' @return CSV file in destination directory containing data from the pulled
#' forms
#'
#' @examples
#' # Export data from a specified ODK Briefcase Storage directory to current
#' # working directory with a filename called "test.csv"
#' \dontrun{
#'   dirPath <- tempdir()
#'   get_briefcase(destination = dirPath)
#'   export_data(target = dirPath,
#'               from = dirPath,
#'               to = dirPath,
#'               id = "stakeholders",
#'               filename = "test.csv",
#'               overwrite = TRUE)
#' }
#'
#' @export
#'
#
################################################################################

export_data <- function(target = "",
                        briefcase = "odkBriefcase_latest",
                        sd = FALSE,
                        id = "", from = "", to = "",
                        filename = paste(id, "_data.csv", sep = ""),
                        start = NULL, end = NULL,
                        overwrite = FALSE, exclude = TRUE,
                        group.names = TRUE, split = FALSE,
                        pem = NULL,
                        pullBefore = FALSE,
                        includeGeo = FALSE) {

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
    stop("Cannot locate source ODK directory. Check target location of source ODK directory is correct.", call. = TRUE)
  }

  ## Check if to is specified
  if(to == "") {
    stop("Cannot locate destination folder for ODK Briefcase Storage. Check destination location is correct.", call. = TRUE)
  }

  ## Check if storage directory needed
  if(sd == TRUE) {
    create_sd(path = to)
  }

  if(!is.null(pem)) {
    if(!file.exists(pem)) {
      stop("The pem file you specified cannot be found. Check your file path.", call. = TRUE)
    } else {
      message("Using the pem key provided to decrypt")
    }
  }

  ## Create command line input based on standard/required specifications
  z <- paste0("java -jar ", target, "/", briefcase, ".jar",
             " --export ",
             " --form_id ", id,
             " --storage_directory ", from,
             " --export_directory ", to,
             " --export_filename ", filename)

  ## Add further specifications to command line inputs
  if(!is.null(start)) z <- paste0(z, " --export_start_date ", start)
  if(!is.null(end)) z <- paste0(z, " --export_end_date ", end)
  if(overwrite) z <- paste0(z, " --overwrite_csv_export ")
  if(exclude) z <- paste0(z, " --exclude_media_export ")
  if(group.names) z <- paste0(z, " --remove_group_names ")
  if(split) z <- paste0(z, " --split_select_multiples ")
  if(!is.null(pem)) z <- paste0(z, " --pem_file ", pem)
  if(pullBefore) z <- paste0(z, " --pull_before")
  if(includeGeo) z <- paste0(z, " --include_geojson")


  ## Execute inputs on command line
  system(z)
}

