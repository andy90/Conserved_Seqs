rm(list = ls())
library(tidyverse)
library(stringr)
H_SL <- read_file("HIV_SPRTL.txt")
a <- gsub("\\{|\\}|\\n", "", H_SL)
r_H_SL <- as.numeric(str_split(a, " ")[[1]])


S_SL <- read_file("SIV_SPRTL.txt")
a <- gsub("\\{|\\}|\\n", "", S_SL)
r_S_SL <- as.numeric(str_split(a, " ")[[1]])

sqrt(sum((r_H_SL - r_S_SL)**2)/(length(r_H_SL)/3))


H_NA <- read_file("HIV_NEEAA.txt")
a <- gsub("\\{|\\}|\\n", "", H_NA)
r_H_NA <- as.numeric(str_split(a, " ")[[1]])


S_NA <- read_file("SIV_NEEAA.txt")
a <- gsub("\\{|\\}|\\n", "", S_NA)
r_S_NA <- as.numeric(str_split(a, " ")[[1]])

sqrt(sum((r_H_NA - r_S_NA)**2)/(length(r_H_NA)/3))


H_GS <- read_file("HIV_GS.txt")
a <- gsub("\\{|\\}|\\n", "", H_GS)
r_H_GS <- as.numeric(str_split(a, " ")[[1]])


S_GS <- read_file("SIV_GS.txt")
a <- gsub("\\{|\\}|\\n", "", S_GS)
r_S_GS <- as.numeric(str_split(a, " ")[[1]])

sqrt(sum((r_H_GS - r_S_GS)**2)/(length(r_H_GS)/3))
