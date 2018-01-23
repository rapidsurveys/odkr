#
# Read data
#
steppedWedge1 <- read.csv("data-raw/steppedWedge1.csv")
sampleData1 <- steppedWedge1[1:50, c(6:16, 21:23, 29, 31)]
names(sampleData1)[15:16] <- c("KEY", "PARENT_KEY")
devtools::use_data(sampleData1, overwrite = TRUE)
rm(steppedWedge1)

steppedWedge2 <- read.csv("data-raw/steppedWedge2.csv")
sampleData2 <- steppedWedge2[1:50, c(6:12, 30:31, 39:43, 222, 224)]
names(sampleData2)[15:16] <- c("KEY", "PARENT_KEY")
devtools::use_data(sampleData2, overwrite = TRUE)
rm(steppedWedge2)

steppedWedge3 <- read.csv("data-raw/steppedWedge3.csv")
sampleData3 <- steppedWedge3[1:50, c(4, 5, 6, 9, 10:12, 132, 134)]
names(sampleData3)[8:9] <- c("KEY", "PARENT_KEY")
devtools::use_data(sampleData3, overwrite = TRUE)
rm(steppedWedge3)
