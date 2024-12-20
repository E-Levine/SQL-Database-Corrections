##Code to compile SQL code from Excel data for upload
#Work with one estuary * one table at a time I.e., TBRCRT.
#
#Select appropriate template file, eneter data into copied file, and save to 'Data' folder before running R code.
#Code will output SQL file into main folder.
#
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
#Set type of data being added (WQ, TripInfo, SrvySH) and Year (YYYY) in which data was recorded - used only for file naming 
Type_Data <- c("WQ")
Data_Year <- c("2018")
#
###Load data file - change file name, confirm sheet name
Excel_data <- read_excel("../Data/SampleEventWQ_TEMPLATE.xlsx", sheet = "Template", #File name and sheet name
                         skip = 0, col_names = TRUE, col_types = "text", #How many rows to skip at top; are column names to be used
                         na = c("", "Z", "z"), trim_ws = TRUE, #Values/placeholders for NAs; trim extra white space?
                         .name_repair = "unique")
#Convert Entered date to date value to check value
Excel_data <- Excel_data %>% mutate(DateEntered = excel_numeric_to_date(as.numeric(DateEntered), date_system = "modern"))
#Check data
head(Excel_data)
#Excel_data <- Excel_data %>% mutate(Salinity = case_when(Salinity == '33.700000000000003' ~ "33.7", TRUE ~ Salinity), Temperature = case_when(Temperature == '19.100000000000001' ~ "19.1", TRUE ~ Temperature), DissolvedOxygen = case_when(DissolvedOxygen == '8.6199999999999992' ~ "8.62", TRUE ~ DissolvedOxygen)) 
#Extract parameter for file output
Estuary <- Excel_data[1,1] %>% substr(1,2)
DataType <- Excel_data[1,1] %>% substr(3,6)
#
#####Sample Event Water Quality Data####
#
##Create empty data frame to fill
SampleEventWQ <- data.frame(matrix(ncol = 24, nrow = 0))
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
         DataStatus = case_when(Is_Proofed == "Y" ~ paste0("'", "Proofed", "'"), TRUE ~ DataStatus),
         DateEntered = paste0("'", DateEntered, "'"),
         EnteredBy = paste0("'", EnteredBy, "'"),
         DateProofed = case_when(Is_Proofed == "Y" ~ paste0("'", ymd(Sys.Date()), "'"), TRUE ~ DateProofed),
         ProofedBy = case_when(Is_Proofed == "Y" ~ paste0("'", Proofed_By, "'"), TRUE ~ ProofedBy),
         DateCompleted = paste0("'", DateCompleted, "'"),
         CompletedBy = paste0("'", CompletedBy, "'"),
         Comments = paste0("'", Comments, "'"),
         AdminNotes = case_when(AdminNote != "none" ~ paste0("'", AdminNote, "'"), TRUE ~ paste0("'", AdminNotes, "'")),
         CollectionTime = paste0("'", CollectionTime, "'"),
         PercentDissolvedOxygen = paste0("'", PercentDissolvedOxygen, "'"),
         YSICalibration = paste0("'", YSICalibration, "'"),
         YSINotes = paste0("'", YSINotes, "'"))
#
#Fill data frame with information
SampleEventWQ <- rbind(SampleEventWQ, Excel_data_updated, stringsAsFactors = FALSE)
#
#SQL base template code - confirm location of data (dbo/hsdb) in first line 
##Skip to 'SEWQSQLheader' is glue function not working
SEWQSQLtemplate <- "
INSERT INTO [hsdb].[SampleEventWQ]
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
  VALUES
      ({SampleEventWQID}
      ,{SampleEventID}
      ,{Temperature}
      ,{Salinity}
      ,{DissolvedOxygen}
      ,{pH}
      ,{Depth}
      ,{SampleDepth}
      ,{Secchi}
      ,{TurbidityYSI}
      ,{TurbidityHach}
      ,{DataStatus}
      ,{DateEntered}
      ,{EnteredBy}
      ,{DateProofed}
      ,{ProofedBy}
      ,{DateCompleted}
      ,{CompletedBy}
      ,{Comments}
      ,{AdminNotes}
      ,{CollectionTime}
      ,{PercentDissolvedOxygen}
      ,{YSICalibration}
      ,{YSINotes})
GO"
#
# Use the glue function to fill in the template with the data frame values then skip to 'write_lines()'
SEWQ_SQL <- glue(SEWQSQLtemplate, .envir = SampleEventWQ)
#
#
##GLUE FUNCTION NOT CURRENTLY WORKING - Using method below instead. 
SEWQSQLheader <- "
INSERT INTO [hsdb].[SampleEventWQ]
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
#
SEWQ_SQL <- paste(temp, collapse = "\n\n")
#
#Save SQL code
write_lines(SEWQ_SQL, paste0("../", Estuary, "_", DataType, "_", Type_Data, "_", Data_Year, "_", Initials, ".sql"))
#
#
