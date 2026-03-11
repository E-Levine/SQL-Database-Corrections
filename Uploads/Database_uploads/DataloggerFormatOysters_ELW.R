#Code for formatting datalogger data into database format.
#Original file located on network
#
#### Set up ####
library(tidyverse)
library(lubridate) 
library(readxl)
library(glue)
library(DBI)
library(odbc)
library(dbplyr) 
#
DataManager = "E Williams"
Database = "Oysters_25-12-22"
Server = "localhost\\ERICALOCALSQL"
#
#
Site <- c("SS")
Station_name <- c("Big Reef")
Station_code <- c("BR")
Survey_date <- c("9.19.23")
Survey_season <- c("Summer")
#
# The basics ----
#
base_dir <- "../Data/Datalogger/Raw/"
#
# Station information
FLIDS <- read_excel("../Data/FIxedLocations.xlsx", sheet = "Sheet1", skip = 0, .name_repair = "universal") 
FL <- FLIDS %>% filter(str_detect(StationName, Station_code)) %>%
  mutate(StationNumber = as.numeric(StationNumber)) %>%
  dplyr::select(Estuary, SectionName, LatitudeDec, LongitudeDec)
#
#WQ: Date, Estuary, Section, Class, Station, Latitude, Longitude, Time, Depth, Temp, Salinity, DO, PH, Turbidity, Dpth_strta, Bottom_type, Numbr_QDRT
#SH: STATION, QDRT, OYSTER_NUM, SH, TYPE
#LIVE & DEAD: STATION, QDRT, LIVE, DEAD, NOTES
#
#### Formatting ####
#
time<-Sys.Date()
m<-month(time)
d<- day(time)
year<- year(time)
YMD<-paste0(year,m,d)

#### WQ ####
# Not sure if this is correct. No CEP files to test with currently. 
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
  message("No matching files found in: ", base_dir)
}
#
A <- Afiles %>% 
  setNames(nm = basename(.)) %>%
  lapply(read_excel) %>%
  bind_rows(.id = "FileName") %>%
  mutate(FileName=substr(FileName,1,1)) 
#
A2 <- left_join(A, FL, by = c("STATION" = "StationNumber"))  
A3 <- A2 %>% 
  dplyr::select(StationName, DATE, QDRT, WGHT, VOL, DRILLS, CC, NOTES) %>%
  rename("STATION" = StationName)
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
B <- Bfiles %>% 
  setNames(nm = basename(.)) %>%
  lapply(read_excel) %>%
  bind_rows(.id = "FileName") %>%
  mutate(FileName=substr(FileName,1,1)) 
#
B2 <- left_join(B, FL, by = c("STATION" = "StationNumber"))  
B3 <- B2 %>% 
  dplyr::select(StationName, DATE, QDRT, WGHT, VOL, DRILLS, CC, NOTES) %>%
  rename("STATION" = StationName)
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
C <- Cfiles %>% 
  setNames(nm = basename(.)) %>%
  lapply(read_excel) %>%
  bind_rows(.id = "FileName") %>%
  mutate(FileName=substr(FileName,1,1)) 
#
C2 <- left_join(C, FL, by = c("STATION" = "StationNumber"))  
C3 <- C2 %>% 
  dplyr::select(StationName, QDRT, LIVE, DEAD, NOTES) %>%
  rename("STATION" = StationName)
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
D <- Dfiles %>% 
  setNames(nm = basename(.)) %>%
  lapply(read_excel) %>%
  bind_rows(.id = "FileName") %>%
  mutate(FileName=substr(FileName,1,1)) %>%
  group_by(FileName)
#
D2 <- left_join(D, FL, by = c("STATION" = "StationNumber"))  
D3 <- D2 %>% 
  dplyr::select(StationName, QDRT, OYSTER_NUM, SH, TYPE) %>%
  rename("STATION" = StationName)
#
#
#