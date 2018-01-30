library(odkr)
context("Tests for get_help")

test_that("get_help produces message", {
  expect_is(get_help(), "integer")
})
