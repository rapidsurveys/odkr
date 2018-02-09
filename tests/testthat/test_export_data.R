#library("odkr")
context("Check exported data")

dirPath <- tempdir()

get_briefcase(destination = dirPath)

pull_remote(target = dirPath,
            id = "stakeholders",
            from = "https://ona.io/validtrial",
            to = dirPath,
            username = "validtrial",
            password = "zEF-STN-5ze-qom")

export_data(target = dirPath,
            id = "stakeholders",
            to = dirPath,
            from = dirPath,
            filename = "test.csv",
            overwrite = TRUE)

test_that("Output CSV data exists", {
  expect_true(file.exists(paste(dirPath, "/test.csv", sep = "")))
})
