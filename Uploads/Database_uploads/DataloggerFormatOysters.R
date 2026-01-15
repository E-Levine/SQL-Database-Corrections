#Code for formatting datalogger data into databse format.
#Original file located on network
#
#### Set up ####
library(tidyverse)
library(lubridate) 
library(readxl)
library(glue)
library(DBI)
library(odbc)
library(dbplyr) 
#
DataManager = "E Williams"
Database = "Oysters_25-12-22"
Server = "localhost\\ERICALOCALSQL"
#
#
#### Database connection ####

#You will need to reorder the FixedLocation data so geography is the last column in that table
# You can use this script to just drop that column on your local instance, it may be easier
#ALTER TABLE dbo.FixedLocations
#DROP COLUMN GeoPolyBoundaries;

#Connect to local server:
Oyster <- dbConnect(odbc(),
                    Driver= "SQL Server", 
                    Server = Server,
                    Database= Database,
                    Authentication = "ActiveDirectoryIntegrated")

#Download Fixed Location Data R 
FixedLocations<- tbl(Oyster,in_schema("dbo", "FixedLocations"))%>% 
  collect()

Trip<- tbl(Oyster,in_schema("dbo", "TripInfo"))%>% 
  collect()

SampleEvent<- tbl(Oyster,in_schema("dbo", "SampleEvent"))%>% 
  collect()

SampleEventWQ<- tbl(Oyster,in_schema("dbo", "SampleEventWQ"))%>% 
  collect()

SurveySH<- tbl(Oyster,in_schema("dbo", "SurveySH"))%>% 
  collect()

SurveyQ<- tbl(Oyster,in_schema("dbo", "SurveyQuadrat"))%>% 
  collect()

DBI::dbDisconnect(Oyster)

FL<- FixedLocations %>% mutate(STATION= StationNumber, SECTION = SectionName,
                               FLID= FixedLocationID, ESTUARY= Estuary) %>% 
  select(FLID,ESTUARY,STATION,SECTION)
#
#
#### Formatting ####
#
time<-Sys.Date()
m<-month(time)
d<- day(time)
year<- year(time)
YMD<-paste0(year,m,d)


#Read in the file that includes what we will use for Trip Data, Sample Event Data 
#and Sample Event WQ Data 
A = list.files(pattern="CEP") %>% 
  setNames(nm=.) %>%
  lapply(read_excel) %>%
  bind_rows(.id = "FileName")%>%
  mutate(FileName=substr(FileName,1,1)) 

#### Focus here
A1<- left_join(A,FL, by= c('SECTION','STATION','ESTUARY'))
#Format date and station to build the necessary PKs
A2<- A %>% mutate( Date= format(mdy(DATE), "%Y%m%d"))#,
                   # Station= sprintf("%04d", STATION))



#Build the PKs and wrap everything in single quotes so that SQL can read it
TripTable<- data.frame(TripID= paste0("'",A2$ESTUARY,"SRVY_",A2$Date,"_1","'"),
                   TripType= paste0("'","Survey","'"),
                   TripDate = paste0("'",ymd(A2$Date),"'"),
                   DataStatus = paste0("'","Proofed","'"),
                   DateEntered = paste0("'",format(Sys.time(),"%Y-%m-%d %H:%M:%OS3"),"'"),
                   EnteredBy =  paste0("'","Berlynna Heres","'"),
                   DateProofed = paste0("'",format(Sys.time(),"%Y-%m-%d %H:%M:%OS3"),"'"),
                   ProofedBy = paste0("'","Berlynna Heres","'"))

#Check to make sure everything is in single quotes 
TripTable<- unique(TripTable)

#ADD TO BEGINNING OF CODE IN SQL:
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
     VALUES
           ({TripID}
           ,{TripType}
           ,{TripDate}
           ,{DataStatus}
           ,{DateEntered}
           ,{EnteredBy}
           ,{DateProofed}
           ,{ProofedBy})
GO
"

# Use the glue function to fill in the template with the data frame values
TripInfoSQL <- glue(TripInfoSQLtemplate, .envir = TripTable)


write_lines(TripInfoSQL,paste0("//fwc-spfs1/FishBio/Molluscs/Oysters/ODIN Oyster Data Entry/Datalogger to Database/Temporary Datalogger Files/SQL Scripts/TripInfo",YMD,".sql"))


SampleEvent<- data.frame(SampleEventID = paste0("'",A2$ESTUARY,"SRVY_",A2$Date,"_1_",A2$Station,"_1","'"),
                 TripID= paste0("'",A2$ESTUARY,"SRVY_",A2$Date,"_1","'"),
                 FixedLocationID = paste0("'",A2$Station,"'"),
                 LatitudeDec = paste0("'",A2$LATITUDE,"'"),
                 LongitudeDec = paste0("'",A2$LONGITUDE,"'"),
                 DataStatus = paste0("'","Proofed","'"),
                 DateEntered = paste0("'",format(Sys.time(),"%Y-%m-%d %H:%M:%OS3"),"'"),
                 EnteredBy =  paste0("'","Berlynna Heres","'"),
                 DateProofed = paste0("'",format(Sys.time(),"%Y-%m-%d %H:%M:%OS3"),"'"),
                 ProofedBy = paste0("'","Berlynna Heres","'")) 



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
     VALUES
           ({SampleEventID}
           ,{TripID}
           ,{FixedLocationID}
           ,{LatitudeDec}
           ,{LongitudeDec}
           ,{DataStatus}
           ,{DateEntered}
           ,{EnteredBy}
           ,{DateProofed}
           ,{ProofedBy})
GO"


SampleEventSQL <- glue(SampleEventtemplate, .envir = SampleEvent)

write_lines(SampleEventSQL,paste0("//fwc-spfs1/FishBio/Molluscs/Oysters/ODIN Oyster Data Entry/Datalogger to Database/Temporary Datalogger Files/SQL Scripts/SampleEvent",YMD,".sql"))




                  
SampleEventWQ <- data.frame(SampleEventWQID = paste0("'",A2$ESTUARY,"SRVY_",A2$Date,"_1_",A2$Station,"_1_01","'"),
                    SampleEventID = paste0("'",A2$ESTUARY,"SRVY_",A2$Date,"_1_",A2$Station,"_1","'"),
                    Temperature =  paste0("'",A2$TEMP,"'"),
                    Salinity = paste0("'",A2$SALINITY,"'"),
                    DissolvedOxygen = paste0("'",A2$DO,"'"),
                    pH = paste0("'",A2$PH,"'"),
                    Depth = paste0("'",A2$DEPTH,"'"),
                    TurbidityYSI = paste0("'",A2$TURBIDITY,"'"),
                    DataStatus = paste0("'","Proofed","'"),
                    DateEntered = paste0("'",format(Sys.time(),"%Y-%m-%d %H:%M:%OS3"),"'"),
                    EnteredBy =  paste0("'","Berlynna Heres","'"),
                    DateProofed = paste0("'",format(Sys.time(),"%Y-%m-%d %H:%M:%OS3"),"'"),
                    ProofedBy = paste0("'","Berlynna Heres","'"),
                    Comments = paste0("'",paste("DPTH_STRTA =", A2$DPTH_STRTA, "BOTTOM_TYP =", A2$BOTTOM_TYP),"'"),
                    CollectionTime = paste0("'",A2$TIME,"'")) 

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
           ,[DateCompleted]
           ,[CompletedBy]
           ,[Comments]
           ,[CollectionTime])
     VALUES
           ({SampleEventWQID}
           ,{SampleEventID}
           ,{Temperature}
           ,{Salinity}
           ,{DissolvedOxygen}
           ,{pH}
           ,{Depth}
           ,{TurbidityYSI}
           ,{DataStatus}
           ,{DateEntered}
           ,{EnteredBy}
           ,{DateProofed}
           ,{ProofedBy}
           ,{Comments}
           ,{CollectionTime})
GO"



SampleEventWQSQL <- glue(SampleEventWQtemplate, .envir = SampleEventWQ)

write_lines(SampleEventWQSQL,paste0("//fwc-spfs1/FishBio/Molluscs/Oysters/ODIN Oyster Data Entry/Datalogger to Database/Temporary Datalogger Files/SQL Scripts/SampleEventWQ",YMD,".sql"))




B = list.files(pattern="1_01___.859") %>% 
  setNames(nm=.) %>%
  lapply(read_excel) %>%
  bind_rows(.id = "FileName") %>%
  mutate(FileName=substr(FileName,1,1)) 
  


#B1<- read_excel("A1_01___.xlsx")
B2<- B %>%  mutate(Quadrat= sprintf("%02d", QDRT)) %>%#, Date= format(mdy(DATE),"%Y%m%d")) %>%
  #This is an issue with test code, look into this! 
  select(-DATE) 
B3<- left_join(B2,A2, by= c("FileName","STATION"))


SQ<- data.frame(QuadratID = paste0("'",B3$ESTUARY,"SRVY_",B3$Date,"_1_",B3$Station,"_1_",B3$Quadrat,"'"),
                SampleEventID = paste0("'",B3$ESTUARY,"SRVY_",B3$Date,"_1_",B3$Station,"_1","'"),
                QuadratNumber = paste0("'",B3$QDRT,"'"),
                TotalVolume = paste0("'",B3$VOL,"'"),
                TotalWeight = paste0("'",B3$WGHT,"'"),
                NumDrills = paste0("'",B3$DRILLS,"'"),
                DataStatus = paste0("'","Proofed","'"),
                DateEntered = paste0("'",format(Sys.time(),"%Y-%m-%d %H:%M:%OS3"),"'"),
                EnteredBy =  paste0("'","Berlynna Heres","'"),
                DateProofed = paste0("'",format(Sys.time(),"%Y-%m-%d %H:%M:%OS3"),"'"),
                ProofedBy = paste0("'","Berlynna Heres","'"),
                Comments = paste0("'",paste("CC =", B3$CC, "Notes =", B3$NOTES),"'"),
                Station= sprintf("%04d", B3$STATION))


#C1<-  read_excel("A1201001.943.xlsx")
#C2<-  read_excel("A1201002.943.xlsx")
#C3<-  read_excel("A1201003.943.xlsx")
#C4<-  read_excel("A1201004.943.xlsx")

#C5<- bind_rows(C1,C2,C3,C4)

C = list.files(pattern="12010") %>% 
  setNames(nm=.) %>%
  lapply(read_excel) %>%
  bind_rows(.id = "FileName") %>%
  mutate(FileName=substr(FileName,1,1))

C1<- C %>% mutate(Station= sprintf("%04d", STATION), 
                   QuadratNumber= paste0("'",QDRT,"'"), 
                   NumLive= LIVE,
                   NumDead= DEAD) %>% 
  select(Station,QuadratNumber,NumLive,NumDead)

SurveyQuadrat<- left_join(SQ,C1, by= c("Station","QuadratNumber")) %>%
  mutate(NumLive= ifelse(is.na(NumLive),"NULL",paste0("'",NumLive,"'")),
         NumDead=ifelse(is.na(NumDead),"NULL",paste0("'",NumDead,"'")))



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
     VALUES
           ({QuadratID}
           ,{SampleEventID}
           ,{QuadratNumber}
           ,{NumLive}
           ,{NumDead}
           ,{TotalVolume}
           ,{TotalWeight}
           ,{NumDrills}
           ,{DataStatus}
           ,{DateEntered}
           ,{EnteredBy}
           ,{DateProofed}
           ,{ProofedBy}
           ,{Comments})
GO"


SurveyQuadratSQL <- glue(SurveyQuadrattemplate, .envir = SurveyQuadrat)

write_lines(SurveyQuadratSQL,paste0("//fwc-spfs1/FishBio/Molluscs/Oysters/ODIN Oyster Data Entry/Datalogger to Database/Temporary Datalogger Files/SQL Scripts/SurveyQuadrat",YMD,".sql"))


D = list.files(pattern="11010") %>% 
  setNames(nm=.) %>%
  lapply(read_excel) %>%
  bind_rows(.id = "FileName") %>%
  mutate(FileName=substr(FileName,1,1)) %>%
  group_by(FileName)


#D1<-  read_excel("A1101001.943.xlsx")
#D2<-  read_excel("A1101002.943.xlsx")
#D3<-  read_excel("A1101003.943.xlsx")

#D4<- bind_rows(D1,D2,D3)

D1<- D %>% mutate(Station= sprintf("%04d", STATION), 
                   Quadrat= sprintf("%02d", QDRT),
                   ShellNumber= sprintf("%03d",OYSTER_NUM))

D2<- left_join(D1,B3, by= c("Station", "FileName","STATION","QDRT","Quadrat"))

SurveySH<- data.frame(ShellHeightID = paste0("'",D2$ESTUARY,"SRVY_",D2$Date,"_1_",D2$Station,"_1_",D2$Quadrat,"_",D2$ShellNumber,"'"),
                QuadratID = paste0("'",D2$ESTUARY,"SRVY_",D2$Date,"_1_",D2$Station,"_1_",D2$Quadrat,"'"),
                ShellHeight = paste0("'",D2$SH,"'"),
                DataStatus = paste0("'","Proofed","'"),
                DateEntered = paste0("'",format(Sys.time(),"%Y-%m-%d %H:%M:%OS3"),"'"),
                EnteredBy =  paste0("'","Berlynna Heres","'"),
                DateProofed = paste0("'",format(Sys.time(),"%Y-%m-%d %H:%M:%OS3"),"'"),
                ProofedBy = paste0("'","Berlynna Heres","'"),
                Comments = paste0("'",paste("TYPE =", D2$TYPE),"'"))


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
     VALUES
           ({ShellHeightID}
           ,{QuadratID}
           ,{ShellHeight}
           ,{DataStatus}
           ,{DateEntered}
           ,{EnteredBy}
           ,{DateProofed}
           ,{ProofedBy}
           ,{Comments})
GO"



SurveySHSQL <- glue(SurveySHtemplate, .envir = SurveySH)

write_lines(SurveySHSQL,paste0("//fwc-spfs1/FishBio/Molluscs/Oysters/ODIN Oyster Data Entry/Datalogger to Database/Temporary Datalogger Files/SQL Scripts/SurveySH",YMD,".sql"))