#install.packages("DBI")
library("RPostgres")
library("DBI")
library("tidyverse")


con <- dbConnect(RPostgres::Postgres(),dbname = 'farm_prod', 
                 host = 'farm.cvyi3rhyclnw.us-east-1.rds.amazonaws.com', # i.e. 'ec2-54-83-201-96.compute-1.amazonaws.com'
                 port = 5432, # or any other port specified by your DBA
                 user = 'farm_prod',
                 password = 'uoU8rVK5RJksLlM2FkOR79S7hk1HlwSw')


#dbGetQuery(con,'''
#SELECT table_schema, table_name
#FROM information_schema.tables
#WHERE table_schema not in ("pg_catalog", "information_schema") and table_type = "VIEW"
#''')


dbListTables(con)

dbListFields(con, "harvest_id_hay_results")

dbListFields(con, "equipments")

#################################################################################################################################################
#Excecute Queries

harvest_id_subset <- dbGetQuery(con, "select * from harvest_id_hay_results where file_row > 50")
head(harvest_id_subset)

equipments_subset <- dbGetQuery(con, "select * from equipments")
head(equipments_subset)

#not quite
q1 <- tbl(con, "equipments")
show_query(q1)



#################################################################################################################################################
#get a table

width_settings <- dbReadTable(con, "width_settings")
head(width_settings, n=2)

#################################################################################################################################################
#Safe Queries? I'm not sure if these are pertinent to our situation

# YES
myquery <- dbSendQuery(con, "select * from actor where actor_id = $1")
dbBind(myquery, list(4))
dbFetch(myquery)
#The $1 stands in for a value you’ll substitute in. 
dbClearResult(myquery)

# NO! - at least not if the variable can be manipulated by a user
dbSendQuery(con, paste0("select * from actor where actor_id=", myvar))
################################################################################################################################################
#Close Connection when all work is done, good practice

#dbDisconnect(con)
###############################################################################################################################################
#USE DPLYR

needToInstall <- c("tidyverse")
needToInstall <- needToInstall[which(!needToInstall %in% installed.packages())]
if(length(needToInstall) > 0){
  sapply(needToInstall, install.packages)
}

library(tidyverse)


#QUESTIONS
'''
# Big Picture Questions

  # What value am I trying to provide?
  -
  # Will switching to R just make everyones life harder?
  -
  # How is this going to be different/better than Tableau?
  -
  # Will I need to query/join data for every report?
  -
  # What Long Term Problems are going to be solved?
  -
  
  
# Important Details

  # How are we going to customize each report? (according to area, specialist, phone#)
  # 

# Minor Details
  
  # How to customize an RMD with Stotz Logo?
  # 

# Possibilities
  # We could use Rconnect for the automatic email feature
  #
'''


















