################################################################################
#
#'
#'
#'
#'
#'
#'
pull_remote <- function(briefcase = "inst/java/ODK Briefcase v1.8.0 Production.jar",
                        id, to = getwd(), from, username, password) {
  z <- paste("java -jar '", briefcase,
             "' --form_id ", id,
             " --storage_directory ", to,
             " --aggregate_url ", remote,
             " --odk_username ", username,
             " --odk_password ", password, sep = "")
  system(z)
}
