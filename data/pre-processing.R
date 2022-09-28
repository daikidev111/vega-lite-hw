#################### Assignment Information ################################
# Author: Daiki Kubo
# Student ID: 30523346
# Title: FIT3179 Week 9 Homework

################################### Libraries ###############################
library(janitor)
library(tidyr)
library(data.table) 
library(dplyr) 
library(lubridate)

################################### Project Setup ############################
setwd("~/Desktop/Desktop/vega-lite-hw/data")
rm(list=ls())

glob_temp <- read.csv("GlobalLandTemperaturesByCountry.csv")
glob_temp_path <- "GlobalLandTemperaturesByCountry.csv"

path_to_write <- "~/Desktop/vega-lite-hw/cleaned-data/"

reset <- function() {
  glob_temp <- read.csv("GlobalLandTemperaturesByCountry.csv")
  glob_temp_path <- "GlobalLandTemperaturesByCountry.csv"
  glob_temp <- glob_temp %>% clean_names()
  glob_temp <- na.omit(glob_temp)
}
########## Data cleansing ###########
glob_temp <- glob_temp %>% clean_names()
glob_temp <- na.omit(glob_temp)
#head(glob_temp)

##### Data manipulation #############
glob_temp <- glob_temp[-c(3)]

# extracting a year
glob_temp$dt <- substring(glob_temp$dt, 1, 4)
glob_temp <- subset(glob_temp, glob_temp$dt == 2013)

write.csv(glob_temp, paste(path_to_write, glob_temp_path), row.names = FALSE)
