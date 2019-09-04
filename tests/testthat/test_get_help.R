library(odkr)
context("Tests for get_help")

dirPath <- tempdir()

#get_briefcase(destination = dirPath)

test_that("get_help produces message", {
  expect_is(get_help(target = dirPath), "integer")
})
