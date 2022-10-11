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