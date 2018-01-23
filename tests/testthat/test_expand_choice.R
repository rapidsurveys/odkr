library(odkr)
context("Test expended data frame output")

test <- expandMultChoice(answers = renameODK(sampleData2)$ws7,
                         naCode = NA)

test_that("Output is a data.frame", {
  expect_is(test, "data.frame")
})
