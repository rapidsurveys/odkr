library(testthat)
library(odkr)

dirPath <- tempdir()
get_briefcase(destination = dirPath)

test_check("odkr")
