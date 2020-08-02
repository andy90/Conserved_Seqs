rm(list = ls())
library(qualV)
library(tidyverse)
library(seqinr)
library(foreach)
library(Biostrings)
library(here)

p17_conserved <- readRDS("p17_conserved")
p24_conserved <- readRDS("p24_conserved")
siv_gag_conserved <- readRDS("siv_gag_conserved")

#a <- LCS(a = c("1","2","3","5","8"), b = c( "2", "3", "5", "6"))

p17_overlaped <- list()
for (i_p17 in p17_conserved){
  for (i_siv in siv_gag_conserved){
    i_overlaped <- LCS(i_p17, i_siv)$LCS
    if (length(i_overlaped) >= 5){
      p17_overlaped <- c(p17_overlaped, list(i_overlaped))
    }
  }
}

p24_overlaped <- list()
for (i_p24 in p24_conserved){
  for (i_siv in siv_gag_conserved){
    i_overlaped <- LCS(i_p24, i_siv)$LCS
    if (length(i_overlaped) >= 5){
      p24_overlaped <- c(p24_overlaped, list(i_overlaped))
    }
  }
}

saveRDS(p24_overlaped, file = "siv_hiv_p24_conserved_overlaped")
