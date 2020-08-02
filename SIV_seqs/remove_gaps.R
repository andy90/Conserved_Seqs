rm(list = ls())
library(tidyverse)
library(seqinr)
library(foreach)
library(Biostrings)
library(msa)
library(here)

vp_msa <- as.character(read.fasta("siv_gag_aligned.fasta",  seqonly = TRUE))
vp_msa_aligned <- do.call(rbind, str_split(vp_msa, pattern = ""))
gap_percent <- colSums(vp_msa_aligned == "-")/nrow(vp_msa_aligned)
sum(gap_percent > 0.125) # same criteria used by Ferguson
gap_position <- which(gap_percent > 0.125)

vp_msa_aligned <- vp_msa_aligned[, -gap_position]


AAfreq <-
  apply(vp_msa_aligned, 2, function(seq){
  a_table <- sort(table(seq), decreasing = TRUE)
  a_table[1]/nrow(vp_msa_aligned)
})

AA_mostcommon <- 
  apply(vp_msa_aligned, 2, function(seq){
    a_table <- sort(table(seq), decreasing = TRUE)
    names(a_table)[1]
  })

ind_conserved <- which(AAfreq > 0.95)

ind_conserved_consecutive <- split(ind_conserved, cumsum(c(1, diff(ind_conserved) != 1)))

AA_consect <- 
foreach(i = 1:length(ind_conserved_consecutive), .combine = "c") %do% {
  seq <- NULL
  if (length(ind_conserved_consecutive[[i]]) >= 5){
    seq <- AA_mostcommon[ind_conserved_consecutive[[i]]]
    names(seq) <- ind_conserved_consecutive[[i]]
  }
  list(seq)
}

AA_consect[sapply(AA_consect, is.null)] <- NULL
saveRDS(AA_consect, file = "siv_gag_conserved")

