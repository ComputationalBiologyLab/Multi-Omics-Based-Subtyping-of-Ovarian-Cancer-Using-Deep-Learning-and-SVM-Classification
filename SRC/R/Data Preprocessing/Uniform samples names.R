# Read preprocessed data 
mrna <- read.csv("mrna.csv",row.names = 1)
mirna <- read.csv("mirna.csv",row.names = 1)
meth <- read.csv("methylation.csv",row.names = 1)
proteome <- read.csv("proteomeprofiling.csv",row.names = 1)

# Extract rownames 
index_names1 <- row.names(mrna)
index_names2 <- row.names(mirna)
index_names3 <- row.names(meth)
index_names4 <- row.names(proteome)

#remove the first space from each sample ID in mirna
index_names2 <- trimws(index_names2, "left")   

#Change '-' to '.' in meth
index_names3 <- gsub("-", ".", index_names3)
index_names4 <- gsub("-", ".", index_names4)

#Extract the sample IDs from each indicies before fouth Dot due to different formatting 
sample_ids_csv1 <- substr(index_names1, 1, 16)
sample_ids_csv2 <- substr(index_names2, 1, 16)
sample_ids_csv3 <- substr(index_names3, 1, 16)
sample_ids_csv4 <- substr(index_names4, 1, 16)


#Uniform the format of row names (samples) of all csv files 
rownames(mrna) = sample_ids_csv1
rownames(mirna) = sample_ids_csv2 
rownames(meth) = sample_ids_csv3
rownames(proteome) = sample_ids_csv4

##############################################################
# Find the common samples across all dataframes
common_samples <- Reduce(intersect, list(rownames(mrna), rownames(mirna), rownames(meth), rownames(proteome)))

# Subset the dataframes to include only the common samples
mrna_common <- mrna[common_samples, ]
mirna_common <- mirna[common_samples, ]
meth_common <- meth[common_samples, ]
proteome_common <- proteome[common_samples, ]

# Write the final versions of preprocessed dataframes to CSV files
write.csv(mrna_common, "mrna.csv", row.names = TRUE)
write.csv(mirna_common, "mirna.csv", row.names = TRUE)
write.csv(meth_common, "methylation.csv", row.names = TRUE)
write.csv(proteome_common, "proteomeprofiling.csv", row.names = TRUE)

