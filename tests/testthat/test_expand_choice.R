

test <- expandMultChoice(answers = renameODK(sampleData2)$ws7,
                         naCode = NA)

test_that("Output is a data.frame", {
  expect_s3_class(test, "data.frame")
})
