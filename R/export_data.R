################################################################################
#
#' export_data
#'
#' Export data in CSV format from local ODK Briefcase Storage directory to a
#' specified destination directory and a specified file name
#'
#' @param briefcase Path to pre-installed ODK Briefcase \code{jar} file. Default
#'     is \code{jar} file (currently ODK Briefcase v1.8.0) installed with the
#'     current version of the package accessed via \code{system.file()}. Path
#'     can be set to access an ODK Briefcase \code{jar} file downloaded locally
#'     in user's machine
#' @param id Form ID of form to be pulled
#' @param from Path to source ODK Briefcase Storage from which to extract data;
#' default is \code{getwd()}
#' @param to Destination directory to save output data file; default is
#' \code{getwd()}
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
#' \dontrun{
#'   export_data(id = "stakeholders",
#'               filename = "test.csv",
#'               overwrite = TRUE)
#' }
#'
#' @export
#'
#
################################################################################

export_data <- function(briefcase = system.file("java",
                                                "odkBriefcase_latest.jar",
                                                package = "odkr"),
                        id, from = getwd(), to = getwd(),
                        filename = paste(id, "_data.csv", sep = ""),
                        start = NULL, end = NULL,
                        overwrite = FALSE, exclude = TRUE) {

  z <- paste("java -jar ", briefcase,
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
