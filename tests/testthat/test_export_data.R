library("odkr")
context("Check exported data")

get_briefcase()

pull_remote(id = "stakeholders",
            from = "https://ona.io/validtrial",
            to = "~/Desktop",
            username = "validtrial",
            password = "zEF-STN-5ze-qom")

export_data(id = "stakeholders",
            filename = "test.csv",
            from = "~/Desktop",
            to = "~/Desktop",
            overwrite = TRUE)

test_that("Output CSV data exists", {
  expect_true(file.exists("~/Desktop/test.csv"))
})
