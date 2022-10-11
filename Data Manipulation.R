library(tidyverse)

setwd("C:/Users/ROG/OneDrive/BSMM-8740")

df <- read.csv("pastUse.csv")

df <- df[,-1]
head(df)

str(df) # check data type


# the fuction will be moved into fuction.R later
colRecode26789 <- function(startCol, endCol, skipCol) {
  for (i in startCol:endCol) {
    if (names(df)[i] == "G_CEDUC" | 
        names(df)[i] == "G_CLFSST" | 
        names(df)[i] == "GFAMTYPE" |
        names(df)[i] == "G_HHSIZE" |
        names(df)[i] == "G_HEDUC" |
        names(df)[i] == "EV_Q02" | 
        names(df)[i] == "PU_Q03") {
      df[, i] <<- ifelse(df[, i] == 6, NA, df[, i])
      df[, i] <<- ifelse(df[, i] == 7, NA, df[, i])
      df[, i] <<- ifelse(df[, i] == 8, NA, df[, i])
      df[, i] <<- ifelse(df[, i] == 9, NA, df[, i])
      
    } else {
      df[, i] <<- ifelse(df[, i] == 2, 0, df[, i])
      df[, i] <<- ifelse(df[, i] == 6, NA, df[, i])
      df[, i] <<- ifelse(df[, i] == 7, NA, df[, i])
      df[, i] <<- ifelse(df[, i] == 8, NA, df[, i])
      df[, i] <<- ifelse(df[, i] == 9, NA, df[, i])    }
  }
}

# or
colRecode26789 <- function(startCol, endCol, skipCol) {
    if (length(skipCol) > 0) {
      for (i in as.vector(startCol:endCol)[-skipCol]) {
        df[, i] <<- ifelse(df[, i] == 2, 0, df[, i])
        df[, i] <<- ifelse(df[, i] == 6, NA, df[, i])
        df[, i] <<- ifelse(df[, i] == 7, NA, df[, i])
        df[, i] <<- ifelse(df[, i] == 8, NA, df[, i])
        df[, i] <<- ifelse(df[, i] == 9, NA, df[, i])
      }
      for (i in skipCol) {
        df[, i] <<- ifelse(df[, i] == 6, NA, df[, i])
        df[, i] <<- ifelse(df[, i] == 7, NA, df[, i])
        df[, i] <<- ifelse(df[, i] == 8, NA, df[, i])
        df[, i] <<- ifelse(df[, i] == 9, NA, df[, i])
      }
    } else {
      for (i in startCol:endCol) {
        df[, i] <<- ifelse(df[, i] == 2, 0, df[, i])
        df[, i] <<- ifelse(df[, i] == 6, NA, df[, i])
        df[, i] <<- ifelse(df[, i] == 7, NA, df[, i])
        df[, i] <<- ifelse(df[, i] == 8, NA, df[, i])
        df[, i] <<- ifelse(df[, i] == 9, NA, df[, i])    
      }
  }
}
names(df) # check names of each col


colRecode26789(5, ncol(df), c(6,8:11, 14, 17))

View(df)



df_clean <- drop_na(df) # drop NA

for (i in 1:ncol(df)) {
  print(table(df[,i]))
}
nrow(df_clean)




