library(testthat)
library(odkr)

dirPath <- tempdir()
get_briefcase(destination = dirPath)

pull_remote(target = dirPath,
            id = "stakeholders",
            from = "https://ona.io/validtrial",
            to = dirPath,
            username = "validtrial",
            password = "zEF-STN-5ze-qom",
            max_http_connections = 40)

#pull_local(target = dirPath,
#           id = "stakeholders",
#           from = "ODK Briefcase Storage",
#           to = dirPath)

export_data(target = dirPath,
            id = "stakeholders",
            to = dirPath,
            from = dirPath,
            filename = "test.csv",
            overwrite = TRUE)

test_check("odkr")
