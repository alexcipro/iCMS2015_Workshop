# Import data in R


## Text Files

# import data from "mydata.txt" file
# the first row is the columns names
# the field (variable) value separator is 'tab' character
mydata <- read.table("d:/mydata.txt", head = TRUE, sep = "\t")



## CSV Files

# import data from "mydata.csv" file
# the first row is the columns names
# the field (variable) value separator is comma character
# read.csv
mydata <- read.csv("d:/mydata.csv")
# similar with read.table
mydata <- read.table("d:/mydata.csv", head = TRUE, sep = ",")



## Excel Files

# read in the first worksheet from the workbook mydata.xlsx
# first row contains variable names
install.packages("xlsx")
install.packages("rJava")

# you have to be in R-32 bit version
# it doesn't work on 64-bit version of R
library(rJava)
library(xlsx)
mydata <- read.xlsx("d:/mydata.xlsx", 1)

# read in the worksheet named Sheet1
mydata <- read.xlsx("d:/mydata.xlsx", sheetName = "Sheet11")



## SPSS Files

library(foreign)
# using the arguments use.value.labels don't convert value labels to factor levels
mydata <- read.spss(file.choose(), use.value.labels = FALSE)



## DBF Files

mydata <- read.dbf("d:/mydata.dbf")



## SAS Files

install.packages("Hmisc")
library(Hmisc)
mydata <- sasxport.get("d:/mydata.xpt")  



## Stata Files

library(foreign)
mydata <- read.dta("d:/mydata.dta")



