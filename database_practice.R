#Database practice

library(DBI)
library(dbplyr)
library(tidyverse)
library(dbplot)
library(modeldb)
library(tidypredict)
library(config)

con <- DBI::dbConnect(RSQLite::SQLite(), dbname = "mydatabase.db")
