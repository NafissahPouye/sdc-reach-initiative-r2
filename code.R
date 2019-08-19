library(readxl)      #for excel, csv sheets manipulation
library(sdcMicro)    #sdcMicro package with functions for the SDC process 
library(tidyverse)   #optional #for data cleaning

#Import data
setwd("C:/Users/LENOVO T46OS/Desktop/sdc-reach-initiative-r2")
data <- read_excel("data.xlsx", sheet = "main_frame")
#Resource1 - Main Frame
#Comments
#houses numbers & streets should be removed
# id
selectedKeyVars <- c('facility_name',	'gender',	'position',
                     'facility_oblast',
                     'facility_address',	'facility_settlement',
                     'adm1NameLat',	'adm2NameLat',
                     'adm4NameLat',	'cva_area'
                     )

#Convert variables into factors
cols =  c('facility_name',	'gender',	'position',
          'facility_oblast',
          'facility_address',	'facility_settlement')
data[,cols] <- lapply(data[,cols], factor)

#Convert the sub file into dataframe
#subVars <- c(selectedKeyVars, weightVars)
fileRes<-data[,selectedKeyVars]
fileRes <- as.data.frame(fileRes)
objSDC <- createSdcObj(dat = fileRes, 
                       keyVars = selectedKeyVars
                       )

print(objSDC, "risk")
report(objSDC, filename ="index",internal = T, verbose = TRUE) 