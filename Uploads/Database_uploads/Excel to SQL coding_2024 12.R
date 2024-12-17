##Code to compile SQL code from Excel data for upload
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
#
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
#Excel_data <- Excel_data %>% mutate(Salinity = case_when(Salinity == '33.700000000000003' ~ "33.7", TRUE ~ Salinity))
#
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
SEWQSQLtemplate <- "
INSERT INTO [hsdb].[SampleEventWQ]
    ([SampleEventWQID]
      ,[SampleEventWQ]
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
      ,{SampleEventWQ}
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
# Use the glue function to fill in the template with the data frame values
SEWQ_SQL <- glue(SEWQSQLtemplate, .envir = globalenv(SampleEventWQ))
#
#
#
