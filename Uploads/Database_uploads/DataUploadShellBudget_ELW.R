#Original file located on network and as start for git file - working/in progress
#Updating for use in R project 

SiteCode <- "SS"
DataType <- "SHBG"
DataDate <- "2023"
Proof_date <- as.Date("2023-11-22")
Proofed_by <- "Gabe Hopkins"

#### Set up ####
library(tidyverse)
library(lubridate) 
library(readxl)
library(glue)
#
# Read Excel files and check columns 
file_name <- "SS_SemiAnnual_ShellBudget_2023Summer"
WQ_file_name <- "SS_SemiAnnual_ShellBudget_WQ"
#
FLIDS <- read_excel("../Data/FIxedLocations.xlsx", sheet = "Sheet1", skip = 0, .name_repair = "universal") 
BSQ <- read_excel(paste0("../Data/Datalogger/",file_name,".xlsx"), sheet = "Vols, Wts, Counts", skip = 3, .name_repair = "universal") %>% 
  drop_na(Date.Collected)
BSWQ <- read_excel(paste0("../Data/Datalogger/",WQ_file_name,".xlsx"), sheet = "WQ", skip = 4,  .name_repair = "unique")
BSSH <- read_excel(paste0("../Data/Datalogger/",file_name,".xlsx"), sheet = "SHs", skip = 3, .name_repair = "universal")
#
#
#### Trip Info####
#
#Clean date, station, and Estuary in quadrat data
A2<- BSQ %>% 
  #Remove datalogger rows
  filter(str_to_lower(Comments) != "entered in datalogger") %>%
  rename(Station_Name = Station) %>%
  #Add FID
  mutate(
    station_key = Station_Name %>%
      str_to_lower() %>%
      str_replace_all("[^a-z0-9]", "")) %>%
  left_join(
    FLIDS %>%
      mutate(
        station_key = StationName %>%
          str_to_lower() %>%
          str_replace_all("[^a-z0-9]", "")
      ) %>%
      select(station_key, FixedLocationID),
    by = "station_key"
  ) %>%
  mutate(
    Date = format(Date.Collected, "%Y%m%d"),
    Estuary = SiteCode)
#
#
#Build the PKs and wrap everything in single quotes so that SQL can read it
TripTable<- data.frame(TripID= paste0("'",A2$Estuary,"SHBG_",A2$Date,"_1","'"),
                       TripType= paste0("'","Shell Budget","'"),
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
#
# Save SQL code
write_lines(Trip_SQL, paste0("../", SiteCode, "_", DataType, "_", DataDate,"TripInfo.sql"))
#
#
#
#
#### Sample Event ####
### Get data and create SampleEvent table
#A2 created above. Using WQ to get Lat, Long
#Clean date, station, and Estuary in quadrat data
A3<- BSWQ %>% 
  rename(Station_Name = Station) %>%
  #Add FID
  mutate(
    station_key = Station_Name %>%
      str_to_lower() %>%
      str_replace_all("[^a-z0-9]", "")) %>%
  left_join(
    FLIDS %>%
      mutate(
        station_key = StationName %>%
          str_to_lower() %>%
          str_replace_all("[^a-z0-9]", "")
      ) %>%
      select(station_key, FixedLocationID),
    by = "station_key"
  ) %>%
  mutate(
    Date = format(Date, "%Y%m%d"),
    Estuary = SiteCode) %>%
  #Filter to dates that match survey data
  filter(Date %in% A2$Date)
#
SampleEvent<- data.frame(SampleEventID = paste0("'",A3$Estuary,"SHBG_",A3$Date,"_1_",A3$FixedLocationID,"_1","'"),
                         TripID= paste0("'",A3$Estuary,"SHBG_",A3$Date,"_1","'"),
                         FixedLocationID = paste0("'",A3$FixedLocationID,"'"),
                         LatitudeDec = ifelse(is.na(A3$Lat),"NULL",paste0("'",A3$Lat,"'")),
                         LongitudeDec = ifelse(is.na(A3$Lon),"NULL",paste0("'",A3$Lon,"'")),
                         DataStatus = paste0("'","Proofed","'"),
                         DateEntered = paste0("'",format(Proof_date, "%Y-%m-%d %H:%M:%OS3"),"'"),
                         EnteredBy =  paste0("'",Proofed_by,"'"),
                         DateProofed = paste0("'",format(Proof_date,"%Y-%m-%d %H:%M:%OS3"),"'"),
                         ProofedBy = paste0("'",Proofed_by,"'")) 
#
SampleEvent<- unique(SampleEvent)
#
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
#
#Working with A3 created above:
head(A3)
#
A4 <- A3 %>% 
  rename_with(~ str_replace_all(.x, "[^A-Za-z0-9]", "")) %>%
mutate(TemperatureC= ifelse(TemperatureC == "Z",NA, TemperatureC),
       Salinity= ifelse(Salinity == "Z",NA,
                        ifelse(Salinity == "N", 0, Salinity)),
       DissolvedOxygenmgL = ifelse(DissolvedOxygenmgL == "Z",NA,
                                   ifelse(DissolvedOxygenmgL == "N", 0, DissolvedOxygenmgL)),
       pH = ifelse(pH == "Z",NA, pH),
       SampleDepthm = ifelse(SampleDepthm=="Z",NA, SampleDepthm),
       TurbidityFNU = ifelse(TurbidityFNU=="Z",NA, TurbidityFNU),
       Comments = NA)


SampleEventWQ <- data.frame(SampleEventWQID = paste0("'",A4$Estuary,"SHBG_",A4$Date,"_1_",A4$FixedLocationID,"_1_01","'"),
                            SampleEventID = paste0("'",A4$Estuary,"SHBG_",A4$Date,"_1_",A4$FixedLocationID,"_1","'"),
                            Temperature =  ifelse(is.na(A4$TemperatureC),"NULL",paste0("'",A4$TemperatureC,"'")),
                            Salinity = ifelse(is.na(A4$Salinity),"NULL",paste0("'",A4$Salinity,"'")),
                            DissolvedOxygen = ifelse(is.na(A4$DissolvedOxygenmgL),"NULL",paste0("'",A4$DissolvedOxygenmgL,"'")),
                            pH = ifelse(is.na(A4$pH),"NULL",paste0("'",A4$pH,"'")),
                            Depth = ifelse(is.na(A4$SampleDepthm),"NULL",paste0("'",A4$SampleDepthm,"'")),
                            TurbidityYSI = ifelse(is.na(A4$TurbidityFNU),"NULL",paste0("'",A4$TurbidityFNU,"'")),
                            DataStatus = paste0("'","Proofed","'"),
                            DateEntered = paste0("'",format(Proof_date,"%Y-%m-%d %H:%M:%OS3"),"'"),
                            EnteredBy =  paste0("'",Proofed_by,"'"),
                            DateProofed = paste0("'",format(Proof_date,"%Y-%m-%d %H:%M:%OS3"),"'"),
                            ProofedBy = paste0("'",Proofed_by,"'"),
                            Comments = paste0("'",paste("Notes =", A4$Comments," NumQuads =",
                                                        A4$ofQuadrats,"'")),
                            CollectionTime = "NULL")

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
           ,[Comments])
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
#### ShellBudgetQuadrat ####
#
#Working with A4 from above:
head(A4)
A5 <- A4 %>% 
  mutate(SampleEventID = paste0(Estuary,"SHBG_",Date,"_1_",FixedLocationID,"_1")) %>%
  dplyr::select(SampleEventID,
                Survey,
                Date,
                Estuary,
                Section,
                StationName,
                FixedLocationID)

B2 <- A2 %>% 
  mutate(Quadrat = sprintf("%02d", Quadrat..1.4.m2.),
         StationName = Station_Name,
         SampleEventID = paste0(Estuary,"SHBG_",Date,"_1_",FixedLocationID,"_1")) 

B3 <- left_join(B2, 
                A5, 
                by= c("SampleEventID","Survey","Date","Estuary","Section","StationName","FixedLocationID"))

B3 <- B3 %>% mutate(Quadrat= ifelse(is.na(Quadrat),"01",Quadrat),
                    TotalSampleVolume = ifelse(Total.Sample.Vol..L. == "Z", NA,
                                               ifelse(Total.Sample.Vol..L. == "N", 0.04 , Total.Sample.Vol..L.)),
                    TotalSampleWeight = ifelse(trimws(Total.Sample.Wt..kg.) == "Z", NA,
                                               ifelse(trimws(Total.Sample.Wt..kg.) == "N", 0.01, Total.Sample.Wt..kg.)),
                    LiveOysterVolume = ifelse(Live.Oyster.Volume..L. == "Z", NA,
                                              ifelse(Live.Oyster.Volume..L. == "N", 0.04 , Live.Oyster.Volume..L.)),
                    LiveOysterWeight = ifelse(trimws(Live.Oyster.Weight..kg.) == "Z", NA,
                                              ifelse(trimws(Live.Oyster.Weight..kg.) == "N", 0.01 , Live.Oyster.Weight..kg.)),
                    DrillWeight = ifelse(Drill.Weight..kg. == "Z", NA,
                                         ifelse(Drill.Weight..kg. == "N", 0.01 , Drill.Weight..kg.)),
                    Crown.Conch.Wt..kg.= ifelse(Crown.Conch.Wt..kg. == "Z", NA,
                                          ifelse(Crown.Conch.Wt..kg. == "N", 0.01 , Crown.Conch.Wt..kg.)),
                    OtherBiotaWeight = ifelse(Other.Biota.Weight..kg. == "Z", NA,
                                              ifelse(Other.Biota.Weight..kg. == "N", 0.01 , Other.Biota.Weight..kg.)),
                    OysterShellVolume = ifelse(Oyster.Shell.Volume..L. == "Z", NA,
                                               ifelse(Oyster.Shell.Volume..L. == "N", 0.04 , Oyster.Shell.Volume..L.)),
                    OysterShellWeight = ifelse(Oyster.Shell.Weight..kg. == "Z", NA,
                                               ifelse(Oyster.Shell.Weight..kg. == "N", 0.01 , Oyster.Shell.Weight..kg.)),
                    PlantedShellVolume = ifelse(Planted.Shell.Volume..L. == "Z", NA,
                                                ifelse(Planted.Shell.Volume..L. == "N", 0.04 , Planted.Shell.Volume..L.)),
                    PlantedShellWeight = ifelse(Planted.Shell.Weight..kg. == "Z", NA,
                                                ifelse(Planted.Shell.Weight..kg. == "N", 0.01 , Planted.Shell.Weight..kg.)),
                    ShellHashVolume = ifelse(Shell.Hash.Volume..L. == "Z", NA,
                                             ifelse(Shell.Hash.Volume..L. == "N", 0.04 , Shell.Hash.Volume..L.)),
                    ShellHashWeight = ifelse(Shell.Hash.Weight..kg. == "Z", NA,
                                             ifelse(Shell.Hash.Weight..kg. == "N", 0.01 , Shell.Hash.Weight..kg.)),
                    BlackAndOtherSubstrateVolume = ifelse(Black.and.Other.Substrate.Volume..L. == "Z", NA,
                                                          ifelse(Black.and.Other.Substrate.Volume..L. == "N", 0.04 , Black.and.Other.Substrate.Volume..L.)),
                    BlackAndOtherSubstrateWeight = ifelse(Black.and.Other.Substrate.Weight..kg. == "Z", NA,
                                                          ifelse(Black.and.Other.Substrate.Weight..kg. == "N", 0.01 , Black.and.Other.Substrate.Weight..kg.))
                    )

ShellBudgetQuadrat<- data.frame(QuadratID = paste0("'",B3$SampleEventID,"_",B3$Quadrat,"'"),
                           SampleEventID = paste0("'",B3$SampleEventID,"'"),
                           QuadratNumber = paste0("'",B3$Quadrat,"'"),
                           TotalSampleVolume= ifelse(is.na(B3$TotalSampleVolume),"NULL",paste0("'",B3$TotalSampleVolume,"'")),
                           TotalSampleWeight= ifelse(is.na(B3$TotalSampleWeight),"NULL",paste0("'",B3$TotalSampleWeight,"'")),
                           LiveOysterVolume= ifelse(is.na(B3$LiveOysterVolume),"NULL",paste0("'",B3$LiveOysterVolume,"'")),
                           LiveOysterWeight= ifelse(is.na(B3$LiveOysterWeight),"NULL",paste0("'",B3$LiveOysterWeight,"'")),
                           NumDrills = ifelse(is.na(B3$..Drills),"NULL",paste0("'",B3$..Drills,"'")),
                           DrillWeight = ifelse(is.na(B3$DrillWeight),"NULL",paste0("'",B3$DrillWeight,"'")),
                           OtherBiotaWeight = ifelse(is.na(B3$OtherBiotaWeight),"NULL",paste0("'",B3$OtherBiotaWeight,"'")),
                           NumLiveOysters= ifelse(is.na(B3$Total...Live.Oysters),"NULL",paste0("'",B3$Total...Live.Oysters,"'")),
                           NumDeadOysters= ifelse(is.na(B3$Total...Dead.Oysters),"NULL",paste0("'",B3$Total...Dead.Oysters,"'")),
                           OysterShellVolume= ifelse(is.na(B3$OysterShellVolume),"NULL",paste0("'",B3$OysterShellVolume,"'")),
                           OysterShellWeight= ifelse(is.na(B3$OysterShellWeight),"NULL",paste0("'",B3$OysterShellWeight,"'")),
                           PlantedShellVolume= ifelse(is.na(B3$PlantedShellVolume),"NULL",paste0("'",B3$PlantedShellVolume,"'")),
                           PlantedShellWeight= ifelse(is.na(B3$PlantedShellWeight),"NULL",paste0("'",B3$PlantedShellWeight,"'")),
                           ShellHashVolume= ifelse(is.na(B3$ShellHashVolume),"NULL",paste0("'",B3$ShellHashVolume,"'")),
                           ShellHashWeight= ifelse(is.na(B3$ShellHashWeight),"NULL",paste0("'",B3$ShellHashWeight,"'")),
                           BlackAndOtherSubstrateVolume= ifelse(is.na(B3$BlackAndOtherSubstrateVolume),"NULL",paste0("'",B3$BlackAndOtherSubstrateVolume,"'")),
                           BlackAndOtherSubstrateWeight= ifelse(is.na(B3$BlackAndOtherSubstrateWeight),"NULL",paste0("'",B3$BlackAndOtherSubstrateWeight,"'")),
                           DataStatus = paste0("'","Proofed","'"),
                           DateEntered = paste0("'",format(Proof_date,"%Y-%m-%d %H:%M:%OS3"),"'"),
                           EnteredBy =  paste0("'",Proofed_by,"'"),
                           DateProofed = paste0("'",format(Proof_date,"%Y-%m-%d %H:%M:%OS3"),"'"),
                           ProofedBy = paste0("'",Proofed_by,"'"),
                           Comments = paste0("'",paste("Notes =", B3$Comments),
                                             paste(" CrownConchNumber =",
                                                   B3$..Crown.Conch),
                                             paste(" CrownConchWt =",
                                                   B3$Crown.Conch.Wt..kg.),"'"))




ShellBudgetQuadrattemplate<- "
INSERT INTO [dbo].[ShellBudgetQuadrat]
           ([QuadratID]
           ,[SampleEventID]
           ,[QuadratNumber]
           ,[TotalSampleVolume]
           ,[TotalSampleWeight]
           ,[LiveOysterVolume]
           ,[LiveOysterWeight]
           ,[NumDrills]
           ,[DrillWeight]
           ,[OtherBiotaWeight]
           ,[NumLiveOysters]
           ,[NumDeadOysters]
           ,[OysterShellVolume]
           ,[OysterShellWeight]
           ,[PlantedShellVolume]
           ,[PlantedShellWeight]
           ,[ShellHashVolume]
           ,[ShellHashWeight]
           ,[BlackAndOtherSubstrateVolume]
           ,[BlackAndOtherSubstrateWeight]
           ,[DataStatus]
           ,[DateEntered]
           ,[EnteredBy]
           ,[DateProofed]
           ,[ProofedBy]
           ,[Comments])
     VALUES"

temp <- character(length(nrow(ShellBudgetQuadrat)))
for(i in 1:nrow(ShellBudgetQuadrat)){
  temp[i] <- paste0(ShellBudgetQuadrattemplate, "\n      (",paste(ShellBudgetQuadrat[i,], collapse = "\n      ,"), ")\n GO")
}
ShellBudgetQuadrat_SQL <- paste(temp, collapse = "\n\n")

# Save SQL code
write_lines(ShellBudgetQuadrat_SQL, paste0("../", SiteCode, "_", DataType, "_", DataDate,"ShellBudgetQuadrat.sql"))
#
#
#
#
####
#D4<- bind_rows(D1,D2,D3)
D2<- BSSH %>%  mutate(Date= format(mdy(Date.Collected), "%Y%m%d"),
                      Quadrat= sprintf("%02d", Quadrat..1.4.m2.),
                      Estuary = "SS",
                      Station= sprintf("%04d", Station),
                      SampleEventID= paste0(Estuary,"SHBG_",Date,"_1_",FixedLocationID,"_1")) 

D1<- left_join(D2,A3, by= c("SampleEventID","Survey","Date","Estuary","Section","Station","FixedLocationID"))

D2<- D1 %>% mutate(Quadrat= ifelse(is.na(Quadrat),"00",Quadrat),
                   QuadratID=paste0(D2$Estuary,"SHBG_",D2$Date,"_1_",D2$FixedLocationID,"_1_",D2$Quadrat),
                   SH..mm.= ifelse(SH..mm.== "Z",NA, SH..mm.))%>%
  group_by(QuadratID) %>% mutate(Qnum= sprintf("%02d", row_number()), Qnum= ifelse(Quadrat== "00", "00", Qnum)) %>% ungroup()


# D1<- D %>% mutate(Station= sprintf("%04d", STATION), 
#                    Quadrat= sprintf("%02d", QDRT),
#                    ShellNumber= sprintf("%03d",OYSTER_NUM))
# 
# D2<- left_join(D1,B3, by= c("Station", "FileName","STATION","QDRT","Quadrat"))

SBSH<- data.frame(ShellHeightID = paste0("'",D2$QuadratID,"_",D2$Qnum,"'"),
                      QuadratID = paste0("'",D2$QuadratID,"'"),
                      LiveOrDead = ifelse(is.na(D2$Live.or.Dead),"NULL",paste0("'",D2$Live.or.Dead,"'")),
                      ShellHeight = ifelse(is.na(D2$SH..mm.),"NULL",paste0("'",D2$SH..mm.,"'")),
                      DataStatus = paste0("'","Proofed","'"),
                      DateEntered = paste0("'",format(Sys.time(),"%Y-%m-%d %H:%M:%OS3"),"'"),
                      EnteredBy =  paste0("'","Berlynna Heres","'"),
                      DateProofed = paste0("'",format(Sys.time(),"%Y-%m-%d %H:%M:%OS3"),"'"),
                      ProofedBy = paste0("'","Berlynna Heres","'"))


SBSHtemplate<- "INSERT INTO [dbo].[ShellBudgetSH]
           ([ShellHeightID]
           ,[QuadratID]
           ,[LiveOrDead]
           ,[ShellHeight]
           ,[DataStatus]
           ,[DateEntered]
           ,[EnteredBy]
           ,[DateProofed]
           ,[ProofedBy])
     VALUES
           ({ShellHeightID}
           ,{QuadratID}
           ,{LiveOrDead}
           ,{ShellHeight}
           ,{DataStatus}
           ,{DateEntered}
           ,{EnteredBy}
           ,{DateProofed}
           ,{ProofedBy})
GO"



SBSHSQL <- glue(SBSHtemplate, .envir = SBSH)

write_lines(SBSHSQL,"SBSH.sql")