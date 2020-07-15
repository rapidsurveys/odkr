################################################################################
#
#' Function to create an ODK Briefcase Storage directory
#'
#' @param path Directory path on which to create the ODK Briefcase Storage
#'
#' @return ODK Briefcase Storage directory in the specified path
#'
#' @examples
#' create_sd(path = tempdir())
#'
#' @export
#'
#'
#
################################################################################

create_sd <- function(path) {
  dir.create(path = paste(path, "ODK Briefcase Storage", sep = "/"))
  dir.create(path = paste(path, "ODK Briefcase Storage", "forms", sep = "/"))
}
