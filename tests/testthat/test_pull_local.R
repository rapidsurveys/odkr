library(odkr)
context("Test output of pull_local")

dirPath <- tempdir()
get_briefcase(destination = dirPath)

pull_local(target = dirPath,
           id = "stakeholders",
           from = system.file("odk", package = "odkr"),
           to = dirPath)

test_that("ODK Briefcase Storage exists", {
  expect_true(file.exists(paste(dirPath, "/ODK Briefcase Storage", sep = "")))
})
