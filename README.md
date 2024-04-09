# SQL-Database-Corrections
PROJECT DESCRIPTION:
Houses code used to correct database errors (ODIN, user, etc.) on FWRI oyster database data. Data managers are currently the only FWRI staff who will be able to execute these queries. Code will be written and updated as needed.

NAMING:
Code files are typically named and divided by month and lab of data corrections performed (i.e. 2023 12_St Pete) to help track when data checks are perfromed and on which data. 

Larger datatype specific corrections should be named by data type, and lab or date (YY mm dd) for clarity.

It could be good practice to update the first line of each file with "Applied: [DATE]" when the SQL code has been run and the datacorrections applied to the database. 

FILE STRUCTURE:
/All - Queries that are applied to multiple lab's data.
/Crystal River - Queries that are applied to the Crystal River Lab's data.
/Eastpoint - Queries that are applied to the Eastpoint Lab's data.
/St. Pete - Queries that are applied to the St. Pete Lab's data.