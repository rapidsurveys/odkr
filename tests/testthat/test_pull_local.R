library(odkr)
context("Test output of pull_local")

pull_local(id = "stakeholders",
           from = system.file("odk", package = "odkr"))

test_that("ODK Briefcase Storage exists", {
  expect_true(file.exists("ODK Briefcase Storage"))
})
