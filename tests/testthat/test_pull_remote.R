
dirPath <- tempdir()

test_that("Error for no target", {
  expect_error(pull_remote(sd = TRUE,
                           id = "stakeholders",
                           from = "https://ona.io/validtrial",
                           to = dirPath,
                           username = "validtrial",
                           password = "zEF-STN-5ze-qom"),
               "Cannot locate ODK Briefcase .jar file. Check target location of .jar file is correct.")
})

test_that("Error for no id", {
  expect_error(pull_remote(target = dirPath,
                           sd = TRUE,
                           from = "https://ona.io/validtrial",
                           to = dirPath,
                           username = "validtrial",
                           password = "zEF-STN-5ze-qom"),
               "Form id not specified. Try again.")
})

test_that("Error for no from", {
  expect_error(pull_remote(target = dirPath,
                           sd = TRUE,
                           id = "stakeholders",
                           to = dirPath,
                           username = "validtrial",
                           password = "zEF-STN-5ze-qom"),
               "URL of remote ODK Aggregate not specified. Try again.")
})

test_that("Error for no to", {
  expect_error(pull_remote(target = dirPath,
                           sd = TRUE,
                           id = "stakeholders",
                           from = "https://ona.io/validtrial",
                           username = "validtrial",
                           password = "zEF-STN-5ze-qom"),
               "Cannot locate destination folder for ODK Briefcase Storage. Check destination location is correct.")
})
