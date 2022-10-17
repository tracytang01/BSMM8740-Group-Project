library(tidyverse)

setwd("C:/Users/ROG/OneDrive/BSMM-8740")
source("function.R")

df <- read.csv("pastUse.csv")

df <- df[,-1]
head(df)

str(df) # check data type


names(df) # check names of each col


colRecode26789(5, ncol(df), c(6,8:11, 14, 17))

View(df)



df_clean <- drop_na(df) # drop NA

for (i in 1:ncol(df)) {
  print(table(df[,i]))
}
nrow(df_clean)



for
in
