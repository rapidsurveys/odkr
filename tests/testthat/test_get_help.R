library(odkr)
context("Tests for get_help")

get_briefcase()

test_that("get_help produces message", {
  expect_is(get_help(), "integer")
})
