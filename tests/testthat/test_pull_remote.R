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

test_that("Error for no target", {
  expect_error(pull_remote(id = "stakeholders",
                           from = "https://ona.io/validtrial",
                           to = dirPath,
                           username = "validtrial",
                           password = "zEF-STN-5ze-qom"),
               "Cannot locate ODK Briefcase .jar file. Check target location of .jar file is correct.")
})

test_that("Error for no id", {
  expect_error(pull_remote(target = dirPath,
                           from = "https://ona.io/validtrial",
                           to = dirPath,
                           username = "validtrial",
                           password = "zEF-STN-5ze-qom"),
               "Form id not specified. Try again.")
})

test_that("Error for no from", {
  expect_error(pull_remote(target = dirPath,
                           id = "stakeholders",
                           to = dirPath,
                           username = "validtrial",
                           password = "zEF-STN-5ze-qom"),
               "Cannot locate source ODK directory. Check target location of source ODK directory is correct.")
})

test_that("Error for no to", {
  expect_error(pull_remote(target = dirPath,
                           id = "stakeholders",
                           from = "https://ona.io/validtrial",
                           username = "validtrial",
                           password = "zEF-STN-5ze-qom"),
               "Cannot locate destination folder for ODK Briefcase Storage. Check destination location is correct.")
})
