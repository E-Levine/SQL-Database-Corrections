##Code to compile SQL code from Excel data for upload
#Work with one estuary * one table at a time I.e., TBRCRT.
#
#Select appropriate template file, enter data into copied file, and save to 'Data' folder before running R code.
#Code will output SQL file into main folder.
#Current data uploads supported: SampleEventWQ, SurveySH, COLL-Dermo
#
#Load required packages
if (!require("pacman")) {install.packages("pacman")}
pacman::p_load(plyr, tidyverse, #Df manipulation, basic summary
               readxl, janitor,
               glue, #SQL
               install = TRUE) #Mapping and figures
#
#Initials of person adding data
Initials <- c("EW")
#Set type of data being added (WQ, TripInfo, SrvySH, Dermo, Repro) and Year (YYYY) in which data was recorded - used only for file naming 
Type_Data <- c("Repro") #Only used for file naming
Data_Year <- c("2025")
Data_Month <- c("09") #For file output name
#Set either 'update' for updating existing data or 'upload' for new data
Correction_needed <- c("upload")
#
###Load data file - change file name, confirm sheet name
Excel_data <- read_excel("../Data/COLL_REPRO_TEMPLATE.xlsx", sheet = "Template", #File name and sheet name
                         skip = 0, col_names = TRUE, col_types = "text", #How many rows to skip at top; are column names to be used
                         na = c(""), trim_ws = TRUE, #Values/placeholders for NAs; trim extra white space
                         .name_repair = "unique")
#Convert Entered/Proofed dates to date value
Excel_data <- Excel_data %>% 
  mutate(DateEntered = format(excel_numeric_to_date(as.numeric(DateEntered), date_system = "modern"),"%Y-%m-%d %H:%M:%OS7"),
         DateProofed = case_when(!is.na(DateProofed) ~ format(excel_numeric_to_date(as.numeric(DateProofed), date_system = "modern"),"%Y-%m-%d %H:%M:%OS7"),
                                 TRUE ~ 'NULL'))
#Check data
head(Excel_data)
#
##Convert columns to numeric than back to character to remove extra numbers and fill missing values with NULL
if(Type_Data == "WQ"){
  #WQ
  Excel_data <- Excel_data %>% 
    mutate(across(any_of(c("Temperature", "Salinity", "DissolvedOxygen", "pH", "Depth", "SampleDepth", "Secchi", "TurbidityYSI", "TurbidityHach", "PercentDissolvedOxygen")), as.numeric)) %>%
    mutate(across(any_of(c("Temperature", "Salinity", "DissolvedOxygen", "pH", "Depth", "SampleDepth", "Secchi", "TurbidityYSI", "TurbidityHach", "PercentDissolvedOxygen")), ~as.character(.) %>% replace_na('NULL')))
} else if(Type_Data == "Dermo"){
  Excel_data <- Excel_data %>% mutate(across(any_of(c("ShellHeight", "ShellLength", "ShellWidth", "TotalWeight", "ShellWetWeight", "DermoGill", "DermoMantle")), as.numeric)) %>%
    mutate(across(any_of(c("ShellHeight", "ShellLength", "ShellWidth", "TotalWeight", "ShellWetWeight", "DermoGill", "DermoMantle")), ~as.character(.) %>% replace_na('NULL')))
} else if(Type_Data == "SrvySH" | Type_Data == "Repro"){
  message("No data changes made.")
}
#Extract parameter for file output
Estuary <- Excel_data[1,1] %>% substr(1,2)
if(Type_Data == "Dermo"){
  DataType <- "Dermo"
  message("Skip to the 'Dermo' section.")
} else if(Type_Data == "Repro"){
  DataType <- "Repro"
  message("Skip to the 'Repro' section.")
} else {
  DataType <- Excel_data[1,1] %>% substr(3,6)
  message(paste0("Skip to the '", DataType, "' section."))
}
#
#####Sample Event Water Quality Data####
#
##Create empty data frame to fill
SampleEventWQ <- data.frame(matrix(ncol = 24, nrow = 0))
Excel_data <- Excel_data %>% 
  mutate(DateCompleted = 'NULL', CompletedBy = 'NULL') %>%
  dplyr::select(SampleEventWQID, SampleEventID, Temperature, Salinity, DissolvedOxygen, pH, Depth, SampleDepth, Secchi, TurbidityYSI, TurbidityHach, DataStatus, DateEntered, EnteredBy, DateProofed, ProofedBy, DateCompleted, CompletedBy, Comments, AdminNotes, CollectionTime, PercentDissolvedOxygen, YSICalibration, YSINotes)
head(Excel_data)
#
#Modify data frame of data to upload
Is_Proofed <- c("Y") #Should data status be changed to "Proofed"? Y/N
Proofed_By <- c("Erica Williams") #ProofedBy name
AdminNote <- c(NA) #Anything to add as an Admin Note to ALL rows of data? If none, = "none"
#
Excel_data_updated <- Excel_data %>% 
  mutate(SampleEventWQID = paste0("'", SampleEventWQID, "'"),
         SampleEventID = paste0("'", SampleEventID, "'"),
         Temperature = paste0("'", Temperature, "'"),
         Salinity = paste0("'", Salinity, "'"),
         DissolvedOxygen = paste0("'", DissolvedOxygen, "'"),
         pH = paste0("'", pH, "'"),
         Depth = paste0("'", Depth, "'"),
         SampleDepth = paste0("'", SampleDepth, "'"),
         Secchi = paste0("'", Secchi, "'"),
         TurbidityYSI = paste0("'", TurbidityYSI, "'"),
         TurbidityHach = paste0("'", TurbidityHach, "'"),
         DataStatus = case_when(Is_Proofed == "Y" & DataStatus == "Entered" ~ paste0("'", "Proofed", "'"), 
                                Is_Proofed == "N" & DataStatus == "Proofed" ~ paste0("'", "Proofed", "'"),
                                TRUE ~ paste0("'","Entered","'")),
         DateEntered = paste0("'", DateEntered, "'"),
         EnteredBy = paste0("'", EnteredBy, "'"),
         DateProofed = case_when(Is_Proofed == "Y" ~ paste0("'", ymd(Sys.Date()), "'"), 
                                 Is_Proofed == "N" & DateProofed != "NULL" ~ paste0("'", DateProofed, "'"), 
                                 TRUE ~ paste('NULL')),
         ProofedBy = case_when(Is_Proofed == "Y" ~ paste0("'", Proofed_By, "'"), 
                               Is_Proofed == "N" &  ProofedBy != 'NULL' ~ paste0("'", ProofedBy, "'"), 
                               TRUE ~ paste('NULL')),
         DateCompleted = paste0('NULL'),
         CompletedBy = paste0('NULL'),
         Comments = case_when(Comments == "NULL" | is.na(Comments) ~ paste0("NULL"), Comments == '0' ~  paste('NULL'), TRUE ~ paste0("'", Comments, "'")),
         AdminNotes = case_when(AdminNote != "none" ~ paste0("'", AdminNote, "'"), TRUE ~ paste0("'", AdminNotes, "'")),
         CollectionTime = paste0("'", CollectionTime, "'"),
         PercentDissolvedOxygen = paste0("'", PercentDissolvedOxygen, "'"),
         YSICalibration = paste0("'", YSICalibration, "'"),
         YSINotes = paste0("'", YSINotes, "'"))
#
#Fill data frame with information
SampleEventWQ <- if(exists("SampleEventWQ") & class(SampleEventWQ) == "data.frame"){
  rm(SampleEventWQ)
  SampleEventWQ <- data.frame(matrix(ncol = 24, nrow = 0))
  rbind(SampleEventWQ, Excel_data_updated, stringsAsFactors = FALSE)
} else {
  rbind(SampleEventWQ, Excel_data_updated, stringsAsFactors = FALSE)
}
#
#SQL base template code - confirm location of data (dbo/hsdb) in first line 
if(tolower(Correction_needed) == "upload"){
  SEWQSQLheader <- "
INSERT INTO [dbo].[SampleEventWQ]
    ([SampleEventWQID]
      ,[SampleEventID]
      ,[Temperature]
      ,[Salinity]
      ,[DissolvedOxygen]
      ,[pH]
      ,[Depth]
      ,[SampleDepth]
      ,[Secchi]
      ,[TurbidityYSI]
      ,[TurbidityHach]
      ,[DataStatus]
      ,[DateEntered]
      ,[EnteredBy]
      ,[DateProofed]
      ,[ProofedBy]
      ,[DateCompleted]
      ,[CompletedBy]
      ,[Comments]
      ,[AdminNotes]
      ,[CollectionTime]
      ,[PercentDissolvedOxygen]
      ,[YSICalibration]
      ,[YSINotes])
  VALUES"
  temp <- character(length(nrow(SampleEventWQ)))
  for(i in 1:nrow(SampleEventWQ)){
    temp[i] <- paste0(SEWQSQLheader, "\n      (",paste(SampleEventWQ[i,], collapse = "\n      ,"), ")\n GO")
  }
} else if(tolower(Correction_needed) == "update"){
  temp <- character(nrow(SampleEventWQ))
  for(i in 1:nrow(SampleEventWQ)){
    temp[i] <- paste0("\nUPDATE [dbo].[SampleEventWQ]", 
                      "\nSET [Temperature] = ", SampleEventWQ$Temperature[i],",",
                      "\n[Salinity] = ", SampleEventWQ$Salinity[i],",",
                      "\n[DissolvedOxygen] = ", SampleEventWQ$DissolvedOxygen[i],",",
                      "\n[pH] = ", SampleEventWQ$pH[i],",",
                      "\n[Depth] = ", SampleEventWQ$Depth[i],",",
                      "\n[SampleDepth] = ", SampleEventWQ$SampleDepth[i],",",
                      "\n[Secchi] = ", SampleEventWQ$Secchi[i],",",
                      "\n[TurbidityYSI] = ", SampleEventWQ$TurbidityYSI[i],",",
                      "\n[TurbidityHach] = ", SampleEventWQ$TurbidityHach[i],",",
                      "\n[DataStatus] = ", SampleEventWQ$DataStatus[i],",",
                      "\n[DateEntered] = ", SampleEventWQ$DateEntered[i],",",
                      "\n[EnteredBy] = ", SampleEventWQ$EnteredBy[i],",",
                      "\n[DateProofed] = ", SampleEventWQ$DateProofed[i],",",
                      "\n[ProofedBy] = ", SampleEventWQ$ProofedBy[i],",",
                      "\n[CollectionTime] = ", SampleEventWQ$CollectionTime[i],",",
                      "\n[PercentDissolvedOxygen] = ", SampleEventWQ$PercentDissolvedOxygen[i],",",
                      "\n[YSICalibration] = ", SampleEventWQ$YSICalibration[i],",",
                      "\n[YSINotes] = ", SampleEventWQ$YSINotes[i],",",
                      "\n[Comments] = ", SampleEventWQ$Comments[i],
                      "\nWHERE [SampleEventWQID] = ", SampleEventWQ$SampleEventWQID[i])  
  }
}
#
SEWQ_SQL <- paste(temp, collapse = "\n\n")
#
#Save SQL code
write_lines(SEWQ_SQL, paste0("../", Estuary, "_", DataType, "_", Type_Data, "_", Data_Year, "_", Data_Month, "_", Initials, ".sql"))
#
#

#####Survey Shell Height Data####
#
##Create empty data frame to fill
SrvySH <- data.frame(matrix(ncol = 12, nrow = 0))
Excel_data <- Excel_data %>% 
  mutate(DateCompleted = 'NULL', CompletedBy = 'NULL')
head(Excel_data)

#
#Modify data frame of data to upload
Is_Proofed <- c("Y") #Should data status be changed to "Proofed"? Y/N - 'N' if already marked as proofed
Proofed_By <- c("Erica Williams") #ProofedBy name
AdminNote <- c("none") #Anything to add as an Admin Note to ALL rows of data? If none, = "none"
#
Excel_data_updated <- Excel_data %>% 
  mutate(ShellHeightID = paste0("'", ShellHeightID, "'"),
         QuadratID = paste0("'", QuadratID, "'"),
         ShellHeight = as.numeric(ShellHeight),
         DataStatus = case_when(Is_Proofed == "Y" & DataStatus == "Entered" ~ paste0("'", "Proofed", "'"), 
                                Is_Proofed == "N" & DataStatus == "Proofed" ~ paste0("'", "Proofed", "'"),
                                TRUE ~ paste0("'","Entered","'")),
         DateEntered = paste0("'", DateEntered, "'"),
         EnteredBy = paste0("'", EnteredBy, "'"),
         DateProofed = case_when(Is_Proofed == "Y" ~ paste0("'", ymd(Sys.Date()), "'"), 
                                 Is_Proofed == "N" & DateProofed != "NULL" ~ paste0("'", DateProofed, "'"), 
                                 TRUE ~ paste('NULL')),
         ProofedBy = case_when(Is_Proofed == "Y" ~ paste0("'", Proofed_By, "'"), 
                               Is_Proofed == "N" &  ProofedBy != 'NULL' ~ paste0("'", ProofedBy, "'"), 
                               TRUE ~ paste('NULL')),
         DateCompleted = paste0('NULL'),
         CompletedBy = paste0('NULL'),
         Comments = case_when(Comments == "NULL" | is.na(Comments) ~ paste0("NULL"), Comments == '0' ~  paste('NULL'), TRUE ~ paste0("'", Comments, "'")),
         AdminNotes = case_when(AdminNote != "none" ~ paste0("'", AdminNote, "'"), TRUE ~ paste('NULL')))
#
#Fill data frame with information
SrvySH <- if(exists("SrvySH") & class(SrvySH) == "data.frame"){
  rm(SrvySH)
  SrvySH <- data.frame(matrix(ncol = 12, nrow = 0))
  rbind(SrvySH, Excel_data_updated, stringsAsFactors = FALSE)
} else {
  rbind(SrvySH, Excel_data_updated, stringsAsFactors = FALSE)
}
#
#SQL base template code - confirm location of data (dbo/hsdb) in first line 
if(tolower(Correction_needed) == "upload"){
  SRVYSH_SQLheader <- "
INSERT INTO [dbo].[SurveySH]
    ([ShellHeightID]
      ,[QuadratID]
      ,[ShellHeight]
      ,[DataStatus]
      ,[DateEntered]
      ,[EnteredBy]
      ,[DateProofed]
      ,[ProofedBy]
      ,[DateCompleted]
      ,[CompletedBy]
      ,[Comments]
      ,[AdminNotes])
  VALUES"
  #
  temp <- character(length(nrow(SrvySH)))
  for(i in 1:nrow(SrvySH)){
    temp[i] <- paste0(SRVYSH_SQLheader, "\n      (",paste(SrvySH[i,], collapse = "\n      ,"), ")\n GO")
  }
  #
} else if(tolower(Correction_needed) == "update"){
  temp <- character(nrow(SrvySH))
  for(i in 1:nrow(SrvySH)){
    temp[i] <- paste0("\nUPDATE [dbo].[SurveySH]", 
                      "\nSET [ShellHeight] = ", SrvySH$ShellHeight[i],",",
                      "\n[DataStatus] = ", SrvySH$DataStatus[i],",",
                      "\n[DateEntered] = ", SrvySH$DateEntered[i],",",
                      "\n[EnteredBy] = ", SrvySH$EnteredBy[i],",",
                      "\n[DateProofed] = ", SrvySH$DateProofed[i],",",
                      "\n[ProofedBy] = ", SrvySH$ProofedBy[i],",",
                      "\n[Comments] = ", SrvySH$Comments[i],
                      "\nWHERE [ShellHeightID] = ", SrvySH$ShellHeightID[i])  
  }
}
#
SRVYSH_SQL <- paste(temp, collapse = "\n\n")
#
#Save SQL code
write_lines(SRVYSH_SQL, paste0("../", Estuary, "_", DataType, "_", Type_Data, "_", Data_Year, "_", Data_Month, "_", Initials, ".sql"))
#
#
#####Collections Dermo Data####
#
##Create empty data frame to fill
Dermo <- data.frame(matrix(ncol = 18, nrow = 0))
Excel_data <- Excel_data %>% 
  mutate(DateCompleted = 'NULL', CompletedBy = 'NULL') %>%
  dplyr::select(OysterID, SampleEventID, ShellHeight, ShellLength, ShellWidth, TotalWeight, ShellWetWeight, DermoMantle, DermoGill, DataStatus, DateEntered, EnteredBy, DateProofed, ProofedBy, DateCompleted, CompletedBy, Comments, AdminNotes)
head(Excel_data)
#
#Modify data frame of data to upload
Is_Proofed <- c("N") #Should data status be changed to "Proofed"? Y/N - 'N' if already marked as proofed
Proofed_By <- c(NULL) #ProofedBy name
AdminNote <- c("none") #Anything to add as an Admin Note to ALL rows of data? If none, = "none"
#
Excel_data_updated <- Excel_data %>% 
  mutate(OysterID = paste0("'", OysterID, "'"),
         SampleEventID = paste0("'", SampleEventID, "'"),
         ShellHeight = paste0(ShellHeight),
         ShellLength = paste0(ShellLength),
         ShellWidth = paste0(ShellWidth),
         TotalWeight = paste0(TotalWeight),
         ShellWetWeight = paste0(ShellWetWeight),
         DermoMantle = paste0(DermoMantle),
         DermoGill = paste0(DermoGill),
         DataStatus = case_when(Is_Proofed == "Y" & DataStatus == "Entered" ~ paste0("'", "Proofed", "'"), 
                                Is_Proofed == "N" & DataStatus == "Proofed" ~ paste0("'", "Proofed", "'"),
                                TRUE ~ paste0("'","Entered","'")),
         DateEntered = paste0("'", DateEntered, "'"),
         EnteredBy = paste0("'", EnteredBy, "'"),
         DateProofed = case_when(Is_Proofed == "Y" ~ paste0("'", ymd(Sys.Date()), "'"), 
                                 Is_Proofed == "N" & DateProofed != "NULL" ~ paste0("'", DateProofed, "'"), 
                                 TRUE ~ paste('NULL')),
         ProofedBy = case_when(Is_Proofed == "Y" ~ paste0("'", Proofed_By, "'"), 
                               Is_Proofed == "N" &  ProofedBy != 'NULL' ~ paste0("'", ProofedBy, "'"), 
                               TRUE ~ paste('NULL')),
         DateCompleted = paste0('NULL'),
         CompletedBy = paste0('NULL'),
         Comments = case_when(Comments == "NULL" | is.na(Comments) ~ paste0("NULL"), Comments == '0' ~  paste('NULL'), TRUE ~ paste0("'", Comments, "'")),
         AdminNotes = case_when(AdminNote != "none" ~ paste0("'", AdminNote, "'"), TRUE ~ paste0("'", AdminNotes, "'")))
#
#Fill data frame with information
Dermo <- if(exists("Dermo") & class(Dermo) == "data.frame"){
  rm(Dermo)
  Dermo <- data.frame(matrix(ncol = 18, nrow = 0))
  rbind(Dermo, Excel_data_updated, stringsAsFactors = FALSE)
  } else {
  rbind(Dermo, Excel_data_updated, stringsAsFactors = FALSE)
  }
#
#SQL base template code - confirm location of data (dbo/hsdb) in first line 
if(tolower(Correction_needed) == "upload"){
  Dermo_SQLheader <- "
INSERT INTO [dbo].[Dermo]
    ([OysterID]
      ,[SampleEventID]
      ,[ShellHeight]
      ,[ShellLength]
      ,[ShellWidth]
      ,[TotalWeight]
      ,[ShellWetWeight]
      ,[DermoMantle]
      ,[DermoGill]
      ,[DataStatus]
      ,[DateEntered]
      ,[EnteredBy]
      ,[DateProofed]
      ,[ProofedBy]
      ,[DateCompleted]
      ,[CompletedBy]
      ,[Comments]
      ,[AdminNotes])
  VALUES"
  #
  temp <- character(length(nrow(Dermo)))
  for(i in 1:nrow(Dermo)){
    temp[i] <- paste0(Dermo_SQLheader, "\n      (",paste(Dermo[i,], collapse = "\n      ,"), ")\n GO")
  }
  #
} else if(tolower(Correction_needed) == "update"){
  temp <- character(nrow(Dermo))
  for(i in 1:nrow(Dermo)){
    temp[i] <- paste0("\nUPDATE [dbo].[Dermo]", 
                      "\nSET [ShellHeight] = ", Dermo$ShellHeight[i],",",
                      "\n[ShellLength] = ", Dermo$ShellLength[i],",",
                      "\n[ShellWidth] = ", Dermo$ShellWidth[i],",",
                      "\n[TotalWeight] = ", Dermo$TotalWeight[i],",",
                      "\n[ShellWetWeight] = ", Dermo$ShellWetWeight[i],",",
                      "\n[DermoMantle] = ", Dermo$DermoMantle[i],",",
                      "\n[DermoGill] = ", Dermo$DermoGill[i],",",
                      "\n[DataStatus] = ", Dermo$DataStatus[i],",",
                      "\n[DateEntered] = ", Dermo$DateEntered[i],",",
                      "\n[EnteredBy] = ", Dermo$EnteredBy[i],",",
                      "\n[DateProofed] = ", Dermo$DateProofed[i],",",
                      "\n[ProofedBy] = ", Dermo$ProofedBy[i],",",
                      "\n[Comments] = ", Dermo$Comments[i],
                      "\nWHERE [OysterID] = ", Dermo$OysterID[i])  
  }
}
#
Dermo_SQL <- paste(temp, collapse = "\n\n")
#
#Save SQL code
write_lines(Dermo_SQL, paste0("../", Estuary, "_", Type_Data, "_", DataType, "_", Data_Year, "_", Data_Month, "_", Initials, ".sql"))
#
#
#####Collections Repro Data####
#
##Create empty data frame to fill
Repro <- data.frame(matrix(ncol = 15, nrow = 0))
Excel_data <- Excel_data %>% 
  mutate(DateCompleted = 'NULL', CompletedBy = 'NULL') %>%
  dplyr::select(OysterID, SampleEventID, Sex, ReproStage, Parasite, BadSlide, DataStatus, DateEntered, EnteredBy, DateProofed, ProofedBy, DateCompleted, CompletedBy, Comments, AdminNotes)
head(Excel_data)
#
#Modify data frame of data to upload
Is_Proofed <- c("N") #Should data status be changed to "Proofed"? Y/N - 'N' if already marked as proofed
Proofed_By <- c(NULL) #ProofedBy name
AdminNote <- c("none") #Anything to add as an Admin Note to ALL rows of data? If none, = "none"
#
Excel_data_updated <- Excel_data %>% 
  mutate(OysterID = paste0("'", OysterID, "'"),
         SampleEventID = paste0("'", SampleEventID, "'"),
         Sex = paste0("'", Sex, "'"),
         ReproStage = paste0("'", ReproStage, "'"),
         Parasite = paste0("'", Parasite, "'"),
         BadSlide = paste0("'", BadSlide, "'"),
         DataStatus = case_when(Is_Proofed == "Y" & DataStatus == "Entered" ~ paste0("'", "Proofed", "'"), 
                                Is_Proofed == "N" & DataStatus == "Proofed" ~ paste0("'", "Proofed", "'"),
                                TRUE ~ paste0("'","Entered","'")),
         DateEntered = paste0("'", DateEntered, "'"),
         EnteredBy = paste0("'", EnteredBy, "'"),
         DateProofed = case_when(Is_Proofed == "Y" ~ paste0("'", ymd(Sys.Date()), "'"), 
                                 Is_Proofed == "N" & DateProofed != "NULL" ~ paste0("'", DateProofed, "'"), 
                                 TRUE ~ paste('NULL')),
         ProofedBy = case_when(Is_Proofed == "Y" ~ paste0("'", Proofed_By, "'"), 
                               Is_Proofed == "N" &  ProofedBy != 'NULL' ~ paste0("'", ProofedBy, "'"), 
                               TRUE ~ paste('NULL')),
         DateCompleted = paste0('NULL'),
         CompletedBy = paste0('NULL'),
         Comments = case_when(Comments == "NULL" | is.na(Comments) ~ paste0("NULL"), Comments == '0' ~  paste('NULL'), TRUE ~ paste0("'", Comments, "'")),
         AdminNotes = case_when(AdminNote != "none" ~ paste0("'", AdminNote, "'"), TRUE ~ paste0("'", AdminNotes, "'")))
#
#Fill data frame with information
Repro <- if(exists("Repro") & class(Repro) == "data.frame"){
  rm(Repro)
  Repro <- data.frame(matrix(ncol = 15, nrow = 0))
  rbind(Repro, Excel_data_updated, stringsAsFactors = FALSE)
} else {
  rbind(Repro, Excel_data_updated, stringsAsFactors = FALSE)
  }
#
#SQL base template code - confirm location of data (dbo/hsdb) in first line 
if(tolower(Correction_needed) == "upload"){
  Repro_SQLheader <- "
INSERT INTO [dbo].[Repro]
    ([OysterID]
      ,[SampleEventID]
      ,[Sex]
      ,[ReproStage]
      ,[Parasite]
      ,[BadSlide]
      ,[DataStatus]
      ,[DateEntered]
      ,[EnteredBy]
      ,[DateProofed]
      ,[ProofedBy]
      ,[DateCompleted]
      ,[CompletedBy]
      ,[Comments]
      ,[AdminNotes])
  VALUES"
  #
  temp <- character(length(nrow(Repro)))
  for(i in 1:nrow(Repro)){
    temp[i] <- paste0(Repro_SQLheader, "\n      (",paste(Repro[i,], collapse = "\n      ,"), ")\n GO")
  }
  #
} else if(tolower(Correction_needed) == "update"){
  temp <- character(nrow(Repro))
  for(i in 1:nrow(Repro)){
    temp[i] <- paste0("\nUPDATE [dbo].[Repro]", 
                      "\nSET [Sex] = ", Repro$Sex[i],",",
                      "\n[ReproStage] = ", Repro$ReproStage[i],",",
                      "\n[Parasite] = ", Repro$Parasite[i],",",
                      "\n[BadSlide] = ", Repro$BadSlide[i],",",
                      "\n[DataStatus] = ", Repro$DataStatus[i],",",
                      "\n[DateEntered] = ", Repro$DateEntered[i],",",
                      "\n[EnteredBy] = ", Repro$EnteredBy[i],",",
                      "\n[DateProofed] = ", Repro$DateProofed[i],",",
                      "\n[ProofedBy] = ", Repro$ProofedBy[i],",",
                      "\n[Comments] = ", Repro$Comments[i],
                      "\nWHERE [OysterID] = ", Repro$OysterID[i])  
  }
}
#
Repro_SQL <- paste(temp, collapse = "\n\n")
#
#Save SQL code
write_lines(Repro_SQL, paste0("../", Estuary, "_", Type_Data, "_", DataType, "_", Data_Year, "_", Data_Month, "_", Initials, ".sql"))
#
#