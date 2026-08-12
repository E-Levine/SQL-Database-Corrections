## Code for formatting datalogger data into database format.
#
## Currently does not use Excel files but can be updated to append associated data.
#
#
#
#### Set up 
#
#
library(tidyverse)
library(lubridate) 
library(readxl)
library(glue)
library(foreign) #read.dbf
#
#
# Update for current data:
Year_of_survey <- c("2025")
Site <- c("SS")
Survey_season <- c("Winter")           #Season name or NA
Station_code <- c("TC")                #Station two-letter code
Survey_type <- c("SHBG")               #Database code for data type: SRVY or SHBG
Survey_date <- c("20251117")           #Date of survey - YYYYMMDD - should match folder naming
Proof_date <- as.Date("2026-08-11")    #Date data proofed or NA
Proofed_by <- "Tomena Scholze"         #Name of proofer or NA
TripID_need <- c("Y")                  #Does a trip ID need to be created? Only need one per date/site (Y on first run, N on subsequent)
assign_FLID <- c("NA")                 #If a FLID is needed, enter the first FLID here using the proper 4 character code (i.e., "T001"). If not, enter "NA".
#                                         FLIDs will be assigned sequentially if data for mutliple stations is located in the data folder. 
#
Excel_file_name <- "NA"                #Name of Excel file containing "Vols, Wts, Counts" and "SHs" sheets, or "NA"
Excel_WQ_name <- "NA"                  #Name of Excel file containing "WQ" sheet, or "NA"
#
# All of the following code through Line can be run without modification. 
# If running as one chunk, start at line 38. If running individually, start at line 43 and skip lines 895-931.
#
#
#
warnings_list <- character()
messages_list <- character()
withCallingHandlers(
  {
    #
    #### The basics ####
    #
    # NO CHANGES NEEDED. MAKE SURE PROPER FOLDER SCHEME IS FOLLOWED.
    base_dir <- "../Data/Datalogger/Raw/"
    #
    # Station information
    if (file.exists("../Data/FixedLocations.xlsx")) {
      FLIDS <- read_excel("../Data/FixedLocations.xlsx", sheet = "Sheet1", skip = 0, .name_repair = "universal") %>%
        # Make sure FLIDs are formatted properly
        mutate(FixedLocationID = str_pad(as.character(FixedLocationID), width = 4, side = "left", pad = "0"))
    } else {
      warning(paste("File not found:", "../Data/FixedLocations.xlsx"))
      FLIDS <- NULL
    }
    FL <- FLIDS %>% 
      filter(str_detect(StationName, Station_code)) %>%
      mutate(StationNumber = as.numeric(StationNumber)) %>%
      dplyr::select(Estuary, SectionName, LatitudeDec, LongitudeDec, StationName, StationNumber, FixedLocationID)
    #
    safe_read_excel <- safely(read_excel)
    #
    # Identify first level folder:
    data_folder <- list.dirs(base_dir, 
                             full.names = TRUE, 
                             recursive = FALSE) %>%
      keep(~ grepl(Year_of_survey, .) &
             grepl(Site, .) &
             (is.na(Survey_season) || grepl(Survey_season, .)))
    
    # Identify data folder:
    data_path <- list.dirs(paste0(data_folder, "/", Station_code), 
                           full.names = TRUE, 
                           recursive = FALSE) %>%
      keep(~ grepl(Survey_date, .) &
             (is.na(Station_code) || grepl(Station_code, .)))
    #
    # Load data files:
    data_files <- list.files(path = data_path, 
                             pattern = "\\.dbf$", 
                             full.names = TRUE,
                             recursive = TRUE) %>%
      setNames(nm = .) %>%
      map(read.dbf) %>%
      bind_rows(.id = "FilePath") %>%
      mutate(FileName = basename(FilePath),
             Folder = basename(dirname(FilePath)))
    #
    # Load excel files if names are noted above:
    if (Excel_file_name != "NA") {
      BSQ <- read_excel(paste0("../Data/Datalogger/",Excel_file_name,".xlsx"), sheet = "Vols, Wts, Counts", skip = 3, .name_repair = "universal") %>% 
        drop_na(Date.Collected)
      BSSH <- read_excel(paste0("../Data/Datalogger/",Excel_file_name,".xlsx"), sheet = "SHs", skip = 3, .name_repair = "universal")
    } 
    if(Excel_WQ_name != "NA"){
      BSWQ <- read_excel(paste0("../Data/Datalogger/",Excel_WQ_name,".xlsx"), sheet = "WQ", skip = 4,  .name_repair = "unique")  
    }
    #
    #
    #
    #
    #### Data formatting ####
    #
    ## NO CHANGES NEEDED BELOW. MAKE SURE PROPER FOLDER SCHEME IS FOLLOWED.
    #
    # ---- Fixed Locations ----
    # Get FLID info:
    FID <- data_files %>% 
      filter(endsWith(FilePath, "STATION.dbf")) %>%
      dplyr::select(-c(FilePath:HIER_TIME)) %>% 
      mutate(DATE = as.Date(DATE, "%m/%d/%y")) %>%
      filter(!is.na(ESTUARY)) %>%  
      mutate(Date = gsub("-", "", DATE),
             Time = as.character(TIME),
             Time = gsub(":","",Time),
             Time = str_sub(Time,end = -3),
             LONGITUDE = -abs(LONGITUDE))
    # Get Estuary long name
    LongName <- (FLIDS %>% 
                   filter(Estuary == as.character(FID$ESTUARY)) %>% 
                   slice(1))$EstuaryLongName
    #
    # Check FLIDs and assign if needed:
    if (assign_FLID == "NA") {
      if(any(is.na(FID$FIXEDID))){
        FID %>% 
          filter(is.na(FIXEDID)) %>% 
          dplyr::select(DATE:FIXEDID)
        message("FLIDs are missing.")
      } else {
        FID <- FID %>%
          arrange(FIXEDID)
      }
    } else {
      FID <- FID %>%
        mutate(FIXEDID = na_if(trimws(as.character(FIXEDID)), "")) %>%
        {
          # Identify missing FLIDs
          missing_idx <- which(is.na(.$FIXEDID))
          # Arrange by date/time and assign FLIDs to missing
          if (length(missing_idx) > 0) {
            ordered_idx <- missing_idx[
              order(.$DATE[missing_idx], .$TIME[missing_idx])
            ]
            new_ids <- paste0(assign_FLID, seq_along(ordered_idx) - 1)
            .[ordered_idx, ]$FIXEDID <- new_ids
          }
          .
        }
    }
    #
    # Check FLIDs match appropriately:
    suppressMessages(full_join(FID %>% 
                dplyr::select(FIXEDID, ESTUARY:STATION),
              FLIDS %>% 
                filter(FixedLocationID %in% FID$FIXEDID) %>% 
                dplyr::select(FixedLocationID, Estuary:SectionName, StationNumber),
              by = c("FIXEDID" = "FixedLocationID")))
    #
    #
    #
    #
    # ---- Trip Info ----
    #
    head(FID)
    #
    if(Excel_file_name != "NA"){
      TripExcel <- BSQ %>% 
        #Add station key for matching
        mutate(
          station_key = Station %>%
            str_to_lower() %>%
            str_replace_all("[^a-z0-9]", "")) 
    }
    #
    TripTable <- data.frame(TripID = paste0("'",FID$ESTUARY,Survey_type,"_",FID$Date,"_1","'"),
                            TripType = if_else(Survey_type == "SHBG", paste0("'","Shell Budget","'"), paste0("'","Semi-Annual Survey","'")),
                            TripDate = paste0("'",ymd(FID$DATE),"'"),
                            DataStatus = paste0("'","Proofed","'"),
                            DateEntered = paste0("'",format(Proof_date,"%Y-%m-%d %H:%M:%OS3"),"'"),
                            EnteredBy =  paste0("'",Proofed_by,"'"),
                            DateProofed = paste0("'",format(Proof_date,"%Y-%m-%d %H:%M:%OS3"),"'"),
                            ProofedBy = paste0("'",Proofed_by,"'"))
    
    #
    #Check to make sure everything is in single quotes 
    TripTable<- unique(TripTable)
    #
    #
    #
    #
    #
    # ---- Sample Event ----
    #
    # Harvest status
    Harvest <- data.frame(Class = c("CA", "PD", "CR", "AP", "RR", "UN"),
                          HarvestStatus = c("Conditionally Approved", "Prohibited", "Conditionally Restricted", "Approved", "Restricted Relay", "Unclassified"))
    #
    SampleEvent <- data.frame(SampleEventID = paste0("'",FID$ESTUARY,Survey_type,"_",FID$Date,"_1_",FID$FIXEDID,"_1","'"),
                              TripID= paste0("'",FID$ESTUARY,Survey_type,"_",FID$Date,"_1","'"),
                              FixedLocationID = paste0("'",FID$FIXEDID,"'"),
                              LatitudeDec = paste0("'",FID$LATITUDE,"'"),
                              LongitudeDec = paste0("'",FID$LONGITUDE,"'"),
                              NumDrills = ifelse(!is.na(FID$DRILLS), paste0("'",FID$DRILLS,"'"), "NULL"),
                              HarvestStatus = paste0("'",(Harvest %>% filter(Class == FID$CLASS))$HarvestStatus,"'"),
                              DataStatus = paste0("'","Proofed","'"),
                              DateEntered = paste0("'",format(Proof_date, "%Y-%m-%d %H:%M:%OS3"),"'"),
                              EnteredBy =  paste0("'",Proofed_by,"'"),
                              DateProofed = paste0("'",format(Proof_date,"%Y-%m-%d %H:%M:%OS3"),"'"),
                              ProofedBy = paste0("'",Proofed_by,"'")) 
    #
    SampleEvent <- unique(SampleEvent)
    #
    #
    #
    #
    #
    # ---- Water Quality ----
    #
    SEWQ <- FID %>% 
      mutate(TEMP = ifelse(TEMP == "Z"|TEMP == 0, NA, TEMP),
             SALINITY = ifelse(SALINITY == "Z"|SALINITY == 0, NA, SALINITY),
             DO = ifelse(DO == "Z"|DO == 0, NA, DO),
             PH = ifelse(PH == "Z"|PH == 0, NA, PH),
             DEPTH = ifelse(DEPTH == "Z"|DEPTH == 0, NA, DEPTH),
             TURBIDITY = ifelse(TURBIDITY == "Z"|TURBIDITY == 0, NA, TURBIDITY),
             TIME = ifelse(TIME == "Z"|TIME == 0, NA, as.numeric(TIME)*86400),
             TIME = format(as.POSIXct(TIME, origin = "1970-01-01", tz = "UTC"), "%H%M"),#Time..hh.mm.= gsub(":", "", Time..hh.mm.),
             Comments = gsub("'", "", NOTES),
             Comments = gsub(",","", Comments)) %>%
      #Create comments:
      rowwise() %>%
      mutate(Comments = {
        parts <- c()
        if (!is.na(Comments)) parts <- c(parts, paste("Notes =", Comments))
        if (!is.na(DPTH_STRTA)) parts <- c(parts, paste("DPTH_STRTA =", DPTH_STRTA))
        if (!is.na(BOTTOM_TYP)) parts <- c(parts, paste("BOTTOM_TYP =", BOTTOM_TYP))
        #if (!is.na(CLASS)) parts <- c(parts, paste("Class =", CLASS))
        if (length(parts) == 0) NA else paste0("'", paste(parts, collapse = " "), "'")
      })
    #
    SampleEventWQ <- data.frame(SampleEventWQID = paste0("'",SEWQ$ESTUARY,Survey_type,"_",SEWQ$Date,"_1_",SEWQ$FIXEDID,"_1_01","'"),
                                SampleEventID = paste0("'",SEWQ$ESTUARY,Survey_type,"_",SEWQ$Date,"_1_",SEWQ$FIXEDID,"_1","'"),
                                Temperature =  ifelse(is.na(SEWQ$TEMP),"NULL",paste0("'",SEWQ$TEMP,"'")),
                                Salinity = ifelse(is.na(SEWQ$SALINITY),"NULL",paste0("'",SEWQ$SALINITY,"'")),
                                DissolvedOxygen = ifelse(is.na(SEWQ$DO),"NULL",paste0("'",SEWQ$DO,"'")),
                                pH = ifelse(is.na(SEWQ$PH),"NULL",paste0("'",SEWQ$PH,"'")),
                                Depth = ifelse(is.na(SEWQ$DEPTH),"NULL",paste0("'",SEWQ$DEPTH,"'")),
                                TurbidityYSI = ifelse(is.na(SEWQ$TURBIDITY),"NULL",paste0("'",SEWQ$TURBIDITY,"'")),
                                DataStatus = paste0("'","Proofed","'"),
                                DateEntered = paste0("'",format(Proof_date,"%Y-%m-%d %H:%M:%OS3"),"'"),
                                EnteredBy =  paste0("'",Proofed_by,"'"),
                                DateProofed = paste0("'",format(Proof_date,"%Y-%m-%d %H:%M:%OS3"),"'"),
                                ProofedBy = paste0("'",Proofed_by,"'"),
                                Comments = ifelse(is.na(SEWQ$Comments), "NULL", paste0(SEWQ$Comments)),
                                CollectionTime = ifelse(is.na(SEWQ$Time),"NULL",paste0("'",SEWQ$Time,"'")))
    #
    #
    #
    #
    #
    # ---- Quadrat Data ----
    #
    if(Survey_type == "SRVY"){
      #
      QuadCounts <- data_files %>% 
        filter(endsWith(FilePath, "Data.dbf")) %>%
        dplyr::select(FilePath, KEY_A, KEY_AA:NOTES_Q, FileName)
      #
      QuadInfo <- data_files %>% 
        filter(endsWith(FilePath, "Quadrat.dbf")) %>%
        dplyr::select(FilePath, KEY_A, KEY_AA, KEY_AAB:NOTES_D, FileName)
      #
      #
      missing_KEY_A <- setdiff(unique(FID$KEY_A), unique(QuadInfo$KEY_A))
      if (length(missing_KEY_A) > 0) {
        QuadInfo_missing <- data.frame(
          "FileName" = NA,
          "KEY_A" = missing_KEY_A,
          "KEY_AA" = NA,
          "DATE" = TripTable$TripDate,
          "QDRT" = 1,
          "WGHT" = NA, 
          "VOL" = NA,
          "DRILLS" = NA,
          "CC" = NA,
          "NOTES" = "No Quad data recorded"
        )
        QuadInfo <- bind_rows(QuadInfo, QuadInfo_missing)
        #
        QuadCounts_missing <- data.frame(
          "FileName" = NA,
          "KEY_A" =  missing_KEY_A,
          "KEY_AA" = NA,
          "KEY_AAB" = NA,
          "QDRT" = 1,
          "LIVE" = NA,
          "DEAD" = NA,
          "LEGAL" = NA,
          "NOTES" = "No Quad data recorded"
        )
        QuadCounts <- bind_rows(QuadCounts, QuadCounts_missing)
        #
        suppressMessages(QuadData <- full_join(QuadInfo %>% 
                                dplyr::select(-c(FilePath, FileName)), 
                              QuadCounts %>% 
                                dplyr::select(-c(FilePath, FileName)))) 
        #
      } else {
        suppressMessages(QuadData <- full_join(QuadInfo %>% 
                                dplyr::select(-c(FilePath, FileName)), 
                              QuadCounts %>% 
                                dplyr::select(-c(FilePath, FileName)))) 
      }
      #
      #
      # NOTE: Every station needs at least one Quadrat record, even if no SH measured
      Quads <- QuadData %>% 
        left_join(FID %>% 
                    dplyr::select(KEY_A, Date, ESTUARY, STATION, CLASS, Notes = NOTES)) %>%
        mutate(SampleEventID = paste0(ESTUARY, "SRVY_", Date, "_1_", Station_code, "_1"),
               Quadrat = ifelse(is.na(QDRT), "01", sprintf("%02d", QDRT))) %>%
        #Compile comments and notes into one Comment
        rowwise() %>%
        mutate(Comments = {
          parts <- c()
          if (any(!is.na(c(NOTES, NOTES_B, Notes)))) parts <- c(parts, paste("Notes =", paste(na.omit(c(NOTES, NOTES_B, Notes)), collapse = "; ")))
          if (!is.na(CC)) parts <- c(parts, paste("Conch =", CC))
          if (length(parts) == 0) NA else paste0("'", paste(parts, collapse = " "), "'")
        })
      #
      SurveyQuadrat <- data.frame(
        QuadratID = paste0("'",Quads$SampleEventID,"_",Quads$Quadrat,"'"),
        SampleEventID = paste0("'",Quads$SampleEventID,"'"),
        QuadratNumber = paste0("'",Quads$QDRT,"'"),
        NumLive= ifelse(is.na(Quads$LIVE),"NULL",paste0("'",Quads$LIVE,"'")),
        NumDead=ifelse(is.na(Quads$DEAD),"NULL",paste0("'",Quads$DEAD,"'")),
        TotalVolume = ifelse(is.na(Quads$VOL),"NULL",paste0("'",Quads$VOL,"'")),
        TotalWeight = ifelse(is.na(Quads$WGHT),"NULL",paste0("'",Quads$WGHT,"'")),
        NumDrills = ifelse(is.na(Quads$DRILLS),"NULL",paste0("'",Quads$DRILLS,"'")),
        DataStatus = paste0("'","Proofed","'"),
        DateEntered = paste0("'",format(Proof_date,"%Y-%m-%d %H:%M:%OS3"),"'"),
        EnteredBy =  paste0("'",Proofed_by,"'"),
        DateProofed = paste0("'",format(Proof_date,"%Y-%m-%d %H:%M:%OS3"),"'"),
        ProofedBy = paste0("'",Proofed_by,"'"),
        Comments = ifelse(is.na(Quads$Comments), "NULL", paste0(Quads$Comments)),
        NumLegal = ifelse(is.na(Quads$LEGAL),"NULL",paste0("'",Quads$LEGAL,"'")))
      #
      #
      #
    } else if(Survey_type == "SHBG"){
      QuadCounts <- data_files %>% 
        filter(endsWith(FilePath, "Data.dbf")) %>%
        dplyr::select(FilePath, KEY_A, KEY_AA, QDRT, KEY_AAB:NOTES_D, FileName)
      #
      QuadInfo <- data_files %>% 
        filter(endsWith(FilePath, "Quadrat.dbf")) %>%
        dplyr::select(FilePath, KEY_A, KEY_AA:NOTES_Q, FileName)
      #
      QuadWtVl <- data_files %>% 
        filter(endsWith(FilePath, "Substrate.dbf")) %>%
        dplyr::select(FilePath, KEY_A, QDRT, KEY_AAC:BIOTAWGHT, FileName)
      #
      missing_KEY_A <- setdiff(unique(FID$KEY_A), unique(QuadInfo$KEY_A))
      #
      if (length(missing_KEY_A) > 0) {
        QuadInfo_missing <- data.frame(
          "FilePath" = NA,
          "FileName" = NA,
          "KEY_A" = missing_KEY_A,
          "KEY_AA" = NA,
          "DATE" = TripTable$TripDate,
          "QDRT" = 1,
          "WGHT" = NA, 
          "VOL" = NA,
          "DRILLS" = NA,
          "CC" = NA,
          "NOTES_Q" = "No Quad data recorded"
        )
        QuadInfo <- bind_rows(QuadInfo, QuadInfo_missing)
        #
        QuadCounts_missing <- data.frame(
          "FilePath" = NA,
          "FileName" = NA,
          "KEY_A" =  missing_KEY_A,
          "KEY_AA" = NA,
          "KEY_AAB" = NA,
          "QDRT" = 1,
          "LIVE" = NA,
          "DEAD" = NA,
          "LEGAL" = NA,
          "NOTES_D" = "No Quad data recorded"
        )
        QuadCounts <- bind_rows(QuadCounts, QuadCounts_missing)
        #
        QuadWtVl_missing <- data.frame(
          "FilePath" = NA,
          "FileName" = NA,
          "KEY_A" =  missing_KEY_A,
          "KEY_AA" = NA,
          "KEY_AAC" = NA,
          "QDRT" = 1,
          "LIVEWGHT" = NA,
          "LIVEVOL" = NA,
          "SHELLWGHT" = NA,
          "SHELLVOL" = NA,
          "PLANTWGHT" = NA,
          "PLANTVOL" = NA,
          "HASHWGHT" = NA,
          "HASHVOL" = NA,
          "OTHERWGHT" = NA,
          "OTHERVOL" = NA,
          "DRILLWGJT" = NA,
          "DRILLVOL" = NA,
          "CCWGHT" = NA,
          "BIOTAWGHT" = NA
        )
        QuadWtVl <- bind_rows(QuadWtVl, QuadWtVl_missing)
        #
        suppressMessages(QuadData <- full_join(QuadInfo %>% 
                                                 dplyr::select(-c(FilePath, FileName)), 
                                               QuadCounts %>% 
                                                 dplyr::select(-c(FilePath, FileName))) %>%
          full_join(QuadWtVl %>% 
                      dplyr::select(-c(FilePath, FileName))))
      } else {
        suppressMessages(QuadData <- full_join(QuadInfo %>% 
                                dplyr::select(-c(FilePath, FileName)), 
                              QuadCounts %>% 
                                dplyr::select(-c(FilePath, FileName))) %>%
                                full_join(QuadWtVl %>% 
                      dplyr::select(-c(FilePath, FileName))))
      }
      #
      #
      # NOTE: Every station needs at least one Quadrat record, even if no SH measured
      Quads <- QuadData %>% 
        left_join(FID %>% 
                    dplyr::select(KEY_A, Date, FIXEDID, ESTUARY, STATION, CLASS, Notes = NOTES)) %>%
        mutate(SampleEventID = paste0(ESTUARY, "SHBG_", Date, "_1_", FIXEDID, "_1"),
               Quadrat = ifelse(is.na(QDRT), "01", sprintf("%02d", QDRT))) %>%
        #Compile comments and notes into one Comment
        rowwise() %>%
        mutate(Comments = {
          parts <- c()
          if (any(!is.na(c(Notes, NOTES_Q, NOTES_D)))) parts <- c(parts, paste("Notes =", paste(na.omit(c(Notes, NOTES_Q, NOTES_D)), collapse = "; ")))
          if (!is.na(CC)) parts <- c(parts, paste("Conch =", CC))
          if (length(parts) == 0) NA else paste0("'", paste(parts, collapse = " "), "'")
        })
      #
      ShellBudgetQuadrat <- data.frame(
        QuadratID = paste0("'",Quads$SampleEventID,"_",Quads$Quadrat,"'"),
        SampleEventID = paste0("'",Quads$SampleEventID,"'"),
        QuadratNumber = paste0("'",Quads$QDRT,"'"),
        TotalSampleVolume = ifelse(is.na(Quads$VOL),"NULL",paste0("'",Quads$VOL,"'")),
        TotalSampleWeight = ifelse(is.na(Quads$WGHT),"NULL",paste0("'",Quads$WGHT,"'")),
        LiveOysterVolume = ifelse(is.na(Quads$LIVEVOL),"NULL",paste0("'",Quads$LIVEVOL,"'")),
        LiveOysterWeight= ifelse(is.na(Quads$LIVEWGHT),"NULL",paste0("'",Quads$LIVEWGHT,"'")),
        NumDrills = ifelse(is.na(Quads$DRILLS),"NULL",paste0("'",Quads$DRILLS,"'")),
        DrillWeight= ifelse(is.na(Quads$DRILLWGHT),"NULL",paste0("'",Quads$DRILLWGHT,"'")),
        OtherBiotaWeight = ifelse(is.na(Quads$BIOTAWGHT),"NULL",paste0("'",Quads$BIOTAWGHT,"'")),
        NumLiveOysters = ifelse(is.na(Quads$LIVE),"NULL",paste0("'",Quads$LIVE,"'")),
        NumDeadOysters = ifelse(is.na(Quads$DEAD),"NULL",paste0("'",Quads$DEAD,"'")),
        OysterShellVolume = ifelse(is.na(Quads$SHELLVOL),"NULL",paste0("'",Quads$SHELLVOL,"'")),
        OysterShellWeight = ifelse(is.na(Quads$SHELLWGHT),"NULL",paste0("'",Quads$SHELLWGHT,"'")),
        PlantedShellVolume= ifelse(is.na(Quads$PLANTVOL),"NULL",paste0("'",Quads$PLANTVOL,"'")),
        PlantedShellWeight = ifelse(is.na(Quads$PLANTWGHT),"NULL",paste0("'",Quads$PLANTWGHT,"'")),
        ShellHashVolume= ifelse(is.na(Quads$HASHVOL),"NULL",paste0("'",Quads$HASHVOL,"'")),
        ShellHashWeight = ifelse(is.na(Quads$HASHWGHT),"NULL",paste0("'",Quads$HASHWGHT,"'")),
        BlackAndOtherSubstrateVolume= ifelse(is.na(Quads$OTHERVOL),"NULL",paste0("'",Quads$OTHERVOL,"'")),
        BlackAndOtherSubstrateWeight= ifelse(is.na(Quads$OTHERWGHT),"NULL",paste0("'",Quads$OTHERWGHT,"'")),
        DataStatus = paste0("'","Proofed","'"),
        DateEntered = paste0("'",format(Proof_date,"%Y-%m-%d %H:%M:%OS3"),"'"),
        EnteredBy =  paste0("'",Proofed_by,"'"),
        DateProofed = paste0("'",format(Proof_date,"%Y-%m-%d %H:%M:%OS3"),"'"),
        ProofedBy = paste0("'",Proofed_by,"'"),
        Comments = ifelse(is.na(Quads$Comments), "NULL", paste0(Quads$Comments)))
      #
    }
    #
    #
    #
    #
    #
    #
    # ---- Shell Heights ----
    #
    if(Survey_type == "SRVY"){
      ShellHeights <- data_files %>% 
        filter(endsWith(FilePath, "Shell_Height.dbf")) 
      #
      missing_KEY_A <- setdiff(unique(FID$KEY_A), unique(ShellHeights$KEY_A))
      #
      if (length(missing_KEY_A) > 0) {
        ShellHeights_missing <- data.frame(
          "FilePath" = NA,
          "FileName" = NA,
          "KEY_A" = missing_KEY_A,
          "KEY_AA" = NA,
          "KEY_AAA" = NA,
          "QDRT" = 1,
          "OYSTER_NUM" = 1, 
          "SH" = NA,
          "NO_DEAD" = "NULL",
          "TOTAL_DEAD" = "NULL",
          "TYPE" = "NULL"
        )
        ShellHeights <- bind_rows(ShellHeights, ShellHeights_missing)
        #
      } else {
        ShellHeights <- ShellHeights
      }
      #
      # Every station needs at least one SH record, even if no SH measured
      SHData <- ShellHeights %>%
        left_join(FID %>% dplyr::select(KEY_A, Date, ESTUARY)) %>%
        mutate(Quadrat = sprintf("%02d", QDRT),
               QuadratID = paste0(ESTUARY,"SRVY_",Date,"_1_",Station_code,"_1_",Quadrat),
               SHnum = sprintf("%03d", OYSTER_NUM))
      #
      #
      SurveySH <- data.frame(
        ShellHeightID = paste0("'",SHData$QuadratID,"_",SHData$SHnum,"'"),
        QuadratID = paste0("'",SHData$QuadratID,"'"),
        ShellHeight = ifelse(is.na(SHData$SH),"NULL",paste0("'",SHData$SH,"'")),
        DataStatus = paste0("'","Proofed","'"),
        DateEntered = paste0("'",format(Proof_date,"%Y-%m-%d %H:%M:%OS3"),"'"),
        EnteredBy =  paste0("'",Proofed_by,"'"),
        DateProofed = paste0("'",format(Proof_date,"%Y-%m-%d %H:%M:%OS3"),"'"),
        ProofedBy = paste0("'",Proofed_by,"'"),
        Comments = "NULL"
      )
    } else if(Survey_type == "SHBG"){
      ShellHeights <- data_files %>% 
        filter(endsWith(FilePath, "Shell_Height.dbf")) %>%
        dplyr::select(FilePath, KEY_A, KEY_AA, QDRT, KEY_AAA:TYPE)
      #
      missing_KEY_A <- setdiff(unique(FID$KEY_A), unique(ShellHeights$KEY_A))
      #
      if (length(missing_KEY_A) > 0) {
        ShellHeights_missing <- data.frame(
          "FilePath" = NA,
          "FileName" = NA,
          "KEY_A" = missing_KEY_A,
          "KEY_AA" = NA,
          "KEY_AAA" = NA,
          "QDRT" = 1,
          "OYSTER_NUM" = 1, 
          "SH" = NA,
          "NO_DEAD" = "NULL",
          "TOTAL_DEAD" = "NULL",
          "TYPE" = "NULL"
        )
        ShellHeights <- bind_rows(ShellHeights, ShellHeights_missing)
        #
      } else {
        ShellHeights <- ShellHeights
      }
      SHData <- ShellHeights %>%
        left_join(FID %>% dplyr::select(KEY_A, Date, ESTUARY, FIXEDID)) %>%
        mutate(Quadrat = sprintf("%02d", QDRT),
               QuadratID = paste0(ESTUARY,"SHBG_",Date,"_1_",FIXEDID,"_1_",Quadrat),
               SHnum = sprintf("%03d", OYSTER_NUM),
               LiveOrDead = ifelse(TYPE== 1, "Live", "Dead"))
      #
      #
      ShellBudgetSH<- data.frame(
        ShellHeightID = paste0("'",SHData$QuadratID,"_",SHData$SHnum,"'"),
        QuadratID = paste0("'",SHData$QuadratID,"'"),
        LiveOrDead =  paste0("'",SHData$LiveOrDead,"'"),
        ShellHeight = paste0("'",SHData$SH,"'"),
        DataStatus = paste0("'","Proofed","'"),
        DateEntered = paste0("'",format(Proof_date,"%Y-%m-%d %H:%M:%OS3"),"'"),
        EnteredBy =  paste0("'",Proofed_by,"'"),
        DateProofed = paste0("'",format(Proof_date,"%Y-%m-%d %H:%M:%OS3"),"'"),
        ProofedBy = paste0("'",Proofed_by,"'"),
        Comments = paste0("'",paste("NumDead =", SHData$NO_DEAD, " Total Dead =",SHData$TOTAL_DEAD),"'"))
      #
      #
    }
    #
    #
    #
    #
    #
    #### SQL Coding ####
    #
    ## NO CHANGES NEEDED BELOW. MAKE SURE PROPER FOLDER SCHEME IS FOLLOWED.
    #
    # ---- Fixed Locations - will only run if assigning FLIDs ----
    if(assign_FLID != "NA"){
      FLID_Comments <- NA
      FLID_AdminNotes <- c("datalogger upload FixedLocationID")
      #
      FLTab <- data.frame(
        FixedLocationID = paste0("'",FID$FIXEDID,"'"),
        Estuary = paste0("'",FID$ESTUARY,"'"),
        SectionName = paste0("'",FID$SECTION,"'"),
        StationName = paste0("'",FID$STATION,"'"),
        StationNumber = paste0("'",as.integer(gsub("[^0-9]", "", FID$STATION)),"'"),
        LatitudeDec = paste0("'",FID$LATITUDE,"'"),
        LongitudeDec = paste0("'",FID$LONGITUDE,"'"),
        Recruitment = paste0("'","N","'"),
        Survey = paste0("'","Y","'"),
        Sediment = paste0("'","N","'"),
        Collections = paste0("'","N","'"),
        ShellBudget = paste0("'","N","'"),
        Dataloggers = paste0("'","N","'"),
        Cage = paste0("'","N","'"),
        Wave = paste0("'","N","'"),
        StartDate = paste0("'",FID$DATE,"'"),
        EndDate = paste0("'",FID$DATE,"'"),
        DataStatus = paste0("'","Proofed","'"),
        DateEntered = paste0("'",format(Proof_date,"%Y-%m-%d %H:%M:%OS3"),"'"),
        EnteredBy =  paste0("'",Proofed_by,"'"),
        DateProofed = paste0("'",format(Proof_date,"%Y-%m-%d %H:%M:%OS3"),"'"),
        ProofedBy = paste0("'",Proofed_by,"'"),
        Comments = ifelse(is.na(FID$NOTES) & is.na(FLID_Comments), "NULL", 
                          ifelse(!is.na(FID$NOTES) & is.na(FLID_Comments), paste0("'",FID$NOTES,"'"), 
                                 ifelse(is.na(FID$NOTES) & !is.na(FLID_Comments), paste0("'", FLID_Comments, "'"), 
                                        paste0("'", FID$NOTES, ", ", FLID_Comments, "'")))),
        AdminNotes = ifelse(is.na(FLID_AdminNotes), "NULL", paste0("'", FLID_AdminNotes, "'")),
        StationNameNumber = paste0("'",FID$STATION,"-",substr(FID$STATION,3,nchar(as.character(FID$STATION))),"'"),
        EstuaryLongName = paste0("'",LongName,"'")
      )
      #
      #Check to make sure everything is in single quotes 
      FLTab<- unique(FLTab)
      #
      # Create a template for the TripInfo SQL script 
      FLIDSQLtemplate <- "
INSERT INTO [dbo].[FixedLocations]
           ([FixedLocationID]
           ,[Estuary]
           ,[SectionName]
           ,[StationName]
           ,[StationNumber]
           ,[LatitudeDec]
           ,[LongitudeDec]
           ,[Recruitment]
           ,[Survey]
           ,[Sediment]
           ,[Collections]
           ,[ShellBudget]
           ,[Dataloggers]
           ,[Cage]
           ,[Wave]
           ,[StartDate]
           ,[EndDate]
           ,[DataStatus]
           ,[DateEntered]
           ,[EnteredBy]
           ,[DateProofed]
           ,[ProofedBy]
           ,[Comments]
           ,[AdminNotes]
           ,[StationNameNumber]
           ,[EstuaryLongName])
VALUES"
      temp <- character(length(nrow(FLTab)))
      for(i in 1:nrow(FLTab)){
        temp[i] <- paste0(FLIDSQLtemplate, "\n      (",paste(FLTab[i,], collapse = "\n      ,"), ")\n GO")
      }
      FLID_SQL <- paste(temp, collapse = "\n\n")
    } else {
      message("Fixed location table not created since 'assign_FLID' is set to No (\"NA\")")
    }
    # Save SQL code
    #write_lines(FLID_SQL, paste0("../", Site, "_", Station_code, "_FixedLocations.sql"))
    #
    #
    #
    #
    # ---- Trip Info ----
    #
    if(TripID_need == "Y"){
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
    } else {
      message("Trip ID table not created since 'TripID_need' is set to No (\"N\")")
    }
    # Save SQL code
    #write_lines(Trip_SQL, paste0("../", Site, "_", Station_code, "_", Survey_date,"_TripInfo.sql"))
    #
    #
    #
    #
    #
    #
    # ---- Sample Event ---- 
    #
    SampleEventtemplate<- "
INSERT INTO [dbo].[SampleEvent]
           ([SampleEventID]
           ,[TripID]
           ,[FixedLocationID]
           ,[LatitudeDec]
           ,[LongitudeDec]
           ,[NumDrills]
           ,[HarvestStatus]
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
    #write_lines(SampleEvent_SQL, paste0("../", SiteCode, "_", DataType, "_", DataDate,"SampleEevent.sql"))
    #
    #
    #
    #
    #
    #
    # ---- Water Quality ---- 
    #
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
     VALUES"
    #
    temp <- character(length(nrow(SampleEventWQ)))
    for(i in 1:nrow(SampleEventWQ)){
      temp[i] <- paste0(SampleEventWQtemplate, "\n      (",paste(SampleEventWQ[i,], collapse = "\n      ,"), ")\n GO")
    }
    SampleEventWQ_SQL <- paste(temp, collapse = "\n\n")
    #
    # Save SQL code
    #write_lines(SampleEventWQ_SQL, paste0("../", Site, "_", Station_code, "_", Survey_date,"_SampleEventWQ.sql"))
    #
    #
    #
    #
    #
    #
    # ---- Quadrat Data ----
    #
    if(Survey_type == "SRVY"){
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
           ,[Comments]
           ,[NumLegal])
     VALUES"
      #
      temp <- character(length(nrow(SurveyQuadrat)))
      for(i in 1:nrow(SurveyQuadrat)){
        temp[i] <- paste0(SurveyQuadrattemplate, "\n      (",paste(SurveyQuadrat[i,], collapse = "\n      ,"), ")\n GO")
      }
      SurveyQuadrat_SQL <- paste(temp, collapse = "\n\n")
      #
    } else if(Survey_type == "SHBG"){
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
      #
      temp <- character(length(nrow(ShellBudgetQuadrat)))
      for(i in 1:nrow(ShellBudgetQuadrat)){
        temp[i] <- paste0(ShellBudgetQuadrattemplate, "\n      (",paste(ShellBudgetQuadrat[i,], collapse = "\n      ,"), ")\n GO")
      }
      ShellBudgetQuadrat_SQL <- paste(temp, collapse = "\n\n")
      #
    }
    # Save SQL code
    #write_lines(SurveyQuadrat_SQL, paste0("../", Site, "_", Station_code, "_", Survey_date,"_SurveyQuadrat.sql"))
    # Save SQL code
    #write_lines(ShellBudgetQuadrat_SQL, paste0("../", Site, "_", Station_code, "_", Survey_date,"_ShellBudgetQuadrat.sql"))
    #
    #
    #
    #
    #
    #
    # ---- Shell Heights ----
    #
    if(Survey_type == "SRVY"){
      SurveySHtemplate<- "
  INSERT INTO [dbo].[SurveySH]
           ([ShellHeightID]
           ,[QuadratID]
           ,[ShellHeight]
           ,[DataStatus]
           ,[DateEntered]
           ,[EnteredBy]
           ,[DateProofed]
           ,[ProofedBy]
           ,[Comments])
     VALUES"
      #
      temp <- character(length(nrow(SurveySH)))
      for(i in 1:nrow(SurveySH)){
        temp[i] <- paste0(SurveySHtemplate, "\n      (",paste(SurveySH[i,], collapse = "\n      ,"), ")\n GO")
      }
      SurveySH_SQL <- paste(temp, collapse = "\n\n")
      #
    } else if(Survey_type == "SHBG"){
      ShellBudgetSHtemplate<- "
    INSERT INTO [dbo].[ShellBudgetSH]
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
     VALUES"
      #
      temp <- character(length(nrow(ShellBudgetSH)))
      for(i in 1:nrow(ShellBudgetSH)){
        temp[i] <- paste0(ShellBudgetSHtemplate, "\n      (",paste(ShellBudgetSH[i,], collapse = "\n      ,"), ")\n GO")
      }
      ShellBudgetSH_SQL <- paste(temp, collapse = "\n\n")
    }
    #
    # Save SQL code
    #write_lines(SurveySH_SQL, paste0("../",Site, "_", Station_code, "_", Survey_date,"_SurveySH.sql"))
    # Save SQL code
    #write_lines(ShellBudgetSH_SQL, paste0("../",Site, "_", Station_code, "_", Survey_date,"_ShellBudgetSH.sql"))
  },
  # ---- Message wrap up  ----  
  warning = function(w) {
    warnings_list <<- c(warnings_list, conditionMessage(w))
    invokeRestart("muffleWarning")
  },
  
  message = function(m) {
    messages_list <<- c(messages_list, conditionMessage(m))
    invokeRestart("muffleMessage")
  }
)

cat("\n\n==============================\n")
cat("MESSAGES\n")
cat("==============================\n")

if (length(messages_list) > 0) {
  print(unique(messages_list))
} else {
  cat("None\n")
}

cat("\n\n==============================\n")
cat("WARNINGS\n")
cat("==============================\n")

if (length(warnings_list) > 0) {
  warning_summary <- sort(table(warnings_list), decreasing = TRUE)
  print(warning_summary)
} else {
  cat("None\n")
}
#
#
#
#
#### Combined SQL output file ####
#
if(exists("FLID_SQL")){
  write_lines(FLID_SQL, paste0("../", Site, "_", Station_code, "_FixedLocations.sql"))
} else {
  message("No FLID table created.")
}
#
if(TripID_need == "Y"){
  Combined_sampling <- paste(Trip_SQL, SampleEvent_SQL, SampleEventWQ_SQL, sep = "\n\n")
} else {
  Combined_sampling <- paste(SampleEvent_SQL, SampleEventWQ_SQL, sep = "\n\n")
}
write_lines(Combined_sampling, 
            paste0("../", Site, "_", Station_code, "_", Survey_date,"_Trip_Sample_SQL.sql"))
#
#
Survey_data <- paste(SurveyQuadrat_SQL, SurveySH_SQL, sep = "\n\n")
write_lines(Survey_data, 
            paste0("../", Site, "_", Station_code, "_", Survey_date,"_Survey_SQL.sql"))
#
#
ShellBudget_data <- paste(ShellBudgetQuadrat_SQL, ShellBudgetSH_SQL, sep = "\n\n")
write_lines(ShellBudget_data, 
            paste0("../", Site, "_", Station_code, "_", Survey_date,"_ShellBudget_SQL.sql"))
#
#
#