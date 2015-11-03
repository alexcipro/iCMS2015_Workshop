# Export data from R


## Text Files

write.table(mydata, "d:/mysaveddata.txt", row.names = FALSE, sep="\t")



## Excel Files

library(xlsx)
write.xlsx(mydata, "d:/mysaveddata.xlsx")



## SPSS Files

library(foreign)
write.foreign(mydata, "d:/mysaveddata.txt", "c:/mysaveddata.sps", package="SPSS")


## SAS Files

library(foreign)
write.foreign(mydata, "d:/mysaveddata.txt", "d:/mysaveddata.sas", package="SAS")

## Stata Files
# export data frame to Stata binary format 
library(foreign)
write.dta(mydata, "d:/mydata.dta")


