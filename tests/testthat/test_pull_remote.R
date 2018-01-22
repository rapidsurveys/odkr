library(odkr)
context("Pull forms from remote server")

pull_remote(id = "stakeholders",
            from = "https://ona.io/validmeasures",
            username = "validtrial",
            password = "zEF-STN-5ze-qom")

test_that("ODK Briefcase Storage exists", {
  expect_true(file.exists("ODK Briefcase Storage"))
})
