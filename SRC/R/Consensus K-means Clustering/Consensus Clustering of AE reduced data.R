# Clustering AutoEncoder reduced data

BiocManager::install(c("ConsensusClusterPlus", "survminer"))

library(data.table)
library(ConsensusClusterPlus)
library(survival)
library(survminer)
library(ggplot2)

#=====================================================================================

pdf_op_path <- "kmeans_op_folder_AE_reduced_(ip_file_path)"
ip_file_path <- "(each file in AE reduced data folder).csv"
pac_op_path <- "Consensus_PAC_values_AE_reduced_(ip_file_path)"

#=====================================================================================
op_20 <- "Class_Consensus_Clustering_K_20.csv"
op_19 <- "Class_Consensus_Clustering_K_19.csv"
op_18 <- "Class_Consensus_Clustering_K_18.csv"
op_17 <- "Class_Consensus_Clustering_K_17.csv"
op_16 <- "Class_Consensus_Clustering_K_16.csv"
op_15 <- "Class_Consensus_Clustering_K_15.csv"
op_14 <- "Class_Consensus_Clustering_K_14.csv"
op_13 <- "Class_Consensus_Clustering_K_13.csv"
op_12 <- "Class_Consensus_Clustering_K_12.csv"
op_11 <- "Class_Consensus_Clustering_K_11.csv"
op_10 <- "Class_Consensus_Clustering_K_10.csv"
op_9 <- "Class_Consensus_Clustering_K_9.csv"
op_8 <- "Class_Consensus_Clustering_K_8.csv"
op_7 <- "Class_Consensus_Clustering_K_7.csv"
op_6 <- "Class_Consensus_Clustering_K_6.csv"
op_5 <- "Class_Consensus_Clustering_K_5.csv"
op_4 <- "Class_Consensus_Clustering_K_4.csv"
op_3 <- "Class_Consensus_Clustering_K_3.csv"
op_2 <- "Class_Consensus_Clustering_K_2.csv"

#=====================================================================================
# Reading i/p data 
compressed_data = read.csv(ip_file_path,row.names = 1)
dim(compressed_data)
#=====================================================================================
# Consensus clustering
# columns=items/samples and rows are features
res.ConClust = ConsensusClusterPlus(data.matrix(t(compressed_data)), # data to cluster
                                    maxK = 20, # maximum number of clusters
                                    reps = 1000, # number of times to repeat clustering
                                    pItem = 0.8, # percent of samples to consider for clustering in each iteration
                                    pFeature = 1, # percent of features to consider for clustering in each iteration
                                    plot = "pdf", # save clustering figures as pdf
                                    title = pdf_op_path, # path to save figures
                                    distance = "euclidean", # use euclidean distance
                                    clusterAlg = "km", # use k-means clustering algorithm
                                    seed = 2111133)


#=====================================================================================
# Write clustering results
cons_20 <- as.data.frame(res.ConClust[[20]][["consensusClass"]])
colnames(cons_20) <- ("Clusters") 

cons_19 <- as.data.frame(res.ConClust[[19]][["consensusClass"]])
colnames(cons_19) <- ("Clusters") 

cons_18 <- as.data.frame(res.ConClust[[18]][["consensusClass"]])
colnames(cons_18) <- ("Clusters") 

cons_17 <- as.data.frame(res.ConClust[[17]][["consensusClass"]])
colnames(cons_17) <- ("Clusters") 

cons_16 <- as.data.frame(res.ConClust[[16]][["consensusClass"]])
colnames(cons_16) <- ("Clusters") 

cons_15 <- as.data.frame(res.ConClust[[15]][["consensusClass"]])
colnames(cons_15) <- ("Clusters") 

cons_14 <- as.data.frame(res.ConClust[[14]][["consensusClass"]])
colnames(cons_14) <- ("Clusters")

cons_13 <- as.data.frame(res.ConClust[[13]][["consensusClass"]])
colnames(cons_13) <- ("Clusters")

cons_12 <- as.data.frame(res.ConClust[[12]][["consensusClass"]])
colnames(cons_12) <- ("Clusters")

cons_11 <- as.data.frame(res.ConClust[[11]][["consensusClass"]])
colnames(cons_11) <- ("Clusters")

cons_10 <- as.data.frame(res.ConClust[[10]][["consensusClass"]])
colnames(cons_10) <- ("Clusters")

cons_9 <- as.data.frame(res.ConClust[[9]][["consensusClass"]])
colnames(cons_9) <- ("Clusters")

cons_8 <- as.data.frame(res.ConClust[[8]][["consensusClass"]])
colnames(cons_8) <- ("Clusters")

cons_7 <- as.data.frame(res.ConClust[[7]][["consensusClass"]])
colnames(cons_7) <- ("Clusters")

cons_6 <- as.data.frame(res.ConClust[[6]][["consensusClass"]])
colnames(cons_6) <- ("Clusters")

cons_5 <- as.data.frame(res.ConClust[[5]][["consensusClass"]])
colnames(cons_5) <- ("Clusters")

cons_4 <- as.data.frame(res.ConClust[[4]][["consensusClass"]])
colnames(cons_4) <- ("Clusters")

cons_3 <- as.data.frame(res.ConClust[[3]][["consensusClass"]])
colnames(cons_3) <- ("Clusters")

cons_2 <- as.data.frame(res.ConClust[[2]][["consensusClass"]])
colnames(cons_2) <- ("Clusters")

#=====================================================================================
fwrite(cons_20, op_20, sep=",", row.names = TRUE, col.names = TRUE)
fwrite(cons_19, op_19, sep=",", row.names = TRUE, col.names = TRUE)
fwrite(cons_18, op_18, sep=",", row.names = TRUE, col.names = TRUE)
fwrite(cons_17, op_17, sep=",", row.names = TRUE, col.names = TRUE)
fwrite(cons_16, op_16, sep=",", row.names = TRUE, col.names = TRUE)
fwrite(cons_15, op_15, sep=",", row.names = TRUE, col.names = TRUE)
fwrite(cons_14, op_14, sep=",", row.names = TRUE, col.names = TRUE)
fwrite(cons_13, op_13, sep=",", row.names = TRUE, col.names = TRUE)
fwrite(cons_12, op_12, sep=",", row.names = TRUE, col.names = TRUE)
fwrite(cons_11, op_11, sep=",", row.names = TRUE, col.names = TRUE)
fwrite(cons_10, op_10, sep=",", row.names = TRUE, col.names = TRUE)
fwrite(cons_9, op_9, sep=",", row.names = TRUE, col.names = TRUE)
fwrite(cons_8, op_8, sep=",", row.names = TRUE, col.names = TRUE)
fwrite(cons_7, op_7, sep=",", row.names = TRUE, col.names = TRUE)
fwrite(cons_6, op_6, sep=",", row.names = TRUE, col.names = TRUE)
fwrite(cons_5, op_5, sep=",", row.names = TRUE, col.names = TRUE)
fwrite(cons_4, op_4, sep=",", row.names = TRUE, col.names = TRUE)
fwrite(cons_3, op_3, sep=",", row.names = TRUE, col.names = TRUE)
fwrite(cons_2, op_2, sep=",", row.names = TRUE, col.names = TRUE)

#=====================================================================================
# PAC implementation 
maxK <- 15
Kvec = 2:maxK
x1 = 0.1; x2 = 0.9 # threshold defining the intermediate sub-interval
PAC = rep(NA,length(Kvec))
names(PAC) = paste("K=",Kvec,sep="") # from 2 to maxK
for(i in Kvec){
  M = res.ConClust[[i]]$consensusMatrix
  Fn = ecdf(M[lower.tri(M)])
  PAC[i-1] = Fn(x2) - Fn(x1)
  print(PAC[i-1])
} # end for i

# The optimal K
optK = Kvec[which.min(PAC)]
cat(sprintf("Optimal K = %d\n", optK))
fwrite(as.data.frame(PAC), pac_op_path, row.names = TRUE, col.names = TRUE)

#=====================================================================================

