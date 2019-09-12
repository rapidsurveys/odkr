library(odkr)
context("Test output of pull_local")



test_that("ODK Briefcase Storage exists", {
  expect_true(file.exists(paste(dirPath, "/ODK Briefcase Storage", sep = "")))
})

test_that("Error for no target", {
  expect_error(pull_local(id = "stakeholders",
                          from = "ODK Briefcase Storage",
                          to = dirPath),
               "Cannot locate ODK Briefcase .jar file. Check target location of .jar file is correct.")
})

test_that("Error for no id", {
  expect_error(pull_local(target = dirPath,
                          from = "ODK Briefcase Storage",
                          to = dirPath),
               "Form id not specified. Try again.")
})

test_that("Error for no from", {
  expect_error(pull_local(target = dirPath,
                          id = "stakeholders",
                          to = dirPath),
               "Cannot locate source ODK directory. Check target location of source ODK directory is correct.")
})

test_that("Error for no to", {
  expect_error(pull_local(target = dirPath,
                          id = "stakeholders",
                          from = "ODK Briefcase Storage"),
               "Cannot locate destination folder for ODK Briefcase Storage. Check destination location is correct.")
})
