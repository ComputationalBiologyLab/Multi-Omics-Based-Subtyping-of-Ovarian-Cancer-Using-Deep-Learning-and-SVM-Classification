# Read the dataframes
mrna <- read.csv("mrna.csv", row.names = 1)
mirna <- read.csv("mirna.csv", row.names = 1)
meth <- read.csv("methylation.csv", row.names = 1)
prot <- read.csv("proteomeprofiling.csv", row.names = 1)


# Create and save pairwise (pairwise) combinations
write.csv(cbind(mrna, mirna), "mrna_mirna.csv", row.names = TRUE)
write.csv(cbind(mrna, meth), "mrna_meth.csv", row.names = TRUE)
write.csv(cbind(mrna, prot), "mrna_prot.csv", row.names = TRUE)
write.csv(cbind(mirna, meth), "mirna_meth.csv", row.names = TRUE)
write.csv(cbind(mirna, prot), "mirna_prot.csv", row.names = TRUE)
write.csv(cbind(meth, prot), "meth_prot.csv", row.names = TRUE)

# Create and save triple (three-way) combinations
write.csv(cbind(mrna, mirna, meth), "mrna_mirna_meth.csv", row.names = TRUE)
write.csv(cbind(mrna, mirna, prot), "mrna_mirna_prot.csv", row.names = TRUE)
write.csv(cbind(mrna, meth, prot), "mrna_meth_prot.csv", row.names = TRUE)
write.csv(cbind(mirna, meth, prot), "mirna_meth_prot.csv", row.names = TRUE)

# Create and save quadruple (fourth) combination
write.csv(cbind(mrna, mirna, meth, prot), "Multiomics_omics.csv", row.names = TRUE)
