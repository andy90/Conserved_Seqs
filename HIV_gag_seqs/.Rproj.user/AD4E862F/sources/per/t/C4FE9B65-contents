rm(list = ls())
library(qualV)
library(tidyverse)
library(seqinr)
library(foreach)
library(Biostrings)
library(here)
immunogen <- read.table("immunogen_shuffled.txt", stringsAsFactors = FALSE, header = FALSE)$V1
immuno_seq <- str_split(immunogen, pattern = "")[[1]]

p24_conserved_overlaped <- readRDS("siv_hiv_p24_conserved_overlaped")

overlaped <- as.character()
for(i_p24 in p24_conserved_overlaped){
  i_overlaped <- LCS(i_p24,immuno_seq)$LCS
  overlaped <- c(overlaped, paste(i_overlaped, collapse = ""))
  
}
