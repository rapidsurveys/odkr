library(odkr)
context("Check pull_remote output")

dirPath <- tempdir()
get_briefcase(destination = dirPath)

pull_remote(target = dirPath,
            id = "stakeholders",
            from = "https://ona.io/validtrial",
            to = dirPath,
            username = "validtrial",
            password = "zEF-STN-5ze-qom")

test_that("ODK Briefcase Storage exists", {
  expect_true(file.exists(paste(dirPath, "/ODK Briefcase Storage", sep = "")))
})
