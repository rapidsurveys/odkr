################################################################################
#
#' update_briefcase
#'
#' Updates pre-installed ODK Briefcase \code{jar} file to the latest version
#' downloaded from \url{https://opendatakit.org}.
#'
#' @return NULL
#'
#' @export
#'
#
################################################################################

update_briefcase <- function() {
  download.file(url = "https://opendatakit.org/download/4476/",
                destfile = system.file("java", "odkBriefcase_latest.jar",
                                       package = "odkr"))
}
