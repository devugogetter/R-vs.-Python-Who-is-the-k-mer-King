# benchmark_bio.R
if (!require("BiocManager", quietly = TRUE))
  install.packages("BiocManager")

BiocManager::install("Biostrings")
library(Biostrings)
library(tidyverse)
library(microbenchmark)

count_kmers_r <- function(fasta_file, k = 4) {
  # Read DNAStringSet
  seqs <- readDNAStringSet(fasta_file)
  
  # Count k-mers
  kmers_list <- lapply(seqs, function(seq) {
    oligonucleotideFrequency(seq, width = k)
  })
  
  # Combine into one data frame
  df <- bind_rows(
    lapply(names(kmers_list), function(name) {
      tibble(
        sequence_id = name,
        kmer = names(kmers_list[[name]]),
        count = as.integer(kmers_list[[name]])
      )
    })
  )
  
  return(df)
}

# Benchmarking
bench <- microbenchmark(
  R_count = count_kmers_r("sequence.fasta", k = 4),
  times = 10
)

print(bench)
# To access results:
as_tibble(bench) %>% group_by(expr) %>% summarise(median = median(time)/1e6)
