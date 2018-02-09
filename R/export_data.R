################################################################################
#
#' export_data
#'
#' Export data in CSV format from local ODK Briefcase Storage directory to a
#' specified destination directory and a specified file name
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
#' @param from Path to source ODK Briefcase Storage from which to extract data.
#'     This should match directory path specified when making a call to \code{pull_remote()}
#'     or \code{pull_local()}
#' @param to Destination directory to save output data file
#' @param filename Filename of output CSV data; default is
#' \code{paste(id, "_data.csv", sep = "")}
#' @param start Include data from submission dates after (inclusive) this start
#' date in export to CSV; format <yyyy/MM/dd>
#' @param end Include data from submission dates before (exclusive) this date in
#' export to CSV; format <yyyy/MM/dd>
#' @param overwrite Overwrite existing output data in destination
#' directory with the same filename; default is FALSE
#' @param exclude Exclude media files on export; default is TRUE
#'
#' @return CSV file in destination directory containing data from the pulled
#' forms
#'
#' @examples
#' # Export data from a specified ODK Briefcase Storage directory to current
#' # working directory with a filename called "test.csv"
#' #\dontrun{
#'   dirPath <- tempdir()
#'   get_briefcase(destination = dirPath)
#'   export_data(target = dirPath,
#'               from = dirPath,
#'               to = dirPath,
#'               id = "stakeholders",
#'               filename = "test.csv",
#'               overwrite = TRUE)
#' #}
#'
#' @export
#'
#
################################################################################

export_data <- function(target = "", briefcase = "odkBriefcase_latest",
                        id, from = "", to = "",
                        filename = paste(id, "_data.csv", sep = ""),
                        start = NULL, end = NULL,
                        overwrite = FALSE, exclude = TRUE) {

  if(target == "") {
    stop("Cannot locate ODK Briefcase .jar file. Check target location of .jar file is correct.", call. = TRUE)
  }

  if(from == "") {
    stop("Cannot locate ODK Briefcase Storage. Check target location of storage folder is correct.", call. = TRUE)
  }

  if(to == "") {
    stop("Cannot locate distination folder for ODK data output. Check destination location is correct.", call. = TRUE)
  }

  z <- paste("java -jar ", target, "/", briefcase, ".jar",
             " --form_id ", id,
             " --storage_directory ", from,
             " --export_directory ", to,
             " --export_filename ", filename, sep = "")

  if(!is.null(start)) z <- paste(z, " --export_start_date ", start, sep = "")

  if(!is.null(end)) z <- paste(z, " --export_end_data ", end, sep = "")

  if(overwrite == TRUE) z <- paste(z, " --overwrite_csv_export ", sep = "")

  if(exclude == TRUE) z <- paste(z, " --exclude_media_export ", sep = "")

  system(z)
}
