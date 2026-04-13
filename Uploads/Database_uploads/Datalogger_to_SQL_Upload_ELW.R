## Code for formatting datalogger data into database format
# No external Excel files to add. 
# Folders contain station FLID in name (Station_code)
#
#### Set up ####
library(tidyverse)
library(lubridate) 
library(readxl)
library(writexl)
library(foreign) #read.dbf
#
#
#
Year_of_survey <- c("2026")
Site <- c("WI")
Survey_season <- c(NA) #Season name or NA
Station_name <- c(NA) #Station long name or NA
Station_code <- c("I109") #Station FLID
Survey_date <- c("2.12.26")
Proof_date <- as.Date("2024-01-26")
Proofed_by <- "Tomena Scholze"
#
# The basics ----
#
base_dir <- "../Data/Datalogger/Raw/"
#
# Station information
FLIDS <- read_excel("../Data/FixedLocations.xlsx", sheet = "Sheet1", skip = 0, .name_repair = "universal") 
FL <- FLIDS %>% filter(str_detect(StationName, Station_code) | str_detect(FixedLocationID, Station_code)) %>%
  mutate(StationNumber = as.numeric(StationNumber)) %>%
  dplyr::select(Estuary, SectionName, LatitudeDec, LongitudeDec, StationName, StationNumber)
#
safe_read_excel <- safely(read_excel)
#WQ: Date, Estuary, Section, Class, Station, Latitude, Longitude, Time, Depth, Temp, Salinity, DO, PH, Turbidity, Dpth_strta, Bottom_type, Numbr_QDRT
#SH: STATION, QDRT, OYSTER_NUM, SH, TYPE
#LIVE & DEAD: STATION, QDRT, LIVE, DEAD, NOTES
#
#
# Identify first level folder:
data_folder <- list.dirs(base_dir, 
                        full.names = TRUE, 
                        recursive = FALSE) %>%
  keep(~ grepl(Year_of_survey, .) &
         grepl(Site, .) &
         (is.na(Survey_season) || grepl(Survey_season, .)))

# Identify data folder:
data_path <- list.dirs(data_folder, 
                        full.names = TRUE, 
                        recursive = FALSE) %>%
  keep(~ grepl(Station_code, .) &
         grepl(Survey_date, .) &
         (is.na(Station_name) || grepl(Station_name, .)))
#
# Load data files:
data_files <- list.files(path = data_path, 
           pattern = "\\.dbf$", 
           full.names = TRUE) %>%
  setNames(nm = basename(.)) %>%
  map(read.dbf) %>%
  bind_rows(.id = "FileName") %>%
  mutate(FileName = substr(FileName, 1, 1))
#
#
#
#FixedLocations: 
#Trip
#WQ: Date, Estuary, Section, Class, Station, Latitude, Longitude, Time, Depth, Temp, Salinity, DO, PH, Turbidity, Dpth_strta, Bottom_type, Numbr_QDRT
#SH: STATION, QDRT, OYSTER_NUM, SH, TYPE
#LIVE & DEAD: STATION, QDRT, LIVE, DEAD, NOTES
#### Formatting ####
#
time <-Sys.Date()
m <-month(time)
d <- day(time)
year <- year(time)
YMD <-paste0(year,m,d)
#
#
#
#### FixedLocations ####
#
FixedInfo <- list.files(path = data_path, 
                           pattern = "\\STATION.dbf$", 
                           full.names = TRUE) %>%
  setNames(nm = basename(.)) %>%
  map(read.dbf) %>%
  bind_rows(.id = "FileName") %>%
  mutate(FileName = substr(FileName, 1, 1))
#
FID <- FixedInfo %>%
  mutate(DATE = as.Date(DATE, "%m/%d/%y")) %>%
  fill(DATE, .direction = "up") %>% 
  mutate(DATE= first(DATE)) %>%
  filter(!is.na(ESTUARY)) %>%  
  mutate(Time = as.character(TIME),
         Time = gsub(":","",Time),
         Time = str_sub(Time,end = -3))
#
#
#### TripInfo ####
#
head(FID)
#
# Build the PKs and wrap everything in single quotes so that SQL can read it
TripTable <- data.frame(TripID = paste0("'",FID$ESTUARY,"SRVY_",FID$DATE,"_1","'"),
                       TripType = paste0("'","Survey","'"),
                       TripDate = paste0("'",ymd(FID$DATE),"'"),
                       DataStatus = paste0("'","Proofed","'"),
                       DateEntered = paste0("'",format(Proof_date,"%Y-%m-%d %H:%M:%OS3"),"'"),
                       EnteredBy =  paste0("'",Proofed_by,"'"),
                       DateProofed = paste0("'",format(Proof_date,"%Y-%m-%d %H:%M:%OS3"),"'"),
                       ProofedBy = paste0("'",Proofed_by,"'"))

#Check to make sure everything is in single quotes 
TripTable<- unique(TripTable)
#
#ADD TO BEGINNING OF CODE
#USE [Oysters]
#GO

# Create a template for the TripInfo SQL script 
TripInfoSQLtemplate <- "
INSERT INTO [dbo].[TripInfo]
           ([TripID]
           ,[TripType]
           ,[TripDate]
           ,[DataStatus]
           ,[DateEntered]
           ,[EnteredBy]
           ,[DateProofed]
           ,[ProofedBy])
     VALUES"
temp <- character(length(nrow(TripTable)))
for(i in 1:nrow(TripTable)){
  temp[i] <- paste0(TripInfoSQLtemplate, "\n      (",paste(TripTable[i,], collapse = "\n      ,"), ")\n GO")
}
Trip_SQL <- paste(temp, collapse = "\n\n")

# Save SQL code
write_lines(Trip_SQL, paste0("../", Site, "_", Station_code, "_", Survey_date,"_TripInfo.sql"))
#
#
#
#
#### SampleEvent ####
#
head(FID)
#
#
SampleEvent<- data.frame(SampleEventID = paste0("'",FID$Estuary,"SRVY_",FID$DATE,"_1_",Station_code,"_1","'"),
                         TripID= paste0("'",FID$Estuary,"SRVY_",FID$DATE,"_1","'"),
                         FixedLocationID = paste0("'",Station_code,"'"),
                         LatitudeDec = paste0("'",FID$LATITUDE,"'"),
                         LongitudeDec = paste0("'",FID$LONGITUDE,"'"),
                         DataStatus = paste0("'","Proofed","'"),
                         DateEntered = paste0("'",format(Proof_date, "%Y-%m-%d %H:%M:%OS3"),"'"),
                         EnteredBy =  paste0("'",Proofed_by,"'"),
                         DateProofed = paste0("'",format(Proof_date,"%Y-%m-%d %H:%M:%OS3"),"'"),
                         ProofedBy = paste0("'",Proofed_by,"'")) 
#
#
SampleEvent<- unique(SampleEvent)
#
# Create a template for the SampleEvent SQL script 
SampleEventtemplate<- "
INSERT INTO [dbo].[SampleEvent]
           ([SampleEventID]
           ,[TripID]
           ,[FixedLocationID]
           ,[LatitudeDec]
           ,[LongitudeDec]
           ,[DataStatus]
           ,[DateEntered]
           ,[EnteredBy]
           ,[DateProofed]
           ,[ProofedBy])
     VALUES"

temp <- character(length(nrow(SampleEvent)))
for(i in 1:nrow(SampleEvent)){
  temp[i] <- paste0(SampleEventtemplate, "\n      (",paste(SampleEvent[i,], collapse = "\n      ,"), ")\n GO")
}
SampleEvent_SQL <- paste(temp, collapse = "\n\n")

# Save SQL code
write_lines(SampleEvent_SQL, paste0("../", Site, "_", Station_code, "_", Survey_date,"_SampleEvent.sql"))
#
#
#
#
#