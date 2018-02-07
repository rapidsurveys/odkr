library(odkr)
context("Check pull_remote output")

get_briefcase()

pull_remote(id = "stakeholders",
            from = "https://ona.io/validtrial",
            username = "validtrial",
            password = "zEF-STN-5ze-qom")

test_that("ODK Briefcase Storage exists", {
  expect_true(file.exists("ODK Briefcase Storage"))
})
