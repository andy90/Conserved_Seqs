rm(list = ls())
library(tidyverse)
library(seqinr)
library(foreach)
library(Biostrings)
library(here)


system("mafft --auto siv_gag.fasta > siv_gag_aligned.fasta") 
