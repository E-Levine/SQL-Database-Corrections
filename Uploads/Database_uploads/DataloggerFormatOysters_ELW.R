#Code for formatting datalogger data into database format.
#Original file located on network
#
#### Set up ####
library(tidyverse)
library(lubridate) 
library(readxl)
library(writexl)
#
#
#
Year_of_survey <- c("2023")
Site <- c("SS")
Survey_season <- c("Winter")
Station_name <- c("Big Reef")
Station_code <- c("BR")
Survey_date <- c("11.20.23")
#
# The basics ----
#
base_dir <- "../Data/Datalogger/Raw/"
#
# Station information
FLIDS <- read_excel("../Data/FIxedLocations.xlsx", sheet = "Sheet1", skip = 0, .name_repair = "universal") 
FL <- FLIDS %>% filter(str_detect(StationName, Station_code)) %>%
  mutate(StationNumber = as.numeric(StationNumber)) %>%
  dplyr::select(Estuary, SectionName, LatitudeDec, LongitudeDec, StationName, StationNumber)
#
safe_read_excel <- safely(read_excel)
#WQ: Date, Estuary, Section, Class, Station, Latitude, Longitude, Time, Depth, Temp, Salinity, DO, PH, Turbidity, Dpth_strta, Bottom_type, Numbr_QDRT
#SH: STATION, QDRT, OYSTER_NUM, SH, TYPE
#LIVE & DEAD: STATION, QDRT, LIVE, DEAD, NOTES
#
#### Formatting ####
#
#time<-Sys.Date()
#m<-month(time)
#d<- day(time)
#year<- year(time)
#YMD<-paste0(year,m,d)

#### WQ ####
#
Afiles = list.files(
  path = base_dir,
  pattern="CEP",
  recursive = TRUE, 
  full.names = TRUE) %>% 
  keep(~ str_detect(.x, Site) &
         str_detect(.x, Survey_season) &
         str_detect(.x, Station_name) &
         str_detect(.x, Survey_date))
#
if (length(Afiles) == 0) {
  A3 <- data.frame(Note = paste("No 'WQ' datalogger files found in folder."))
  message("No matching files found in: ", base_dir)
}
#
A <- Afiles %>% 
  setNames(nm = basename(.)) %>%
  # Needs to be checked once/if data file is corrupt
  map(~{
    res <- safe_read_excel(.x)
    
    if (!is.null(res$error) || nrow(res$result) == 0) {
      # placeholder row if file is missing/corrupt/empty
      tibble(Note = "File missing, corrupt, or contained no data")
    } else {
      res$result
    }
  }) %>% 
  bind_rows(.id = "FileName") %>%
  mutate(FileName=substr(FileName,1,1)) 
#
A2 <- left_join(A, FL, by = c("STATION" = "StationNumber"))  
(A3 <- A2 %>% 
  dplyr::select(DATE, ESTUARY, SECTION, CLASS, StationName, LATITUDE, LONGITUDE, 
                TIME, DEPTH, TEMP, SALINITY, DO, PH, TURBIDITY, DPTH_STRTA, BOTTOM_TYP, NUMBR_QDRT) %>%
  rename("STATION" = StationName))
#
#
#
#### WT & VOL ----
#
Bfiles = list.files(
  path = base_dir,
  pattern="1_01___.859",
  recursive = TRUE, 
  full.names = TRUE) %>% 
  keep(~ str_detect(.x, Site) &
         str_detect(.x, Survey_season) &
         str_detect(.x, Station_name) &
         str_detect(.x, Survey_date))
#
if (length(Bfiles) == 0) {
  B3 <- data.frame(Note = paste("No 'WT & VOL' datalogger files found in folder."))
  message("No matching files found in: ", base_dir)
}
#
B <- Bfiles %>% 
  setNames(nm = basename(.)) %>%
  # Needs to be checked once/if data file is corrupt
  map(~{
    res <- safe_read_excel(.x)
    
    if (!is.null(res$error) || nrow(res$result) == 0) {
      # placeholder row if file is missing/corrupt/empty
      tibble(Note = "File missing, corrupt, or contained no data")
    } else {
      res$result
    }
  }) %>% 
  bind_rows(.id = "FileName") %>%
  mutate(FileName=substr(FileName,1,1)) 
#
B2 <- left_join(B, FL, by = c("STATION" = "StationNumber"))  
(B3 <- B2 %>% 
  dplyr::select(StationName, DATE, QDRT, WGHT, VOL, DRILLS, CC, NOTES) %>%
  rename("STATION" = StationName))
#
#
#
#### LIVE & DEAD ####
#
Cfiles = list.files(
  path = base_dir,
  pattern="12010",
  recursive = TRUE, 
  full.names = TRUE) %>% 
  keep(~ str_detect(.x, Site) &
         str_detect(.x, Survey_season) &
         str_detect(.x, Station_name) &
         str_detect(.x, Survey_date))
#
if (length(Cfiles) == 0) {
  C3 <- data.frame(Note = paste("No 'LIVE & DEAD' datalogger files found in folder."))
  message("No matching files found in: ", base_dir)
}
#
C <- Cfiles %>% 
  setNames(nm = basename(.)) %>%
  # Needs to be checked once/if data file is corrupt
  map(~{
    res <- safe_read_excel(.x)
    
    if (!is.null(res$error) || nrow(res$result) == 0) {
      # placeholder row if file is missing/corrupt/empty
      tibble(Note = "File missing, corrupt, or contained no data")
    } else {
      res$result
    }
  }) %>% 
  bind_rows(.id = "FileName") %>%
  mutate(FileName=substr(FileName,1,1)) 
#
C2 <- left_join(C, FL, by = c("STATION" = "StationNumber"))  
(C3 <- C2 %>% 
  dplyr::select(StationName, QDRT, LIVE, DEAD, NOTES) %>%
  rename("STATION" = StationName))
#
#
#
#
#### SH ####
#
Dfiles = list.files(
  path = base_dir,
  pattern="11010",
  recursive = TRUE, 
  full.names = TRUE) %>% 
  keep(~ str_detect(.x, Site) &
         str_detect(.x, Survey_season) &
         str_detect(.x, Station_name) &
         str_detect(.x, Survey_date))
#
if (length(Dfiles) == 0) {
  D3 <- data.frame(Note = paste("No 'SH' datalogger files found in folder."))
  message("No matching files found in: ", base_dir)
}
#
D <- Dfiles %>% 
  setNames(nm = basename(.)) %>%
  map(~{
    res <- safe_read_excel(.x)
    
    if (!is.null(res$error) || nrow(res$result) == 0) {
      # placeholder row if file is missing/corrupt/empty
      tibble(Note = "File missing, corrupt, or contained no data")
    } else {
      res$result
    }
  }) %>% 
  bind_rows(.id = "FileName") %>%
  mutate(FileName=substr(FileName,1,1)) #%>%  group_by(FileName)
#
D2 <- left_join(D, FL, by = c("STATION" = "StationNumber"))  %>%
  mutate(SH = case_when(SH == 0 ~ NA, TRUE ~ SH))
(D3 <- D2 %>% 
    dplyr::select(StationName, QDRT, OYSTER_NUM, SH, TYPE) %>%
    rename("STATION" = StationName))
#
# Need code to check if any SH are missing, add note if so:
(MissingSHs <- full_join(
  # Total count per quadrats
  C3 %>% 
    group_by(STATION, QDRT) %>%
    summarise(Total = max(LIVE, na.rm = T)),
  # Number of SHs
  D3 %>% 
    group_by(STATION, QDRT) %>%
    summarise(SHCount = n())) %>%
  # Note if any SH are missing
  mutate(Missing = case_when(SHCount == 50 ~ NA,
                             is.na(SHCount) ~ Total,
                             Total > SHCount & SHCount != 50 ~ Total-SHCount, 
                             TRUE ~ NA)) %>%
  # Identify missing data
  filter(!is.na(Missing)))
#
temp <- MissingSHs %>%
  transmute(
    STATION = STATION,
    QDRT = QDRT,
    OYSTER_NUM = 1,
    SH = NA,
    TYPE = 1
  )
D4 <- bind_rows(D3, temp) %>%
  drop_na(STATION, QDRT) %>%
  arrange(STATION, QDRT)
#
#
#
#### Output cleaned files ####
#
# Create file name
(file_name <- paste(
  Year_of_survey,
  Site,
  Survey_season,
  "SBM",
  Station_code,
  Survey_date,
  sep = " "
))

# Add extension and optional directory
file_path <- file.path("../Data/Datalogger", paste0(file_name, ".xlsx"))


SH_sheet <- if (exists("D4")) {
  D4
} else if (exists("D3")) {
  D3
} else {
  data.frame(Note = "Shell height data not found")
}

# Write multiple sheets
write_xlsx(
  list(
    "WQ" = A3,
    "WT & VOL" = B3,
    "LIVE & DEAD" = C3,
    "SH" = SH_sheet
  ),
  path = file_path
)
#
#
#