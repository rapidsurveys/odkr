library(odkr)
context("Check exported data")

test_that("Output CSV data exists", {
  testthat::skip_on_appveyor(message = "Temporary directory allocation is not persistent in Windows")
  expect_true(file.exists(paste(dirPath, "/test.csv", sep = "")))
})

test_that("Error for no target", {
  expect_error(export_data(id = "stakeholders",
                           to = dirPath,
                           from = dirPath,
                           filename = "test.csv",
                           overwrite = TRUE),
               "Cannot locate ODK Briefcase .jar file. Check target location of .jar file is correct.")
})

test_that("Error for no id", {
  expect_error(export_data(target = dirPath,
                           to = dirPath,
                           from = dirPath,
                           filename = "test.csv",
                           overwrite = TRUE),
               "Form id not specified. Try again.")
})

test_that("Error for no from", {
  expect_error(export_data(target = dirPath,
                           id = "stakeholders",
                           to = dirPath,
                           filename = "test.csv",
                           overwrite = TRUE),
               "Cannot locate source ODK directory. Check target location of source ODK directory is correct.")
})

test_that("Error for no to", {
  expect_error(export_data(target = dirPath,
                           id = "stakeholders",
                           from = dirPath,
                           filename = "test.csv",
                           overwrite = TRUE),
               "Cannot locate destination folder for ODK Briefcase Storage. Check destination location is correct.")
})
