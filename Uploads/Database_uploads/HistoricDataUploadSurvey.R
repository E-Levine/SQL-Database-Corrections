setwd("C:/Users/Berlynna.Heres/Desktop/TempOyster")

library(tidyverse)
library(lubridate) 
library(readxl)
library(glue)

#Read in the file that includes what we will use for Trip Data, Sample Event Data 
#and Sample Event WQ Data 
# A = list.files(pattern="CEP") %>% 
#   setNames(nm=.) %>%
#   lapply(read_excel) %>%
#   bind_rows(.id = "FileName")%>%
#   mutate(FileName=substr(FileName,1,1)) 


#A1<- read_excel("ACTEST1.943.xlsx")



 
BSWQ<- read.csv("Baywide2023WQ.csv")
BSSH<- read.csv("Baywide2023SH.csv")
BSQ<- read.csv("Baywide2023Quadrat.csv")

head(BSWQ)





A2<- BSQ %>% mutate( Date= format(mdy(Date), "%Y%m%d"),
                    Station= sprintf("%04d", Station))

#Format date and station to build the necessary PKs
BSQ1<- BSQ %>% select(Date,Station,FixedLocationID)
BSQ2<- unique(BSQ1)


#Build the PKs and wrap everything in single quotes so that SQL can read it
TripTable<- data.frame(TripID= paste0("'",A2$Estuary,"SRVY_",A2$Date,"_1","'"),
                   TripType= paste0("'","Survey","'"),
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
                     Station= sprintf("%04d", Station))


SampleEvent<- data.frame(SampleEventID = paste0("'",A2$Estuary,"SRVY_",A2$Date,"_1_",A2$FixedLocationID,"_1","'"),
                 TripID= paste0("'",A2$Estuary,"SRVY_",A2$Date,"_1","'"),
                 FixedLocationID = paste0("'",A2$FixedLocationID,"'"),
                 LatitudeDec = paste0("'",A2$Latitude..DD.,"'"),
                 LongitudeDec = paste0("'",A2$Longitude..DD.,"'"),
                 DataStatus = paste0("'","Proofed","'"),
                 DateEntered = paste0("'",format(Sys.time(),"%Y-%m-%d %H:%M:%OS3"),"'"),
                 EnteredBy =  paste0("'","Berlynna Heres","'"),
                 DateProofed = paste0("'",format(Sys.time(),"%Y-%m-%d %H:%M:%OS3"),"'"),
                 ProofedBy = paste0("'","Berlynna Heres","'")) 

# ,[LatitudeDec]
# ,[LongitudeDec]
# ,{LatitudeDec}
# ,{LongitudeDec}
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
                      Temp..oC.= ifelse(Temp..oC.=="Z",NA, Temp..oC.),
                      Salinity..ppt.= ifelse(Salinity..ppt.=="Z",NA, Salinity..ppt.),
                      DO..mg.L.= ifelse(DO..mg.L.=="Z",NA, DO..mg.L.),
                      pH= ifelse(pH=="Z",NA, pH),
                      Depth..m.= ifelse(Depth..m.=="Z",NA, Depth..m.),
                      Turbidity..FNU.= ifelse(Turbidity..FNU.=="Z",NA, Turbidity..FNU.),
                      Time..hh.mm.= ifelse(Time..hh.mm.=="Z",NA, Time..hh.mm.),
                      Time..hh.mm.= gsub(":", "", Time..hh.mm.),
                      Comments= gsub("'", "", Comments),
                      Comments= gsub(",","", Comments))



                  
SampleEventWQ <- data.frame(SampleEventWQID = paste0("'",A2$Estuary,"SRVY_",A2$Date,"_1_",A2$FixedLocationID,"_1_01","'"),
                    SampleEventID = paste0("'",A2$Estuary,"SRVY_",A2$Date,"_1_",A2$FixedLocationID,"_1","'"),
                    Temperature =  ifelse(is.na(A2$Temp..oC.),"NULL",paste0("'",A2$Temp..oC.,"'")),
                    Salinity = ifelse(is.na(A2$Salinity..ppt.),"NULL",paste0("'",A2$Salinity..ppt.,"'")),
                    DissolvedOxygen = ifelse(is.na(A2$DO..mg.L.),"NULL",paste0("'",A2$DO..mg.L.,"'")),
                    pH = ifelse(is.na(A2$pH),"NULL",paste0("'",A2$pH,"'")),
                    Depth = ifelse(is.na(A2$Depth..m.),"NULL",paste0("'",A2$Depth..m.,"'")),
                    TurbidityYSI = ifelse(is.na(A2$Turbidity..FNU.),"NULL",paste0("'",A2$Turbidity..FNU.,"'")),
                    DataStatus = paste0("'","Proofed","'"),
                    DateEntered = paste0("'",format(Sys.time(),"%Y-%m-%d %H:%M:%OS3"),"'"),
                    EnteredBy =  paste0("'","Berlynna Heres","'"),
                    DateProofed = paste0("'",format(Sys.time(),"%Y-%m-%d %H:%M:%OS3"),"'"),
                    ProofedBy = paste0("'","Berlynna Heres","'"),
                    Comments = paste0("'",paste("Notes =", A2$Comments," DPTH_STRTA =", A2$Depth.Strata, " BOTTOM_TYP =", A2$Bottom.Type, " Class =", A2$Class,"'")),
                    CollectionTime = ifelse(is.na(A2$Time..hh.mm.),"NULL",paste0("'",A2$Time..hh.mm.,"'")))

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

write_lines(SampleEventWQSQL,"SampleEventWQ.sql")



A3<- BSWQ %>% mutate( Date= format(mdy(Date), "%Y%m%d"),
                      Station= sprintf("%04d", Station),
                      SampleEventID = paste0(A2$Estuary,"SRVY_",A2$Date,"_1_",A2$FixedLocationID,"_1")) %>%
  select(SampleEventID,Survey,Date,Estuary,Section,Class,Station,FixedLocationID)

# B = list.files(pattern="1_01___.859") %>% 
#   setNames(nm=.) %>%
#   lapply(read_excel) %>%
#   bind_rows(.id = "FileName") %>%
#   mutate(FileName=substr(FileName,1,1)) 
  


#B1<- read_excel("A1_01___.xlsx")
B2<- BSQ %>%  mutate(Date= format(mdy(Date), "%Y%m%d"),Quadrat= sprintf("%02d", Quadrat),Station= sprintf("%04d", Station),
                     SampleEventID= paste0(Estuary,"SRVY_",Date,"_1_",FixedLocationID,"_1")) 
 
B3<- left_join(B2,A3, by= c("SampleEventID","Survey","Date","Estuary","Section","Class","Station","FixedLocationID"))

B3<- B3 %>% mutate(Quadrat= ifelse(is.na(Quadrat),"00",Quadrat))

SurveyQuadrat<- data.frame(QuadratID = paste0("'",B3$Estuary,"SRVY_",B3$Date,"_1_",B3$FixedLocationID,"_1_",B3$Quadrat,"'"),
                SampleEventID = paste0("'",B3$Estuary,"SRVY_",B3$Date,"_1_",B3$FixedLocationID,"_1","'"),
                QuadratNumber = paste0("'",B3$Quadrat,"'"),
                NumLive= ifelse(is.na(B3$X1.4.m2..Live),"NULL",paste0("'",B3$X1.4.m2..Live,"'")),
                NumDead=ifelse(is.na(B3$X1.4.m2..Dead),"NULL",paste0("'",B3$X1.4.m2..Dead,"'")),
                TotalVolume = ifelse(is.na(B3$Volume..L.),"NULL",paste0("'",B3$Volume..L.,"'")),
                TotalWeight = ifelse(is.na(B3$Weight..kg.),"NULL",paste0("'",B3$Weight..kg.,"'")),
                NumDrills = ifelse(is.na(B3$X..Drills),"NULL",paste0("'",B3$X..Drills,"'")),
                DataStatus = paste0("'","Proofed","'"),
                DateEntered = paste0("'",format(Sys.time(),"%Y-%m-%d %H:%M:%OS3"),"'"),
                EnteredBy =  paste0("'","Berlynna Heres","'"),
                DateProofed = paste0("'",format(Sys.time(),"%Y-%m-%d %H:%M:%OS3"),"'"),
                ProofedBy = paste0("'","Berlynna Heres","'"),
                Comments = paste0("'",paste("Notes =", B3$Comments),paste("Conch =", B3$X..Conch),paste("Class =", B3$Class),"'"))#,
                #Station= sprintf("%04d", B3$STATION))


#C1<-  read_excel("A1201001.943.xlsx")
#C2<-  read_excel("A1201002.943.xlsx")
#C3<-  read_excel("A1201003.943.xlsx")
#C4<-  read_excel("A1201004.943.xlsx")

#C5<- bind_rows(C1,C2,C3,C4)

# C = list.files(pattern="12010") %>%
#   setNames(nm=.) %>%
#   lapply(read_excel) %>%
#   bind_rows(.id = "FileName") %>%
#   mutate(FileName=substr(FileName,1,1))
# 
# C1<- C %>% mutate(Station= sprintf("%04d", STATION),
#                    QuadratNumber= paste0("'",QDRT,"'"),
#                    NumLive= LIVE,
#                    NumDead= DEAD) %>%
#   select(Station,QuadratNumber,NumLive,NumDead)
# 
# SurveyQuadrat<- left_join(SQ,C1, by= c("Station","QuadratNumber")) %>%
#   mutate(NumLive= ifelse(is.na(NumLive),"NULL",paste0("'",NumLive,"'")),
#          NumDead=ifelse(is.na(NumDead),"NULL",paste0("'",NumDead,"'")))



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

write_lines(SurveyQuadratSQL,"SurveyQuadrat.sql")


# D = list.files(pattern="11010") %>% 
#   setNames(nm=.) %>%
#   lapply(read_excel) %>%
#   bind_rows(.id = "FileName") %>%
#   mutate(FileName=substr(FileName,1,1)) %>%
#   group_by(FileName)


#D1<-  read_excel("A1101001.943.xlsx")
#D2<-  read_excel("A1101002.943.xlsx")
#D3<-  read_excel("A1101003.943.xlsx")

#D4<- bind_rows(D1,D2,D3)
D2<- BSSH %>%  mutate(Date= format(mdy(Date), "%Y%m%d"),Quadrat= sprintf("%02d", Quadrat..1.4.m2.),Station= sprintf("%04d", Station),
                     SampleEventID= paste0(Estuary,"SRVY_",Date,"_1_",FixedLocationID,"_1")) 

D1<- left_join(D2,A3, by= c("SampleEventID","Survey","Date","Estuary","Section","Class","Station","FixedLocationID"))

D2<- D1 %>% mutate(Quadrat= ifelse(is.na(Quadrat),"00",Quadrat),
                   QuadratID=paste0(D2$Estuary,"SRVY_",D2$Date,"_1_",D2$FixedLocationID,"_1_",D2$Quadrat))%>%
  group_by(QuadratID) %>% mutate(Qnum= sprintf("%02d", row_number()), Qnum= ifelse(Quadrat== "00", "00", Qnum)) %>% ungroup()


# D1<- D %>% mutate(Station= sprintf("%04d", STATION), 
#                    Quadrat= sprintf("%02d", QDRT),
#                    ShellNumber= sprintf("%03d",OYSTER_NUM))
# 
# D2<- left_join(D1,B3, by= c("Station", "FileName","STATION","QDRT","Quadrat"))

SurveySH<- data.frame(ShellHeightID = paste0("'",D2$Estuary,"SRVY_",D2$Date,"_1_",D2$FixedLocationID,"_1_",D2$Quadrat,"_",D2$Qnum,"'"),
                QuadratID = paste0("'",D2$Estuary,"SRVY_",D2$Date,"_1_",D2$FixedLocationID,"_1_",D2$Quadrat,"'"),
                ShellHeight = ifelse(is.na(D2$SH..mm.),"NULL",paste0("'",D2$SH..mm.,"'")),
                DataStatus = paste0("'","Proofed","'"),
                DateEntered = paste0("'",format(Sys.time(),"%Y-%m-%d %H:%M:%OS3"),"'"),
                EnteredBy =  paste0("'","Berlynna Heres","'"),
                DateProofed = paste0("'",format(Sys.time(),"%Y-%m-%d %H:%M:%OS3"),"'"),
                ProofedBy = paste0("'","Berlynna Heres","'"),
                Comments = paste0("'",paste("Class =", D2$Class),"'"))


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

write_lines(SurveySHSQL,"SurveySH.sql")