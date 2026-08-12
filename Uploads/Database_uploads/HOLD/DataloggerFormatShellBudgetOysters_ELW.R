#This script converts Shell Budget data exported off of the Trimble Data Logger
#and converts it into SQL scripts to be entered into the Oyster DB

#Set your working directory, I used my one drive to house the script,
#I recommend you do the same
name<- "Berlynna.Heres"

setwd(paste0("C:/Users/",name,"/OneDrive - Florida Fish and Wildlife Conservation/OysterTrimbleUpload"))

#Install packages as needed
#Tidyverse for data manipulation, readxl for reading in excel files
#Glue for writing and repeating SQL code, Foreign to read in the dbf files

#install.packages("tidyverse")
#install.packages("readxl")
#install.packages("glue")
#install.packages("foreign")

library(tidyverse)
library(readxl)
library(glue)
library(foreign)


#set time of entry details
time<-Sys.Date()
m<-month(time)
d<- day(time)
year<- year(time)
YMD<-paste0(year,m,d)

#Set file name (Change this!)
filename<- 'SSSHBG_2025_Winter'

#Put raw dbf files into your working directory (Remember I set mine as my one drive file)
setwd(paste0("C:/Users/",name,"/OneDrive - Florida Fish and Wildlife Conservation/OysterTrimbleUpload/",filename,""))
#Read in the file that includes what we will use for Trip Data, Sample Event Data 
#and Sample Event WQ Data 
#This reads in the dbf files and compiles them
A = list.files(pattern=".dbf") %>% 
  setNames(nm=.) %>%
  lapply(read.dbf) %>%
  bind_rows(.id = "FileName")%>%
  mutate(FileName=substr(FileName,1,1)) 



#Start with trip table


#Format date and station to build the necessary PKs
A1<- A %>% fill(DATE, .direction = "up") %>% 
  mutate(DATE= first(DATE)) %>%
  filter(!is.na(ESTUARY)) %>%  
  mutate( Date= format(mdy(DATE), "%Y%m%d"),
          Time= as.character(TIME),
          Time= gsub(":","",Time),
          Time= str_sub(Time,end = -3)) 



#Build the PKs and wrap everything in single quotes so that SQL can read it
TripTable<- data.frame(TripID= paste0("'",A1$ESTUARY,"SHBG_",A1$Date,"_1","'"),
                       TripType= paste0("'","Survey","'"),
                       TripDate = paste0("'",ymd(A1$Date),"'"),
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


write_lines(TripInfoSQL,paste0("//fwc-spfs1/FishBio/Molluscs/Oysters/ODIN Oyster Data Entry/Datalogger to Database/Temporary Datalogger Files/SQL Scripts/ToBeEnteredIntoDB/TripInfo",filename,".sql"))


SampleEvent<- data.frame(SampleEventID = paste0("'",A1$ESTUARY,"SHBG_",A1$Date,"_1_",A1$FIXEDID,"_1","'"),
                         TripID= paste0("'",A1$ESTUARY,"SHBG_",A1$Date,"_1","'"),
                         FixedLocationID = paste0("'",A1$FIXEDID,"'"),
                         LatitudeDec = paste0("'",A1$LATITUDE,"'"),
                         LongitudeDec = paste0("'",A1$LONGITUDE,"'"),
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

write_lines(SampleEventSQL,paste0("//fwc-spfs1/FishBio/Molluscs/Oysters/ODIN Oyster Data Entry/Datalogger to Database/Temporary Datalogger Files/SQL Scripts/ToBeEnteredIntoDB/SampleEvent",filename,".sql"))





SampleEventWQ <- data.frame(SampleEventWQID = paste0("'",A1$ESTUARY,"SHBG_",A1$Date,"_1_",A1$FIXEDID,"_1_01","'"),
                            SampleEventID = paste0("'",A1$ESTUARY,"SHBG_",A1$Date,"_1_",A1$FIXEDID,"_1","'"),
                            Temperature =  paste0("'",A1$TEMP,"'"),
                            Salinity = paste0("'",A1$SALINITY,"'"),
                            DissolvedOxygen = paste0("'",A1$DO,"'"),
                            pH = paste0("'",A1$PH,"'"),
                            Depth = paste0("'",A1$DEPTH,"'"),
                            TurbidityYSI = paste0("'",A1$TURBIDITY,"'"),
                            DataStatus = paste0("'","Proofed","'"),
                            DateEntered = paste0("'",format(Sys.time(),"%Y-%m-%d %H:%M:%OS3"),"'"),
                            EnteredBy =  paste0("'","Berlynna Heres","'"),
                            DateProofed = paste0("'",format(Sys.time(),"%Y-%m-%d %H:%M:%OS3"),"'"),
                            ProofedBy = paste0("'","Berlynna Heres","'"),
                            Comments = paste0("'",paste("DPTH_STRTA =", A1$DPTH_STRTA, "BOTTOM_TYP =", A1$BOTTOM_TYP),"'"),
                            CollectionTime = paste0("'",A1$Time,"'")) 

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

write_lines(SampleEventWQSQL,paste0("//fwc-spfs1/FishBio/Molluscs/Oysters/ODIN Oyster Data Entry/Datalogger to Database/Temporary Datalogger Files/SQL Scripts/ToBeEnteredIntoDB/SampleEventWQ",filename,".sql"))




B<- A %>%
  fill(DATE, .direction = "up") %>% 
  mutate(DATE= first(DATE)) %>%
  fill(ESTUARY, .direction = "down") %>%
  fill(STATION, .direction = "down") %>% 
  fill(FIXEDID, .direction = "down") %>% 
  filter(!is.na(WGHT))

#B1<- read_excel("A1_01___.xlsx")
B2<- B %>%  mutate(Quadrat= sprintf("%02d", QDRT), Date= format(mdy(DATE),"%Y%m%d"),
                   Station= sprintf("%04s", STATION)) %>%
  #This is an issue with test code, look into this! 
  select(-DATE) 


SQ<- data.frame(QuadratID = paste0("'",B2$ESTUARY,"SHBG_",B2$Date,"_1_",B2$FIXEDID,"_1_",B2$Quadrat,"'"),
                SampleEventID = paste0("'",B2$ESTUARY,"SHBG_",B2$Date,"_1_",B2$FIXEDID,"_1","'"),
                QuadratNumber = paste0("'",B2$QDRT,"'"),
                TotalSampleVolume = paste0("'",B2$VOL,"'"),
                TotalSampleWeight = paste0("'",B2$WGHT,"'"),
                NumDrills = paste0("'",B2$DRILLS,"'"),
                DataStatus = paste0("'","Proofed","'"),
                DateEntered = paste0("'",format(Sys.time(),"%Y-%m-%d %H:%M:%OS3"),"'"),
                EnteredBy =  paste0("'","Berlynna Heres","'"),
                DateProofed = paste0("'",format(Sys.time(),"%Y-%m-%d %H:%M:%OS3"),"'"),
                ProofedBy = paste0("'","Berlynna Heres","'"),
                Comments = paste0("'",paste("CC =", B2$CC, "Notes =", B2$NOTES),"'"),
                Station= B2$FIXEDID)



C<- A %>%  
  fill(DATE, .direction = "up") %>% 
  mutate(DATE= first(DATE)) %>%
  filter(is.na(WGHT))%>%
  fill(ESTUARY, .direction = "down") %>%
  fill(FIXEDID, .direction = "down") %>% 
  fill(DATE, .direction = "down") %>% 
  filter(!is.na(LIVE))

C1<- C %>% mutate(Station= FIXEDID, 
                  QuadratNumber= paste0("'",QDRT,"'"), 
                  NumLiveOysters= LIVE,
                  NumDeadOysters= DEAD) %>% 
  select(Station,QuadratNumber,NumLiveOysters,NumDeadOysters)




SQ1<- left_join(SQ,C1, by= c("Station","QuadratNumber")) %>%
  mutate(NumLiveOysters= ifelse(is.na(NumLiveOysters),"NULL",paste0("'",NumLiveOysters,"'")),
         NumDeadOysters=ifelse(is.na(NumDeadOysters),"NULL",paste0("'",NumDeadOysters,"'")))


D<- A %>%  
  fill(DATE, .direction = "up") %>% 
  mutate(DATE= first(DATE)) %>%
  filter(is.na(WGHT))%>%
  fill(ESTUARY, .direction = "down") %>%
  fill(FIXEDID, .direction = "down") %>% 
  fill(DATE, .direction = "down") %>% 
  filter(!is.na(LIVEWGHT))

D1<- D %>% mutate(Station= as.character(FIXEDID), 
                  QuadratNumber= paste0("'",QDRT,"'"), 
                  LiveOysterVolume = LIVEVOL,
                  LiveOysterWeight= LIVEWGHT,
                  DrillWeight= DRILLWGHT,
                  OtherBiotaWeight = BIOTAWGHT,
                  OysterShellVolume = SHELLVOL,
                  OysterShellWeight = SHELLWGHT,
                  PlantedShellVolume= PLANTVOL,
                  PlantedShellWeight = PLANTWGHT,
                  ShellHashVolume= HASHVOL,
                  ShellHashWeight = HASHWGHT,
                  BlackAndOtherSubstrateVolume= OTHERVOL,
                  BlackAndOtherSubstrateWeight= OTHERWGHT) %>% 
  select(Station,QuadratNumber,LiveOysterVolume,LiveOysterWeight,DrillWeight,
         OtherBiotaWeight,OysterShellVolume,OysterShellWeight,PlantedShellVolume,
         PlantedShellWeight,ShellHashVolume,ShellHashWeight,
         BlackAndOtherSubstrateVolume,BlackAndOtherSubstrateWeight)


ShellBudgetQuadrat<- left_join(SQ1,D1, by= c("Station","QuadratNumber")) %>%
  mutate(LiveOysterVolume= ifelse(is.na(LiveOysterVolume),"NULL",paste0("'",LiveOysterVolume,"'")),
         LiveOysterWeight=ifelse(is.na(LiveOysterWeight),"NULL",paste0("'",LiveOysterWeight,"'")),
         DrillWeight= ifelse(is.na(DrillWeight),"NULL",paste0("'",DrillWeight,"'")),
         OtherBiotaWeight=ifelse(is.na(OtherBiotaWeight),"NULL",paste0("'",OtherBiotaWeight,"'")),
         OysterShellVolume= ifelse(is.na(OysterShellVolume),"NULL",paste0("'",OysterShellVolume,"'")),
         OysterShellWeight= ifelse(is.na(OysterShellWeight),"NULL",paste0("'",OysterShellWeight,"'")),
         PlantedShellVolume=ifelse(is.na(PlantedShellVolume),"NULL",paste0("'",PlantedShellVolume,"'")),
         PlantedShellWeight=ifelse(is.na(PlantedShellWeight),"NULL",paste0("'",PlantedShellWeight,"'")),
         ShellHashVolume=ifelse(is.na(ShellHashVolume),"NULL",paste0("'",ShellHashVolume,"'")),
         ShellHashWeight=ifelse(is.na(ShellHashWeight),"NULL",paste0("'",ShellHashWeight,"'")),
         BlackAndOtherSubstrateVolume=ifelse(is.na(BlackAndOtherSubstrateVolume),"NULL",paste0("'",BlackAndOtherSubstrateVolume,"'")),
         BlackAndOtherSubstrateWeight=ifelse(is.na(BlackAndOtherSubstrateWeight),"NULL",paste0("'",BlackAndOtherSubstrateWeight,"'")))



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
     VALUES
           ({QuadratID}
           ,{SampleEventID}
           ,{QuadratNumber}
           ,{TotalSampleVolume}
           ,{TotalSampleWeight}
           ,{LiveOysterVolume}
           ,{LiveOysterWeight}
           ,{NumDrills}
           ,{DrillWeight}
           ,{OtherBiotaWeight}
           ,{NumLiveOysters}
           ,{NumDeadOysters}
           ,{OysterShellVolume}
           ,{OysterShellWeight}
           ,{PlantedShellVolume}
           ,{PlantedShellWeight}
           ,{ShellHashVolume}
           ,{ShellHashWeight}
           ,{BlackAndOtherSubstrateVolume}
           ,{BlackAndOtherSubstrateWeight}
           ,{DataStatus}
           ,{DateEntered}
           ,{EnteredBy}
           ,{DateProofed}
           ,{ProofedBy}
           ,{Comments})
GO"


ShellBudgetQuadratSQL <- glue(ShellBudgetQuadrattemplate, .envir = ShellBudgetQuadrat)

write_lines(ShellBudgetQuadratSQL,paste0("//fwc-spfs1/FishBio/Molluscs/Oysters/ODIN Oyster Data Entry/Datalogger to Database/Temporary Datalogger Files/SQL Scripts/ToBeEnteredIntoDB/ShellBudgetQuadrat",filename,".sql"))



E<- A %>%
  fill(DATE, .direction = "up") %>% 
  mutate(DATE= first(DATE)) %>%
  filter(is.na(WGHT))%>%
  fill(ESTUARY, .direction = "down") %>%
  fill(FIXEDID, .direction = "down") %>%
  fill(STATION, .direction = "down") %>%
  fill(DATE, .direction = "down") %>%
  filter(!is.na(OYSTER_NUM))



E1<- E %>% mutate(Station= as.character(FIXEDID),
                  #Station= sprintf("%04s", Station),
                  Quadrat= sprintf("%02d", QDRT),
                  ShellNumber= sprintf("%03d",OYSTER_NUM),
                  LiveOrDead = ifelse(TYPE== 1, "Live", "Dead"),
                  Date= format(mdy(DATE),"%Y%m%d"))

#D1<- left_join(D1,B2, by= c("Station", "FileName","STATION","QDRT","Quadrat"))

ShellBudgetSH<- data.frame(ShellHeightID = paste0("'",E1$ESTUARY,"SHBG_",E1$Date,"_1_",E1$Station,"_1_",E1$Quadrat,"_",E1$ShellNumber,"'"),
                      QuadratID = paste0("'",E1$ESTUARY,"SHBG_",E1$Date,"_1_",E1$Station,"_1_",E1$Quadrat,"'"),
                      LiveOrDead =  paste0("'",E1$LiveOrDead,"'"),
                      ShellHeight = paste0("'",E1$SH,"'"),
                      DataStatus = paste0("'","Proofed","'"),
                      DateEntered = paste0("'",format(Sys.time(),"%Y-%m-%d %H:%M:%OS3"),"'"),
                      EnteredBy =  paste0("'","Berlynna Heres","'"),
                      DateProofed = paste0("'",format(Sys.time(),"%Y-%m-%d %H:%M:%OS3"),"'"),
                      ProofedBy = paste0("'","Berlynna Heres","'"),
                      Comments = paste0("'",paste("NumDead =", E1$NO_DEAD, " Total Dead =",E1$TOTAL_DEAD),"'"))


ShellBudgetSHtemplate<- "INSERT INTO [dbo].[ShellBudgetSH]
           ([ShellHeightID]
           ,[QuadratID]
           ,[LiveOrDead]
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
           ,{LiveOrDead}
           ,{ShellHeight}
           ,{DataStatus}
           ,{DateEntered}
           ,{EnteredBy}
           ,{DateProofed}
           ,{ProofedBy}
           ,{Comments})
GO"



ShellBudgetSHSQL <- glue(ShellBudgetSHtemplate, .envir = ShellBudgetSH)

write_lines(ShellBudgetSHSQL,paste0("//fwc-spfs1/FishBio/Molluscs/Oysters/ODIN Oyster Data Entry/Datalogger to Database/Temporary Datalogger Files/SQL Scripts/ToBeEnteredIntoDB/ShellBudgetSH",filename,".sql"))
