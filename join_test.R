# Join PRactice 

#install.packages("DBI")
library("RPostgres")
library("DBI")
library("tidyverse")


con <- dbConnect(RPostgres::Postgres(),dbname = 'farm_prod', 
                 host = 'farm.cvyi3rhyclnw.us-east-1.rds.amazonaws.com', # i.e. 'ec2-54-83-201-96.compute-1.amazonaws.com'
                 port = 5432, # or any other port specified by your DBA
                 user = 'farm_prod',
                 password = 'uoU8rVK5RJksLlM2FkOR79S7hk1HlwSw')
