# Data uploads to database

# Working with dataloggers:

## Data files
- Place datasheet files in the *Data* folder
- Cleaned, compiled datalogger Excel files can also be stored in the *Data/Datalogger* folder
- Place datalogger Excel files into nested folders within the *Data/Datalogger/Raw* folder
  - Files should be nested within "Station Name M.D.YY" named folders, within "YYYY SiteCode Season ..." named folders

## R Code files
Located within the *Database_uploads* folder.
- DataloggerFormatOysters_ELW: Code to convert datalogger Excel files into cleaned, compiled data files. Output saved within the *Data/Dataloggers/Raw* folder. This code can be used to combine datalogger survey data with datasheet survey data.
-  