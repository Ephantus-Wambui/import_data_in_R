# How to load CSV file using readr package

library(tidyverse)

data1 <- read_csv("data/datalab_export_2025-03-30 04_31_32.csv", show_col_types = FALSE)

head(data1)

# You can also use read.table to load CSV files, be sure to use a delimiter, in this case a comma

data2 <- read.table("data/datalab_export_2025-03-30 04_31_32.csv", sep = ",", header = 1)

head(data2)

# To import a text file, we use readLines() function

data3 <- read.delim("data/drake_lyrics.txt", header = F)

head(data3, 5)

# Importing data from excel we use read_excel from readxl package

library(readxl)

data4 <- read_excel("data/Tesla Deaths - Deaths.xlsx", sheet = 1)

head(data4)

# Importing data from a JSON file, we use rjson package

library(rjson)

JSONData <- fromJSON(file = "data/drake_data.json")

print(JSONData[1])

# Convert JSON data into an R dataframe, we will use data.table package

data5 = as.data.frame(JSONData[1])

data5

# To data from SQLite we use RSQLite package

library(RSQLite)

conn <- dbConnect(RSQLite::SQLite(), "data/mental_health.sqlite")

dbListTables(conn)

dbGetQuery(conn, "SELECT * FROM Survey")

data6 = dbGetQuery(conn, "SELECT * from Question LIMIT 3")

head(data6)

# Importing data from XML and HTML files

library(xml2)

plant_xml <- read_xml("https://www.w3schools.com/xml/plant_catalog.xml")

plant_xml_parse <- xmlParse(plant_xml)

plant_nodes <- getNodeSet(plant_xml_parse, "//PLANT")

data9 <- xmlToDataFrame(nodes=plant_nodes)

head(data9, 5)

# Importing HTML table into R

library(XML)
library(RCurl)

url <- getURL("https://en.wikipedia.org/wiki/Brazil_national_football_team")

tables <- readHTMLTable(url)

data7 <- tables[31]

data7$`NULL`

# You can also use rvest package to read HTML files

library(rvest)

url <- "https://en.wikipedia.org/wiki/Argentina_national_football_team"

file <- read_html(url)

tables <- html_nodes(file, "table")

data8 <- html_table(tables[25])

View(data8)

# You can import SAS, SPSS, STATA file using haven package

library(haven)

data10 <- read_sas("data/lond_small.sas7bdat")

head(data10, 5)

# Import SPSS file

data11 <- read_sav("data/airline_passengers.sav")

head(data11, 5)

# You can also use foreign package to import SPSS, Minitab, S, SAS, STATA, Systat, Weka, Octave

library("foreign")

data12 <- read.spss("data/airline_passengers.sav", to.data.frame = TRUE)

head(data12, 5)

# Importing STATA file

data13 <- read.data("data/friendly.dta")

head(data13, 5)

# Import Matlab file

library(R.matlab)

data14 <- readMat("data/cross_dsads.mat")

head(data14$data.dsads)

# Importing QuantMod files

library(quantmod)

getSymbols("GOOGL",
           from = "2022/12/1",
           to = "2023/1/15",
           periodicity = "daily")

head(GOOGL, 5)
