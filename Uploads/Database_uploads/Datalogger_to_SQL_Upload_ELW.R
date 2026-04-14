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
  mutate(Date = gsub("-", "", DATE),
    Time = as.character(TIME),
         Time = gsub(":","",Time),
         Time = str_sub(Time,end = -3))
#
LongName <- (FLIDS %>% filter(Estuary == as.character(FID$ESTUARY)) %>% slice(1))$EstuaryLongName
#
FLTab <- data.frame(
  FixedLocationID = paste0("'",Station_code,"'"),
  Estuary = paste0("'",FID$ESTUARY,"'"),
  SectionName = paste0("'",FID$SECTION,"'"),
  StationName = paste0("'",FID$STATION,"'"),
  StationNumber = paste0("'",substr(FID$STATION,3,nchar(as.character(FID$STATION))),"'"),
  LatitudeDec = paste0("'",FID$LATITUDE,"'"),
  LongitudeDec = paste0("'",FID$LONGITUDE,"'"),
  Recruitment = paste0("'","N","'"),
  Survey = paste0("'","Y","'"),
  Sediment = paste0("'","N","'"),
  Collections = paste0("'","N","'"),
  ShellBudget = paste0("'","N","'"),
  Dataloggers = paste0("'","N","'"),
  Cage = paste0("'","N","'"),
  Wave = paste0("'","N","'"),
  StartDate = paste0("'",FID$DATE,"'"),
  EndDate = paste0("'",FID$DATE,"'"),
  DataStatus = paste0("'","Proofed","'"),
  DateEntered = paste0("'",format(Proof_date,"%Y-%m-%d %H:%M:%OS3"),"'"),
  EnteredBy =  paste0("'",Proofed_by,"'"),
  DateProofed = paste0("'",format(Proof_date,"%Y-%m-%d %H:%M:%OS3"),"'"),
  ProofedBy = paste0("'",Proofed_by,"'"),
  Comments = ifelse(is.na(FID$NOTES), "NULL", paste0(FID$NOTES)),
  StationNameNumber = paste0("'",FID$STATION,"-",substr(FID$STATION,3,nchar(as.character(FID$STATION))),"'"),
  EstuaryLongName = paste0("'",LongName,"'")
)
#
#Check to make sure everything is in single quotes 
FLTab<- unique(FLTab)
#
#ADD TO BEGINNING OF CODE
#USE [Oysters]
#GO

# Create a template for the TripInfo SQL script 
FLIDSQLtemplate <- "
INSERT INTO [dbo].[FixedLocations]
           ([FixedLocationID]
           ,[Estuary]
           ,[SectionName]
           ,[StationName]
           ,[StationNumber]
           ,[LatitudeDec]
           ,[LongitudeDec]
           ,[Recruitment]
           ,[Survey]
           ,[Sediment]
           ,[Collections]
           ,[ShellBudget]
           ,[Dataloggers]
           ,[Cage]
           ,[Wave]
           ,[StartDate]
           ,[EndDate]
           ,[DataStatus]
           ,[DateEntered]
           ,[EnteredBy]
           ,[DateProofed]
           ,[ProofedBy]
           ,[Comments]
           ,[StationNameNumber]
           ,[EstuaryLongName])
VALUES"
temp <- character(length(nrow(FLTab)))
for(i in 1:nrow(FLTab)){
  temp[i] <- paste0(FLIDSQLtemplate, "\n      (",paste(FLTab[i,], collapse = "\n      ,"), ")\n GO")
}
FLID_SQL <- paste(temp, collapse = "\n\n")

# Save SQL code
write_lines(FLID_SQL, paste0("../", Site, "_", Station_code, "_FixedLocations.sql"))
#
#
#
#
#### TripInfo ####
#
head(FID)
#
# Build the PKs and wrap everything in single quotes so that SQL can read it
TripTable <- data.frame(TripID = paste0("'",FID$ESTUARY,"SRVY_",FID$Date,"_1","'"),
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
SampleEvent<- data.frame(SampleEventID = paste0("'",FID$Estuary,"SRVY_",FID$Date,"_1_",Station_code,"_1","'"),
                         TripID= paste0("'",FID$Estuary,"SRVY_",FID$Date,"_1","'"),
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
#### SampleEventWQ ####
#
SEWQ <- FID %>% 
  mutate(TEMP= ifelse(TEMP == "Z", NA, TEMP),
         SALINITY= ifelse(SALINITY == "Z", NA, SALINITY),
         DO= ifelse(DO == "Z", NA, DO),
         PH = ifelse(PH == "Z", NA, PH),
         DEPTH = ifelse(DEPTH == "Z", NA, DEPTH),
         TURBIDITY = ifelse(TURBIDITY == "Z", NA, TURBIDITY),
         TIME = ifelse(TIME == "Z", NA, as.numeric(TIME)*86400),
         TIME= format(as.POSIXct(TIME, origin = "1970-01-01", tz = "UTC"), "%H%M"),#Time..hh.mm.= gsub(":", "", Time..hh.mm.),
         Comments = gsub("'", "", NOTES),
         Comments = gsub(",","", Comments)) %>%
  #Create comments:
  rowwise() %>%
  mutate(Comments = {
    parts <- c()
    if (!is.na(Comments)) parts <- c(parts, paste("Notes =", Comments))
    if (!is.na(DPTH_STRTA)) parts <- c(parts, paste("DPTH_STRTA =", DPTH_STRTA))
    if (!is.na(BOTTOM_TYP)) parts <- c(parts, paste("BOTTOM_TYP =", BOTTOM_TYP))
    if (!is.na(CLASS)) parts <- c(parts, paste("Class =", CLASS))
    if (length(parts) == 0) NA else paste0("'", paste(parts, collapse = " "), "'")
  })



SampleEventWQ <- data.frame(SampleEventWQID = paste0("'",SEWQ$ESTUARY,"SRVY_",SEWQ$Date,"_1_",Station_code,"_1_01","'"),
                            SampleEventID = paste0("'",SEWQ$ESTUARY,"SRVY_",SEWQ$Date,"_1_",Station_code,"_1","'"),
                            Temperature =  ifelse(is.na(SEWQ$TEMP),"NULL",paste0("'",SEWQ$TEMP,"'")),
                            Salinity = ifelse(is.na(SEWQ$SALINITY),"NULL",paste0("'",SEWQ$SALINITY,"'")),
                            DissolvedOxygen = ifelse(is.na(SEWQ$DO),"NULL",paste0("'",SEWQ$DO,"'")),
                            pH = ifelse(is.na(SEWQ$PH),"NULL",paste0("'",SEWQ$PH,"'")),
                            Depth = ifelse(is.na(SEWQ$DEPTH),"NULL",paste0("'",SEWQ$DEPTH,"'")),
                            TurbidityYSI = ifelse(is.na(SEWQ$TURBIDITY),"NULL",paste0("'",SEWQ$TURBIDITY,"'")),
                            DataStatus = paste0("'","Proofed","'"),
                            DateEntered = paste0("'",format(Proof_date,"%Y-%m-%d %H:%M:%OS3"),"'"),
                            EnteredBy =  paste0("'",Proofed_by,"'"),
                            DateProofed = paste0("'",format(Proof_date,"%Y-%m-%d %H:%M:%OS3"),"'"),
                            ProofedBy = paste0("'",Proofed_by,"'"),
                            Comments = ifelse(is.na(SEWQ$Comments), "NULL", paste0(SEWQ$Comments)),
                            CollectionTime = ifelse(is.na(SEWQ$Time),"NULL",paste0("'",SEWQ$Time,"'")))
#
#
SampleEventWQtemplate<- "
INSERT INTO [dbo].[SampleEventWQ]
           ([SampleEventWQID]
           ,[SampleEventID]
           ,[Temperature]
           ,[Salinity]
           ,[DissolvedOxygen]
           ,[pH]
           ,[Depth]
           ,[TurbidityYSI]
           ,[DataStatus]
           ,[DateEntered]
           ,[EnteredBy]
           ,[DateProofed]
           ,[ProofedBy]
           ,[Comments]
           ,[CollectionTime])
     VALUES"
#
temp <- character(length(nrow(SampleEventWQ)))
for(i in 1:nrow(SampleEventWQ)){
  temp[i] <- paste0(SampleEventWQtemplate, "\n      (",paste(SampleEventWQ[i,], collapse = "\n      ,"), ")\n GO")
}
SampleEventWQ_SQL <- paste(temp, collapse = "\n\n")
#
# Save SQL code
write_lines(SampleEventWQ_SQL, paste0("../", Site, "_", Station_code, "_", Survey_date,"_SampleEventWQ.sql"))
#
#
#
#### SurveyQuadrat ####
#
#
QuadCounts <- list.files(path = data_path, 
                        pattern = "\\Data.dbf$", 
                        full.names = TRUE) %>%
  setNames(nm = basename(.)) %>%
  map(read.dbf) %>%
  bind_rows(.id = "FileName")
#
QuadInfo <- list.files(path = data_path, 
                         pattern = "Quadrat", 
                         full.names = TRUE) %>%
  setNames(nm = basename(.)) %>%
  map(read.dbf) %>%
  bind_rows(.id = "FileName")
#
QuadData <- full_join(QuadInfo %>% dplyr::select(-FileName), 
                      QuadCounts %>% dplyr::select(-FileName))
#
# NOTE: Every station needs at least one Quadrat record, even if no SH measured
Quads <- QuadData %>% 
  left_join(FID %>% dplyr::select(KEY_A, Date, ESTUARY, STATION, CLASS, Notes = NOTES)) %>%
  mutate(SampleEventID = paste0(ESTUARY, "SRVY_", Date, "_1_", Station_code, "_1"),
         Quadrat = ifelse(is.na(QDRT), "01", sprintf("%02d", QDRT))) %>%
  #Compile comments and notes into one Comment
  rowwise() %>%
  mutate(Comments = {
    parts <- c()
    if (any(!is.na(c(NOTES, Notes)))) parts <- c(parts, paste("Notes =", paste(na.omit(c(NOTES, Notes)), collapse = "; ")))
    if (!is.na(CC)) parts <- c(parts, paste("Conch =", CC))
    if (!is.na(CLASS)) parts <- c(parts, paste("Class =", CLASS))
    if (length(parts) == 0) NA else paste0("'", paste(parts, collapse = " "), "'")
  })

SurveyQuadrat <- data.frame(
  QuadratID = paste0("'",Quads$SampleEventID,"_",Quads$Quadrat,"'"),
  SampleEventID = paste0("'",Quads$SampleEventID,"'"),
  QuadratNumber = paste0("'",Quads$QDRT,"'"),
  NumLive= ifelse(is.na(Quads$LIVE),"NULL",paste0("'",Quads$LIVE,"'")),
  NumDead=ifelse(is.na(Quads$DEAD),"NULL",paste0("'",Quads$DEAD,"'")),
  TotalVolume = ifelse(is.na(Quads$VOL),"NULL",paste0("'",Quads$VOL,"'")),
  TotalWeight = ifelse(is.na(Quads$WGHT),"NULL",paste0("'",Quads$WGHT,"'")),
  NumDrills = ifelse(is.na(Quads$DRILLS),"NULL",paste0("'",Quads$DRILLS,"'")),
  DataStatus = paste0("'","Proofed","'"),
  DateEntered = paste0("'",format(Proof_date,"%Y-%m-%d %H:%M:%OS3"),"'"),
  EnteredBy =  paste0("'",Proofed_by,"'"),
  DateProofed = paste0("'",format(Proof_date,"%Y-%m-%d %H:%M:%OS3"),"'"),
  ProofedBy = paste0("'",Proofed_by,"'"),
  Comments = ifelse(is.na(Quads$Comments), "NULL", paste0(Quads$Comments)),
  NumLegal = ifelse(is.na(Quads$LEGAL),"NULL",paste0("'",Quads$LEGAL,"'"))
)
#
#
SurveyQuadrattemplate<- "
INSERT INTO [dbo].[SurveyQuadrat]
           ([QuadratID]
           ,[SampleEventID]
           ,[QuadratNumber]
           ,[NumLive]
           ,[NumDead]
           ,[TotalVolume]
           ,[TotalWeight]
           ,[NumDrills]
           ,[DataStatus]
           ,[DateEntered]
           ,[EnteredBy]
           ,[DateProofed]
           ,[ProofedBy]
           ,[Comments])
           ,[NumLegal]
     VALUES"
#
temp <- character(length(nrow(SurveyQuadrat)))
for(i in 1:nrow(SurveyQuadrat)){
  temp[i] <- paste0(SurveyQuadrattemplate, "\n      (",paste(SurveyQuadrat[i,], collapse = "\n      ,"), ")\n GO")
}
SurveyQuadrat_SQL <- paste(temp, collapse = "\n\n")
#
# Save SQL code
write_lines(SurveyQuadrat_SQL, paste0("../", Site, "_", Station_code, "_", Survey_date,"_SurveyQuadrat.sql"))
#
#
#
#
#
#### SurveySH ####
#
#
ShellHeights <- list.files(path = data_path, 
                         pattern = "\\Shell_Height.dbf$", 
                         full.names = TRUE) %>%
  setNames(nm = basename(.)) %>%
  map(read.dbf) %>%
  bind_rows(.id = "FileName")
#
#
# Every station needs at least one SH record, even if no SH measured
SHData <- ShellHeights %>%
  left_join(FID %>% dplyr::select(KEY_A, Date, ESTUARY)) %>%
  mutate(Quadrat = sprintf("%02d", QDRT),
         QuadratID = paste0(ESTUARY,"SRVY_",Date,"_1_",Station_code,"_1_",Quadrat),
         SHnum = sprintf("%02d", OYSTER_NUM))
#
#
SurveySH <- data.frame(
  ShellHeightID = paste0("'",SHData$QuadratID,"_",SHData$SHnum,"'"),
  QuadratID = paste0("'",SHData$QuadratID,"'"),
  ShellHeight = ifelse(is.na(SHData$SH),"NULL",paste0("'",SHData$SH,"'")),
  DataStatus = paste0("'","Proofed","'"),
  DateEntered = paste0("'",format(Proof_date,"%Y-%m-%d %H:%M:%OS3"),"'"),
  EnteredBy =  paste0("'",Proofed_by,"'"),
  DateProofed = paste0("'",format(Proof_date,"%Y-%m-%d %H:%M:%OS3"),"'"),
  ProofedBy = paste0("'",Proofed_by,"'"),
  Comments = "NULL"
)
#
SurveySHtemplate<- "INSERT INTO [dbo].[SurveySH]
           ([ShellHeightID]
           ,[QuadratID]
           ,[ShellHeight]
           ,[DataStatus]
           ,[DateEntered]
           ,[EnteredBy]
           ,[DateProofed]
           ,[ProofedBy]
           ,[Comments])
     VALUES"
#
temp <- character(length(nrow(SurveySH)))
for(i in 1:nrow(SurveySH)){
  temp[i] <- paste0(SurveySHtemplate, "\n      (",paste(SurveySH[i,], collapse = "\n      ,"), ")\n GO")
}
SurveySH_SQL <- paste(temp, collapse = "\n\n")
#
# Save SQL code
write_lines(SurveySH_SQL, paste0("../",Site, "_", Station_code, "_", Survey_date,"_SurveySH.sql"))
#
#
#