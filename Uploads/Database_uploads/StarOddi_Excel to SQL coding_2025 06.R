##Code to compile SQL code for Dataloggers from Excel file for upload
#Work with only one file at a time.
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
File_location <- c("//fwc-spfs1/FishBio/Molluscs/Oysters/ODIN Oyster Data Entry/Star Oddi to Database")
File_name <- "Star-Oddi-To-Upload-2025-06-16.xlsx"
#
#
##Create empty data frame to fill
LoggerWQ <- data.frame(matrix(ncol = 15, nrow = 0))
###Load data file - change file name, confirm sheet name
Logger_data <- read_excel(paste(File_location, File_name, sep = "/"), sheet = "DataLoggerWQ", #File name and sheet name
                         skip = 0, col_names = TRUE, #col_types = "text", #How many rows to skip at top; are column names to be used
                         na = c("", "Z", "z"), trim_ws = TRUE, #Values/placeholders for NAs; trim extra white space?
                         .name_repair = "unique")
head(Logger_data)
#Update DateCompleted
Logger_data <- Logger_data %>% mutate(DateCompleted = format(DateCompleted, "%Y-%m-%d %H:%M:%S"))
#Add single quotes to all data
Logger_data_cols <-  as.data.frame(apply(Logger_data, 2, function(x) {
  paste0("'", x, "'")
})) 
#Add missing columns
Logger_data_cols <- Logger_data_cols %>%
  mutate(DateEntered = 'NULL', EnteredBy = 'NULL', DateProofed = 'NULL', ProofedBy = 'NULL', .before = DateCompleted) %>%
  mutate(Comments = 'NULL', AdminNotes = 'NULL')
head(Logger_data_cols)
#Fill data frame with information
(LoggerWQ <- rbind(LoggerWQ, Logger_data_cols, stringsAsFactors = FALSE))
#
##
LoggerSQLheader <- "INSERT INTO [hsdb].[DataLoggerWQ] 
  ([WQSampleID], [FixedLocationID], [InstrumentName], [WQDateTime], [Temperature], [Salinity], [DataStatus], [DateEntered], [EnteredBy], [DateProofed], [ProofedBy], [DateCompleted], [CompletedBy], [Comments], [AdminNotes])
  VALUES"
temp <- character(length(nrow(LoggerWQ)))
for(i in 1:nrow(LoggerWQ)){
  temp[i] <- paste0(LoggerSQLheader, "\n      (",paste(LoggerWQ[i,], collapse = ", "), ")\n GO")
}
#
LoggerWQ_SQL <- paste(temp, collapse = "\n\n")
#
#Save SQL code
write_lines(LoggerWQ_SQL, paste0("../StarOddi_Data_Upload_", substring(File_name, 21, 30), ".sql"))
#