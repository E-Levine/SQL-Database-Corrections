#Original file located on network and as start for git file - working/in progress
#Updating for use in R project 
#Creates SQL code for: TripInfo, SampleEvent, SampleEventWQ, SurveyQuadrat, SurveySH
#BaywdieID/StaionName = Station in Quad&SH != WQ station

SiteCode <- "WC"
DataType <- "SRVY"
DataDate <- "2023"
Proof_date <- as.Date("2024-01-26")
Proofed_by <- "Tomena Scholze"

#### Set up ####
library(tidyverse)
library(lubridate) 
library(readxl)
library(glue)

# Read Excel files and check columns 
BSQ <- read_excel("../Data/WC_2023_Annual_Survey.xlsx", sheet = "Counts", skip = 0, .name_repair = "universal") 
BSWQ <- read_excel("../Data/WC_2023_Annual_Survey.xlsx", sheet = "WQ", skip = 0,  .name_repair = "universal")
BSSH <- read_excel("../Data/WC_2023_Annual_Survey.xlsx", sheet = "SHs", skip = 0, .name_repair = "universal")

head(BSWQ)


#### TripInfo ####
### Get data and create TripInfo table - use WQ since not all stations in Quad data
A2 <- BSWQ %>% rename(RunningStation = Station) %>%
  mutate(Date = format(Date, "%Y%m%d"),
         Station = sprintf("%04d", as.numeric(substr(BaywideID.StationName, 2, n()))),
         Estuary = SiteCode)

#Format date and station to build the necessary PKs
BSQ1 <- A2 %>% select(Date,Station,FixedLocationID)
BSQ2 <- unique(BSQ1)

#Build the PKs and wrap everything in single quotes so that SQL can read it
TripTable<- data.frame(TripID= paste0("'",A2$Estuary,"SRVY_",A2$Date,"_1","'"),
                   TripType= paste0("'","Survey","'"),
                   TripDate = paste0("'",ymd(A2$Date),"'"),
                   DataStatus = paste0("'","Proofed","'"),
                   DateEntered = paste0("'",format(Proof_date,"%Y-%m-%d %H:%M:%OS3"),"'"),
                   EnteredBy =  paste0("'",Proofed_by,"'"),
                   DateProofed = paste0("'",format(Proof_date,"%Y-%m-%d %H:%M:%OS3"),"'"),
                   ProofedBy = paste0("'",Proofed_by,"'"))

#Check to make sure everything is in single quotes 
TripTable<- unique(TripTable)

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
write_lines(Trip_SQL, paste0("../", SiteCode, "_", DataType, "_", DataDate,"TripInfo.sql"))
#
#
#
#### SampleEvent ####
### Get data and create SampleEvent table
#A2 created above:
#A2 <- BSWQ %>% mutate(Date= format(Date, "%Y%m%d"),
#                     Station= sprintf("%04d", Station))
head(A2)

SampleEvent<- data.frame(SampleEventID = paste0("'",A2$Estuary,"SRVY_",A2$Date,"_1_",A2$FixedLocationID,"_1","'"),
                 TripID= paste0("'",A2$Estuary,"SRVY_",A2$Date,"_1","'"),
                 FixedLocationID = paste0("'",A2$FixedLocationID,"'"),
                 LatitudeDec = paste0("'",A2$Latitude..DD.,"'"),
                 LongitudeDec = paste0("'",A2$Longitude..DD.,"'"),
                 DataStatus = paste0("'","Proofed","'"),
                 DateEntered = paste0("'",format(Proof_date, "%Y-%m-%d %H:%M:%OS3"),"'"),
                 EnteredBy =  paste0("'",Proofed_by,"'"),
                 DateProofed = paste0("'",format(Proof_date,"%Y-%m-%d %H:%M:%OS3"),"'"),
                 ProofedBy = paste0("'",Proofed_by,"'")) 


SampleEvent<- unique(SampleEvent)

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
write_lines(SampleEvent_SQL, paste0("../", SiteCode, "_", DataType, "_", DataDate,"SampleEevent.sql"))
#
#
#
#### SampleEventWQ ####
### Get data and create SampleEventWQ table
#Continue formatting WQ data 
A3 <- A2 %>% mutate(Temp..oC.= ifelse(Temp..oC.=="Z",NA, Temp..oC.),
                      Salinity..ppt.= ifelse(Salinity..ppt.=="Z",NA, Salinity..ppt.),
                      DO..mg.L.= ifelse(DO..mg.L.=="Z",NA, DO..mg.L.),
                      pH = ifelse(pH=="Z",NA, pH),
                      Depth..m.= ifelse(Depth..m.=="Z",NA, Depth..m.),
                      Turbidity..FNU.= ifelse(Turbidity..FNU.=="Z",NA, Turbidity..FNU.),
                      Time..hh.mm.= ifelse(Time..hh.mm.=="Z",NA, as.numeric(Time..hh.mm.)*86400),
                      Time..hh.mm.= format(as.POSIXct(Time..hh.mm., origin = "1970-01-01", tz = "UTC"), "%H%M"),#Time..hh.mm.= gsub(":", "", Time..hh.mm.),
                      Comments = gsub("'", "", Notes),
                      Comments = gsub(",","", Comments)) %>%
  #Create comments:
  rowwise() %>%
  mutate(Comments = {
    parts <- c()
    if (!is.na(Comments)) parts <- c(parts, paste("Notes =", Comments))
    if (!is.na(Depth.Strata)) parts <- c(parts, paste("DPTH_STRTA =", Depth.Strata))
    if (!is.na(Bottom.Type)) parts <- c(parts, paste("BOTTOM_TYP =", Bottom.Type))
    if (!is.na(Class)) parts <- c(parts, paste("Class =", Class))
    if (length(parts) == 0) NA else paste0("'", paste(parts, collapse = " "), "'")
  })



SampleEventWQ <- data.frame(SampleEventWQID = paste0("'",A3$Estuary,"SRVY_",A3$Date,"_1_",A3$FixedLocationID,"_1_01","'"),
                    SampleEventID = paste0("'",A3$Estuary,"SRVY_",A3$Date,"_1_",A3$FixedLocationID,"_1","'"),
                    Temperature =  ifelse(is.na(A3$Temp..oC.),"NULL",paste0("'",A3$Temp..oC.,"'")),
                    Salinity = ifelse(is.na(A3$Salinity..ppt.),"NULL",paste0("'",A3$Salinity..ppt.,"'")),
                    DissolvedOxygen = ifelse(is.na(A3$DO..mg.L.),"NULL",paste0("'",A3$DO..mg.L.,"'")),
                    pH = ifelse(is.na(A3$pH),"NULL",paste0("'",A3$pH,"'")),
                    Depth = ifelse(is.na(A3$Depth..m.),"NULL",paste0("'",A3$Depth..m.,"'")),
                    TurbidityYSI = ifelse(is.na(A3$Turbidity..FNU.),"NULL",paste0("'",A3$Turbidity..FNU.,"'")),
                    DataStatus = paste0("'","Proofed","'"),
                    DateEntered = paste0("'",format(Proof_date,"%Y-%m-%d %H:%M:%OS3"),"'"),
                    EnteredBy =  paste0("'",Proofed_by,"'"),
                    DateProofed = paste0("'",format(Proof_date,"%Y-%m-%d %H:%M:%OS3"),"'"),
                    ProofedBy = paste0("'",Proofed_by,"'"),
                    Comments = ifelse(is.na(A3$Comments), "NULL", paste0(A3$Comments)),
                    CollectionTime = ifelse(is.na(A3$Time..hh.mm.),"NULL",paste0("'",A3$Time..hh.mm.,"'")))

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



temp <- character(length(nrow(SampleEventWQ)))
for(i in 1:nrow(SampleEventWQ)){
  temp[i] <- paste0(SampleEventWQtemplate, "\n      (",paste(SampleEventWQ[i,], collapse = "\n      ,"), ")\n GO")
}
SampleEventWQ_SQL <- paste(temp, collapse = "\n\n")

# Save SQL code
write_lines(SampleEventWQ_SQL, paste0("../", SiteCode, "_", DataType, "_", DataDate,"SampleEeventWQ.sql"))
#
#
#
#### SurveyQuadrat ####
## Get data and create SurveyQuadrat table
#Every station needs at least one Quadrat record, even if no SH measured
A4 <- A3 %>% mutate(SampleEventID = paste0(Estuary,"SRVY_",Date,"_1_",FixedLocationID,"_1")) %>%
  dplyr::select(SampleEventID,Survey,Date,Estuary,Section,Class,Station,FixedLocationID)


B2 <- BSQ %>% mutate(Date = format(Date, "%Y%m%d"),
                     Quadrat = sprintf("%02d", Quadrat),
                     Station = sprintf("%04d", Station),
                     Estuary = SiteCode,
                     SampleEventID = paste0(SiteCode,"SRVY_",Date,"_1_",FixedLocationID,"_1")) 
 
B3 <- full_join(B2,
                A4, by= c("SampleEventID", "Date", "Estuary", "Station","FixedLocationID"))

B4 <- B3 %>% mutate(Quadrat = ifelse(is.na(Quadrat), "01", Quadrat),
                    Live_Count = ifelse(is.na(Live_Count), 0, Live_Count),
                    Dead_Count = ifelse(is.na(Dead_Count), 0, Dead_Count),
                    wt = ifelse(is.na(wt), 0, wt),
                    vol = ifelse(is.na(vol), 0, vol)) %>%
  #Compile comments and notes into one Comment
  rowwise() %>%
  mutate(Comments = {
    parts <- c()
    if (!is.na(Comments)) parts <- c(parts, paste("Notes =", Comments))
    if (!is.na(Conch)) parts <- c(parts, paste("Conch =", Conch))
    if (!is.na(Class)) parts <- c(parts, paste("Class =", Class))
    if (length(parts) == 0) NA else paste0("'", paste(parts, collapse = " "), "'")
  })

SurveyQuadrat <- data.frame(
  QuadratID = paste0("'",B4$Estuary,"SRVY_",B4$Date,"_1_",B4$FixedLocationID,"_1_",B4$Quadrat,"'"),
  SampleEventID = paste0("'",B4$Estuary,"SRVY_",B4$Date,"_1_",B4$FixedLocationID,"_1","'"),
  QuadratNumber = paste0("'",B4$Quadrat,"'"),
  NumLive= ifelse(is.na(B4$Live_Count),"NULL",paste0("'",B4$Live_Count,"'")),
  NumDead=ifelse(is.na(B4$Dead_Count),"NULL",paste0("'",B4$Dead_Count,"'")),
  TotalVolume = ifelse(is.na(B4$vol),"NULL",paste0("'",B4$vol,"'")),
  TotalWeight = ifelse(is.na(B4$wt),"NULL",paste0("'",B4$wt,"'")),
  NumDrills = ifelse(is.na(B4$Drills),"NULL",paste0("'",B4$Drills,"'")),
  DataStatus = paste0("'","Proofed","'"),
  DateEntered = paste0("'",format(Proof_date,"%Y-%m-%d %H:%M:%OS3"),"'"),
  EnteredBy =  paste0("'",Proofed_by,"'"),
  DateProofed = paste0("'",format(Proof_date,"%Y-%m-%d %H:%M:%OS3"),"'"),
  ProofedBy = paste0("'",Proofed_by,"'"),
  Comments = ifelse(is.na(B4$Comments), "NULL", paste0(B4$Comments))
  )



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
     VALUES"


temp <- character(length(nrow(SurveyQuadrat)))
for(i in 1:nrow(SurveyQuadrat)){
  temp[i] <- paste0(SurveyQuadrattemplate, "\n      (",paste(SurveyQuadrat[i,], collapse = "\n      ,"), ")\n GO")
}
SurveyQuadrat_SQL <- paste(temp, collapse = "\n\n")

# Save SQL code
write_lines(SurveyQuadrat_SQL, paste0("../", SiteCode, "_", DataType, "_", DataDate,"SurveyQuadrat.sql"))
#
#
#
#
#### SurveySH ####
#Every station needs at least one SH record, even if no SH measured
D2 <- BSSH %>% mutate(Date = format(Date, "%Y%m%d"),
                      Quadrat = sprintf("%02d", Quad),
                      Station = sprintf("%04d", Station),
                      SampleEventID = paste0(SiteCode,"SRVY_",Date,"_1_",FixedLocationID,"_1"))

D3 <- full_join(D2,
                A4, by= c("SampleEventID", "Date", "Station", "FixedLocationID"))

D4 <- D3 %>% mutate(Quadrat = ifelse(is.na(Quadrat),"01",Quadrat),
                    QuadratID = paste0(Estuary,"SRVY_",Date,"_1_",FixedLocationID,"_1_",Quadrat)) %>%
  #Create oyster number for SHID
  group_by(QuadratID) %>% 
  mutate(Qnum = sprintf("%02d", row_number()), Qnum = ifelse(Quadrat == "01", "01", Qnum)) %>% 
  ungroup() %>%
  #Compile comments and notes into one Comment
  rowwise() %>%
  mutate(Comments = {
    parts <- c()
    if (!is.na(Comments)) parts <- c(parts, paste("Notes =", Comments))
    if (!is.na(Class)) parts <- c(parts, paste("Class =", Class))
    if (length(parts) == 0) NA else paste0("'", paste(parts, collapse = " "), "'")
    })


SurveySH<- data.frame(
  ShellHeightID = paste0("'",D4$Estuary,"SRVY_",D4$Date,"_1_",D4$FixedLocationID,"_1_",D4$Quadrat,"_",D4$Qnum,"'"),
  QuadratID = paste0("'",D4$Estuary,"SRVY_",D4$Date,"_1_",D4$FixedLocationID,"_1_",D4$Quadrat,"'"),
  ShellHeight = ifelse(is.na(D4$SH),"NULL",paste0("'",D4$SH,"'")),
  DataStatus = paste0("'","Proofed","'"),
  DateEntered = paste0("'",format(Proof_date,"%Y-%m-%d %H:%M:%OS3"),"'"),
  EnteredBy =  paste0("'",Proofed_by,"'"),
  DateProofed = paste0("'",format(Proof_date,"%Y-%m-%d %H:%M:%OS3"),"'"),
  ProofedBy = paste0("'",Proofed_by,"'"),
  Comments = ifelse(is.na(D4$Comments), "NULL", paste0(D4$Comments))
  )


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


temp <- character(length(nrow(SurveySH)))
for(i in 1:nrow(SurveySH)){
  temp[i] <- paste0(SurveySHtemplate, "\n      (",paste(SurveySH[i,], collapse = "\n      ,"), ")\n GO")
}
SurveySH_SQL <- paste(temp, collapse = "\n\n")

# Save SQL code
write_lines(SurveySH_SQL, paste0("../", SiteCode, "_", DataType, "_", DataDate,"SurveySH.sql"))
#