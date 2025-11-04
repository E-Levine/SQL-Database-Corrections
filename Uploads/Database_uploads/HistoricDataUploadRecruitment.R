setwd("C:/Users/Berlynna.Heres/Desktop/TempOyster")

library(tidyverse)
library(lubridate) 
library(readxl)
library(glue)

R<- read.csv("SSR.csv")
RWQ<- read.csv("SSRWQ.csv")


head(RWQ)





A2<- RWQ %>% mutate( Date= format(mdy(Date), "%Y%m%d"),
                     Station= sprintf("%04d", Station),
                     Estuary = "SS") %>% filter(!is.na(Date))


#Format date and station to build the necessary PKs
#BSQ1<- BSQ %>% select(Date,Station,FixedLocationID)
#BSQ2<- unique(BSQ1)


#Build the PKs and wrap everything in single quotes so that SQL can read it
TripTable<- data.frame(TripID= paste0("'",A2$Estuary,"RCRT_",A2$Date,"_1","'"),
                       TripType= paste0("'","Recruitment","'"),
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




A2<- RWQ %>% mutate( Date= format(mdy(Date), "%Y%m%d"),
                      Station= sprintf("%04d", Station),
                      Estuary = "SS",
                     FixedLocationID = sprintf("%04d",FixedLocationID))


SampleEvent<- data.frame(SampleEventID = paste0("'",A2$Estuary,"RCRT_",A2$Date,"_1_",A2$FixedLocationID,"_1","'"),
                         TripID= paste0("'",A2$Estuary,"RCRT_",A2$Date,"_1","'"),
                         FixedLocationID = paste0("'",A2$FixedLocationID,"'"),
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
           ,[DataStatus]
           ,[DateEntered]
           ,[EnteredBy]
           ,[DateProofed]
           ,[ProofedBy])
     VALUES
           ({SampleEventID}
           ,{TripID}
           ,{FixedLocationID}
           ,{DataStatus}
           ,{DateEntered}
           ,{EnteredBy}
           ,{DateProofed}
           ,{ProofedBy})
GO"


SampleEventSQL <- glue(SampleEventtemplate, .envir = SampleEvent)

write_lines(SampleEventSQL,"SampleEvent.sql")




A2<- RWQ %>% mutate( Date= format(mdy(Date), "%Y%m%d"),
                      Station= sprintf("%04d", Station),
                      Estuary = "SS",
                      Temp= ifelse(Temp..oC.=="Z",NA, Temp..oC.),
                      Salinity= ifelse(Salinity..ppt.=="Z",NA,
                                       ifelse(Salinity..ppt. == "N", 0, Salinity..ppt.)),
                      DO= ifelse(DO..mg.L.=="Z",NA,
                                                      ifelse(DO..mg.L. == "N", 0, DO..mg.L.)),
                      pH= ifelse(pH=="Z",NA, pH),
                      Depth..m.= ifelse(Depth..m.=="Z",NA, Depth..m.),
                      Turbidity..FNU.= ifelse(Turbidity..FNU.=="Z",NA, Turbidity..FNU.),
                     FixedLocationID = sprintf("%04d",FixedLocationID),
                     Comments= paste0("Crown Conch =",Crown.Conch)) %>%
  filter(!is.na(Date))




SampleEventWQ <- data.frame(SampleEventWQID = paste0("'",A2$Estuary,"RCRT_",A2$Date,"_1_",A2$FixedLocationID,"_1_01","'"),
                            SampleEventID = paste0("'",A2$Estuary,"RCRT_",A2$Date,"_1_",A2$FixedLocationID,"_1","'"),
                            Temperature =  ifelse(is.na(A2$Temp),"NULL",paste0("'",A2$Temp,"'")),
                            Salinity = ifelse(is.na(A2$Salinity),"NULL",paste0("'",A2$Salinity,"'")),
                            DissolvedOxygen = ifelse(is.na(A2$DO),"NULL",paste0("'",A2$DO,"'")),
                            pH = ifelse(is.na(A2$pH),"NULL",paste0("'",A2$pH,"'")),
                            Depth = ifelse(is.na(A2$Depth..m.),"NULL",paste0("'",A2$Depth..m.,"'")),
                            TurbidityYSI = ifelse(is.na(A2$Turbidity..FNU.),"NULL",paste0("'",A2$Turbidity..FNU.,"'")),
                            DataStatus = paste0("'","Proofed","'"),
                            DateEntered = paste0("'",format(Sys.time(),"%Y-%m-%d %H:%M:%OS3"),"'"),
                            EnteredBy =  paste0("'","Berlynna Heres","'"),
                            DateProofed = paste0("'",format(Sys.time(),"%Y-%m-%d %H:%M:%OS3"),"'"),
                            ProofedBy = paste0("'","Berlynna Heres","'"),
                            Comments = paste0("'",A2$Comments,"'"))

SampleEventWQ<- unique(SampleEventWQ)

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


###################### Recruitment ####################################

R1<- R %>% mutate(date= format(mdy(Ret.Date), "%Y%m%d"),
                  Date= as.Date(Ret.Date, format= "%m/%d/%Y"),
                  DeployedDate = Date- Num.Days,
                  Station= sprintf("%04d", Station),
                  Estuary = "SS",
                  FixedLocationID = sprintf("%04d",FixedLocationID),
                  SampleEventID = paste0(Estuary,"RCRT_",date,"_1_",FixedLocationID,"_1"),
                  NumTop= ifelse(X..Top %in% c("z","Z",""),NA,X..Top),
                  NumBottom= ifelse(X..Bottom %in% c("z","Z",""),NA,X..Bottom),
                  NumTop= as.numeric(NumTop),
                  NumBottom= as.numeric(NumBottom),
                  Comments= ifelse(Notes %in% c(""," "), NA, Notes))%>%
  arrange(SampleEventID, Rep,Shell)%>%
  group_by(SampleEventID) %>% mutate(Rnum= sprintf("%02d", row_number())) %>% ungroup() %>%
  mutate(ShellID= paste0(SampleEventID,"_",Rnum))






Recruitment<- data.frame(ShellID = paste0("'",R1$ShellID,"'"),
                  SampleEventID = paste0("'",R1$SampleEventID,"'"),
                  DeployedDate = ifelse(is.na(R1$DeployedDate),"NULL",paste0("'",R1$DeployedDate,"'")),
                  ShellReplicate = ifelse(is.na(R1$Rep),"NULL",paste0("'",R1$Rep,"'")),
                  ShellPosition = ifelse(is.na(R1$Shell),"NULL",paste0("'",R1$Shell,"'")),
                  NumTop = ifelse(is.na(R1$NumTop),"NULL",paste0("'",R1$NumTop,"'")),
                  NumBottom = ifelse(is.na(R1$NumBottom),"NULL",paste0("'",R1$NumBottom,"'")),
                  DataStatus = paste0("'","Proofed","'"),
                  DateEntered = paste0("'",format(Sys.time(),"%Y-%m-%d %H:%M:%OS3"),"'"),
                  EnteredBy =  paste0("'","Berlynna Heres","'"),
                  DateProofed = paste0("'",format(Sys.time(),"%Y-%m-%d %H:%M:%OS3"),"'"),
                  ProofedBy = paste0("'","Berlynna Heres","'"),
                  Comments = ifelse(is.na(R1$Comments),"NULL",paste0("'",R1$Comments,"'")))



Rtemplate<- "INSERT INTO [dbo].[Recruitment]
           ([ShellID]
           ,[SampleEventID]
           ,[DeployedDate]
           ,[ShellReplicate]
           ,[ShellPosition]
           ,[NumTop]
           ,[NumBottom]
           ,[DataStatus]
           ,[DateEntered]
           ,[EnteredBy]
           ,[DateProofed]
           ,[ProofedBy]
           ,[Comments])
     VALUES
           ({ShellID}
           ,{SampleEventID}
           ,{DeployedDate}
           ,{ShellReplicate}
           ,{ShellPosition}
           ,{NumTop}
           ,{NumBottom}
           ,{DataStatus}
           ,{DateEntered}
           ,{EnteredBy}
           ,{DateProofed}
           ,{ProofedBy}
           ,{Comments})
GO"



RSQL <- glue(Rtemplate, .envir = Recruitment)

write_lines(RSQL,"R.sql")