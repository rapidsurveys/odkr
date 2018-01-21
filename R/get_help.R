################################################################################
#
#' get_help
#'
#' Get help with command line interface for ODK Briefcase
#'
#' @param briefcase Path to ODK Briefcase jar file; default is jar file
#' installed with package (ODK Briefcase v1.8.0)
#' @return Help notes on usage of ODK Briefcase via command line interface
#' @examples
#' get_help()
#'
get_help <- function(briefcase = system.file("java",
                                             "odkBriefcase_v1.8.0.jar",
                                              package = "odkr")) {
  z <- paste("java -jar '", briefcase, "' --help", sep = "")
  system(z)
}
