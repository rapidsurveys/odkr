
dirPath <- tempdir()

test_that("get_help produces message", {
  expect_is(get_help(target = dirPath), "integer")
})
