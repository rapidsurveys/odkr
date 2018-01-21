################################################################################
#
#' Retrieve a Java instance of ODK Briefcase
#'
#'
#'
startBriefcase <- function(){
  .jaddLibrary("briefcase", "inst/java/ODK Briefcase v1.8.0 Production.jar")
  .jaddClassPath("inst/java/ODK Briefcase v1.8.0 Production.jar")

}
