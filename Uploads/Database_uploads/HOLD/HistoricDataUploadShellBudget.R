setwd("C:/Users/Berlynna.Heres/Desktop/TempOyster")

library(tidyverse)
library(lubridate) 
library(readxl)
library(glue)

BSWQ<- read.csv("SSSBWQ2022.csv")
BSSH<- read.csv("SSSBSH2022.csv")
BSQ<- read.csv("SSSBQuadrat2022.csv")

head(BSWQ)





A2<- BSQ %>% mutate( Date= format(mdy(Date.Collected), "%Y%m%d"),
                     Station= sprintf("%04d", Station),
                     Estuary = "SS")

#Format date and station to build the necessary PKs
#BSQ1<- BSQ %>% select(Date,Station,FixedLocationID)
#BSQ2<- unique(BSQ1)


#Build the PKs and wrap everything in single quotes so that SQL can read it
TripTable<- data.frame(TripID= paste0("'",A2$Estuary,"SHBG_",A2$Date,"_1","'"),
                       TripType= paste0("'","Shell Budget","'"),
                       TripDate = paste0("'",ymd(A2$Date),"'"),
                       DataStatus = paste0("'","Proofed","'"),
                       DateEntered = paste0("'",format(Sys.time(),"%Y-%m-%d %H:%M:%OS3"),"'"),
                       EnteredBy =  paste0("'","Berlynna Heres","'"),
                       DateProofed = paste0("'",format(Sys.time(),"%Y-%m-%d %H:%M:%OS3"),"'"),
                       ProofedBy = paste0("'","Berlynna Heres","'"))

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


write_lines(TripInfoSQL,"TripInfo.sql")




A2<- BSWQ %>% mutate( Date= format(mdy(Date), "%Y%m%d"),
                      Station= sprintf("%04d", Station),
                      Estuary = "SS")


SampleEvent<- data.frame(SampleEventID = paste0("'",A2$Estuary,"SHBG_",A2$Date,"_1_",A2$FixedLocationID,"_1","'"),
                         TripID= paste0("'",A2$Estuary,"SHBG_",A2$Date,"_1","'"),
                         FixedLocationID = paste0("'",A2$FixedLocationID,"'"),
                         LatitudeDec = ifelse(is.na(A2$Lat),"NULL",paste0("'",A2$Lat,"'")),
                         LongitudeDec = ifelse(is.na(A2$Lon),"NULL",paste0("'",A2$Lon,"'")),
                         DataStatus = paste0("'","Proofed","'"),
                         DateEntered = paste0("'",format(Sys.time(),"%Y-%m-%d %H:%M:%OS3"),"'"),
                         EnteredBy =  paste0("'","Berlynna Heres","'"),
                         DateProofed = paste0("'",format(Sys.time(),"%Y-%m-%d %H:%M:%OS3"),"'"),
                         ProofedBy = paste0("'","Berlynna Heres","'")) 


SampleEvent<- unique(SampleEvent)

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

write_lines(SampleEventSQL,"SampleEvent.sql")




A2<- BSWQ %>% mutate( Date= format(mdy(Date), "%Y%m%d"),
                      Station= sprintf("%04d", Station),
                      Estuary = "SS",
                      Temperature..C.= ifelse(Temperature..C.=="Z",NA, Temperature..C.),
                      Salinity= ifelse(Salinity=="Z",NA,
                                       ifelse(Salinity == "N", 0, Salinity)),
                      Dissolved.Oxygen..mg.L.= ifelse(Dissolved.Oxygen..mg.L.=="Z",NA,
                                                      ifelse(Dissolved.Oxygen..mg.L. == "N", 0, Dissolved.Oxygen..mg.L.)),
                      pH= ifelse(pH=="Z",NA, pH),
                      Sample.Depth...m.= ifelse(Sample.Depth...m.=="Z",NA, Sample.Depth...m.),
                      Turbidity..FNU.= ifelse(Turbidity..FNU.=="Z",NA, Turbidity..FNU.),
                      Comments= gsub("'", "", Comments),
                      Comments= gsub(",","", Comments))




SampleEventWQ <- data.frame(SampleEventWQID = paste0("'",A2$Estuary,"SHBG_",A2$Date,"_1_",A2$FixedLocationID,"_1_01","'"),
                            SampleEventID = paste0("'",A2$Estuary,"SHBG_",A2$Date,"_1_",A2$FixedLocationID,"_1","'"),
                            Temperature =  ifelse(is.na(A2$Temperature..C.),"NULL",paste0("'",A2$Temperature..C.,"'")),
                            Salinity = ifelse(is.na(A2$Salinity),"NULL",paste0("'",A2$Salinity,"'")),
                            DissolvedOxygen = ifelse(is.na(A2$Dissolved.Oxygen..mg.L.),"NULL",paste0("'",A2$Dissolved.Oxygen..mg.L.,"'")),
                            pH = ifelse(is.na(A2$pH),"NULL",paste0("'",A2$pH,"'")),
                            Depth = ifelse(is.na(A2$Sample.Depth...m.),"NULL",paste0("'",A2$Sample.Depth...m.,"'")),
                            TurbidityYSI = ifelse(is.na(A2$Turbidity..FNU.),"NULL",paste0("'",A2$Turbidity..FNU.,"'")),
                            DataStatus = paste0("'","Proofed","'"),
                            DateEntered = paste0("'",format(Sys.time(),"%Y-%m-%d %H:%M:%OS3"),"'"),
                            EnteredBy =  paste0("'","Berlynna Heres","'"),
                            DateProofed = paste0("'",format(Sys.time(),"%Y-%m-%d %H:%M:%OS3"),"'"),
                            ProofedBy = paste0("'","Berlynna Heres","'"),
                            Comments = paste0("'",paste("Notes =", A2$Comments," NumQuads =",
                                                        A2$Number.of..Quadrats,"'")))

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
           ,{Comments})
GO"



SampleEventWQSQL <- glue(SampleEventWQtemplate, .envir = SampleEventWQ)

write_lines(SampleEventWQSQL,"SampleEventWQ.sql")



A3<- BSWQ %>% mutate( Date= format(mdy(Date), "%Y%m%d"),
                      Station= sprintf("%04d", Station),
                      Estuary = "SS",
                      SampleEventID = paste0(Estuary,"SHBG_",Date,"_1_",FixedLocationID,"_1")) %>%
  select(SampleEventID,Survey,Date,Estuary,Section,Station,FixedLocationID)



B2<- BSQ %>%  mutate(Date= format(mdy(Date.Collected), "%Y%m%d"),
                     Quadrat= sprintf("%02d", Quadrat..1.4.m2.),
                     Station= sprintf("%04d", Station),
                     Estuary = "SS",
                     SampleEventID= paste0(Estuary,"SHBG_",Date,"_1_",FixedLocationID,"_1")) 

B3<- left_join(B2,A3, by= c("SampleEventID","Survey","Date","Estuary","Section","Station","FixedLocationID"))

B3<- B3 %>% mutate(Quadrat= ifelse(is.na(Quadrat),"00",Quadrat),
                   TotalSampleVolume= ifelse(Total.Sample.Vol..L.=="Z",NA,
                                    ifelse(Total.Sample.Vol..L. == "N", 0.04 , Total.Sample.Vol..L.)),
                   TotalSampleWeight= ifelse(trimws(Total.Sample.Wt..kg.) == "Z", NA,
                                               ifelse(trimws(Total.Sample.Wt..kg.) == "N", 0.01, Total.Sample.Wt..kg.)),
                   LiveOysterVolume= ifelse(Live.Oyster.Volume..L.=="Z",NA,
                                             ifelse(Live.Oyster.Volume..L. == "N", 0.04 , Live.Oyster.Volume..L.)),
                   LiveOysterWeight= ifelse(trimws(Live.Oyster.Weight..kg.)=="Z",NA,
                                             ifelse(trimws(Live.Oyster.Weight..kg.) == "N", 0.01 , Live.Oyster.Weight..kg.)),
                   Drill.Weight..kg.= ifelse(Drill.Weight..kg.=="Z",NA,
                                            ifelse(Drill.Weight..kg. == "N", 0.01 , Drill.Weight..kg.)),
                   Crown.Conch.Wt..kg.= ifelse(Crown.Conch.Wt..kg.=="Z",NA,
                                             ifelse(Crown.Conch.Wt..kg. == "N", 0.01 , Crown.Conch.Wt..kg.)),
                   OtherBiotaWeight= ifelse(Other.Biota.Weight..kg.=="Z",NA,
                                               ifelse(Other.Biota.Weight..kg. == "N", 0.01 , Other.Biota.Weight..kg.)),
                   OysterShellVolume= ifelse(Oyster.Shell.Volume..L. =="Z",NA,
                                            ifelse(Oyster.Shell.Volume..L. == "N", 0.04 , Oyster.Shell.Volume..L.)),
                   OysterShellWeight= ifelse(Oyster.Shell.Weight..kg. =="Z",NA,
                                            ifelse(Oyster.Shell.Weight..kg. == "N", 0.01 , Oyster.Shell.Weight..kg.)),
                   PlantedShellVolume= ifelse(Planted.Shell.Volume..L. =="Z",NA,
                                             ifelse(Planted.Shell.Volume..L. == "N", 0.04 , Planted.Shell.Volume..L.)),
                   PlantedShellWeight= ifelse(Planted.Shell.Weight..kg. =="Z",NA,
                                             ifelse(Planted.Shell.Weight..kg. == "N", 0.01 , Planted.Shell.Weight..kg.)),
                   ShellHashVolume= ifelse(Shell.Hash.Volume..L. =="Z",NA,
                                              ifelse(Shell.Hash.Volume..L. == "N", 0.04 , Shell.Hash.Volume..L.)),
                   ShellHashWeight= ifelse(Shell.Hash.Weight..kg. =="Z",NA,
                                              ifelse(Shell.Hash.Weight..kg. == "N", 0.01 , Shell.Hash.Weight..kg.)),
                   BlackAndOtherSubstrateVolume= ifelse(Black.and.Other.Substrate.Volume..L. =="Z",NA,
                                           ifelse(Black.and.Other.Substrate.Volume..L. == "N", 0.04 , Black.and.Other.Substrate.Volume..L.)),
                   BlackAndOtherSubstrateWeight= ifelse(Black.and.Other.Substrate.Weight..kg. =="Z",NA,
                                           ifelse(Black.and.Other.Substrate.Weight..kg. == "N", 0.01 , Black.and.Other.Substrate.Weight..kg.))
                   )

ShellBudgetQuadrat<- data.frame(QuadratID = paste0("'",B3$SampleEventID,"_",B3$Quadrat,"'"),
                           SampleEventID = paste0("'",B3$SampleEventID,"'"),
                           QuadratNumber = paste0("'",B3$Quadrat,"'"),
                           TotalSampleVolume= ifelse(is.na(B3$TotalSampleVolume),"NULL",paste0("'",B3$TotalSampleVolume,"'")),
                           TotalSampleWeight= ifelse(is.na(B3$TotalSampleWeight),"NULL",paste0("'",B3$TotalSampleWeight,"'")),
                           LiveOysterVolume= ifelse(is.na(B3$LiveOysterVolume),"NULL",paste0("'",B3$LiveOysterVolume,"'")),
                           LiveOysterWeight= ifelse(is.na(B3$LiveOysterWeight),"NULL",paste0("'",B3$LiveOysterWeight,"'")),
                           NumDrills = ifelse(is.na(B3$X..Drills),"NULL",paste0("'",B3$X..Drills,"'")),
                           DrillWeight = ifelse(is.na(B3$Drill.Weight..kg.),"NULL",paste0("'",B3$Drill.Weight..kg.,"'")),
                           OtherBiotaWeight = ifelse(is.na(B3$OtherBiotaWeight),"NULL",paste0("'",B3$OtherBiotaWeight,"'")),
                           NumLiveOysters= ifelse(is.na(B3$X..total.Live.Oysters),"NULL",paste0("'",B3$X..total.Live.Oysters,"'")),
                           NumDeadOysters= ifelse(is.na(B3$X..Dead.Oysters),"NULL",paste0("'",B3$X..Dead.Oysters,"'")),
                           OysterShellVolume= ifelse(is.na(B3$OysterShellVolume),"NULL",paste0("'",B3$OysterShellVolume,"'")),
                           OysterShellWeight= ifelse(is.na(B3$OysterShellWeight),"NULL",paste0("'",B3$OysterShellWeight,"'")),
                           PlantedShellVolume= ifelse(is.na(B3$PlantedShellVolume),"NULL",paste0("'",B3$PlantedShellVolume,"'")),
                           PlantedShellWeight= ifelse(is.na(B3$PlantedShellWeight),"NULL",paste0("'",B3$PlantedShellWeight,"'")),
                           ShellHashVolume= ifelse(is.na(B3$ShellHashVolume),"NULL",paste0("'",B3$ShellHashVolume,"'")),
                           ShellHashWeight= ifelse(is.na(B3$ShellHashWeight),"NULL",paste0("'",B3$ShellHashWeight,"'")),
                           BlackAndOtherSubstrateVolume= ifelse(is.na(B3$BlackAndOtherSubstrateVolume),"NULL",paste0("'",B3$BlackAndOtherSubstrateVolume,"'")),
                           BlackAndOtherSubstrateWeight= ifelse(is.na(B3$BlackAndOtherSubstrateWeight),"NULL",paste0("'",B3$BlackAndOtherSubstrateWeight,"'")),
                           DataStatus = paste0("'","Proofed","'"),
                           DateEntered = paste0("'",format(Sys.time(),"%Y-%m-%d %H:%M:%OS3"),"'"),
                           EnteredBy =  paste0("'","Berlynna Heres","'"),
                           DateProofed = paste0("'",format(Sys.time(),"%Y-%m-%d %H:%M:%OS3"),"'"),
                           ProofedBy = paste0("'","Berlynna Heres","'"),
                           Comments = paste0("'",paste("Notes =", B3$Comments),
                                             paste("CrownConchNumber =",
                                                   B3$X..Crown.Conch),
                                             paste("CrownConchWt =",
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

write_lines(ShellBudgetQuadratSQL,"ShellBudgetQuadrat.sql")



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