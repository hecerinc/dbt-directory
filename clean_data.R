library(tidyverse)
library(data.table)

x <- jsonlite::fromJSON('compiled.json')

x <- as_tibble(x)

names(x) <- tolower(make.names(names(x)))

names(x)[13] <- 'fax'
x[164, ]$website <- paste(x[164,]$website, 'http://www.drsaraa.com', sep=';')

x <- select(x, -info)
