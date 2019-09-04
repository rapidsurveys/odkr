library(odkr)
context("Check push_data output")

dirPath <- tempdir()
#get_briefcase(destination = dirPath)

test_that("Error for no target", {
  expect_error(push_data(id = "stakeholders",
                         from = "https://ona.io/validtrial",
                         to = dirPath,
                         username = "validtrial",
                         password = "zEF-STN-5ze-qom"),
               "Cannot locate ODK Briefcase .jar file. Check target location of .jar file is correct.")
})

test_that("Error for no id", {
  expect_error(push_data(target = dirPath,
                         from = "https://ona.io/validtrial",
                         to = dirPath,
                         username = "validtrial",
                         password = "zEF-STN-5ze-qom"),
               "Form id not specified. Try again.")
})

test_that("Error for no to", {
  expect_error(push_data(target = dirPath,
                         id = "stakeholders",
                         from = dirPath,
                         username = "validtrial",
                         password = "zEF-STN-5ze-qom"),
               "URL of remote ODK Aggregate not specified. Try again.")
})

test_that("Error for no from", {
  expect_error(push_data(target = dirPath,
                         id = "stakeholders",
                         to = "https://ona.io/validtrial",
                         username = "validtrial",
                         password = "zEF-STN-5ze-qom"),
               "Cannot locate source ODK Briefcase Storage folder. Check source location is correct.")
})
