# Data uploads to database

# Working with dataloggers:

## Data files

* Place datasheet files in the *Data* folder
* Cleaned, compiled datalogger Excel files can also be stored in the *Data/Datalogger* folder
* Place datalogger exported Excel files into nested folders within the *Data/Datalogger/Raw* folder

  * Files should be nested within "Station Name M.D.YY" named folders, within "YYYY SiteCode Season ..." named folders

## R Code files

Located within the *Database\_uploads* folder.

* DataloggerFormatOysters\_ELW: Code to convert datalogger Excel files into cleaned, compiled data files. Output saved within the *Data/Dataloggers/Raw* folder. This code can be used to combine datalogger survey data with datasheet survey data.
* 

## Process

1. Add required datasheet, datalogger raw Excel, and/or cleaned and organized datalogger Excel files to appropriate folders.
2. Run 'DataloggerFormatOysters\_ELW' to clean and organize datalogger files as needed.
3. Run 'DataUpload\[...]\_ELW' to load and combine datasheet and datalogger files. This file outputs SQL code to upload data to the database.

