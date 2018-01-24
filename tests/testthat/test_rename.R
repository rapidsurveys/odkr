library(odkr); library(stringr)
context("Test renaming of ODK datasets")

case <- renameODK(sampleData1)
test <- str_split(names(sampleData1), pattern = "\\.", simplify = TRUE)[,1]

test_that("Output has no '.'", {
  expect_false(str_detect(names(case), "\\.")[1])
  expect_false(str_detect(names(case), "\\.")[5])
  expect_false(str_detect(names(case), "\\.")[10])
  expect_false(str_detect(names(case), "\\.")[15])
})

test_that("Output has names", {
  expect_named(case)
})


