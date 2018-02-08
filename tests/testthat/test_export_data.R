library("odkr")
context("Check exported data")

get_briefcase()

pull_remote(id = "stakeholders",
            from = "https://ona.io/validtrial",
            username = "validtrial",
            password = "zEF-STN-5ze-qom")

export_data(id = "stakeholders",
            filename = "test.csv",
            overwrite = TRUE)

test_that("Output CSV data exists", {
  expect_true(file.exists(paste(getwd(), "/test.csv", sep = "")))
})
