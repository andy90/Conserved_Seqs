rm(list = ls())
library(tidyverse)
library(seqinr)
library(Biostrings)
library(foreach)
a <- read.fasta(file = "uniprot-simian+immunodeficiency+virus+gene_gag.fasta", as.string = TRUE, seqtype = "AA")

ind_gag_pol <- 
foreach(i = 1:length(a), .combine = "c") %do% {
  b <- attributes(a[[i]])$Annot
  isgagpol <- grepl("GN=gag-pol", b)
  d <- NULL
  if (isgagpol){
    d <- i
  }
  d
}

a_final <- a[-ind_gag_pol]

achar <- as.character(a_final)
ind_full <- which( (nchar(achar) > 500 ) & (nchar(achar) < 600))


a_final <- a_final[ind_full]

write.fasta(a_final, names = names(a_final), file.out = "siv_gag.fasta")


