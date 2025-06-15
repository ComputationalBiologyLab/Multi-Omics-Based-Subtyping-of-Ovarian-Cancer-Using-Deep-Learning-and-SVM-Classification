# Multi-Omics-Based-Subtyping-of-Ovarian-Cancer-Using-Deep-Learning-and-SVM-Classification
This project focuses on identifying subtypes of multiomics ovarian cancer data and building a model to predict the label of unseen samples. The provided code includes preprocessing steps and dimensionality reduction using autoencoders. It also involves consensus k-means clustering and SVM classifier modeling for sample classification. For molecular characterization, the project performs survival analysis, CIBERSORT for immune cell estimation, and pathway analysis using Reactome. The code used in this project is implemented in both Python (Google Colaboratory) and R (RStudio v 4.2.3). The code scripts for these processes are located in the "SRC" folder.

The pipeline of this project consists of 6 phases: 

#Phase 1: Data preprocessing: It involves reducing features, imputing missing values using K-nearest neighbours using VIM library (v 6.2.2), and applying min-max normalization.

#Phase 2: Forming omics combinations: It involves forming di-tri combinations and multi-omics matrix. 

#Phase 3: Dimensionality reduction using autoencoders: It reduces the dimensions of features to overcome overfitting while building the model. It is done using KERAS library wih different architectres for different combinations. 

#Phase 4: Consensus k-means clustering: It finds the optimal k clusters (from 2 to 15) in the data using ConsensusClusterPlus library (v 1.62.0). 

#Phase 5: Machine learning pipeline for subtype identification: It selects the features using SelectFromModel. Then, model is built using SVM classifier with RBF kernel. Also, Repeated Stratified K-Fold cross-validation method was employed to ensure strong evaluation. It is done using KERAS library.

#Phase 6: Molecular characterization 
	#Survival analysis: It applies Kaplan-Meier survival curves and log-rank test using the survival library(v 3.5.3) to learn about differences in survival among the obtained clusters.

	#Reactome GSA:It analyzes the functional pathways and enriched genes to see the biological processes differences among the two clusters. This is the link to the analysis tool: https://reactome.org/gsa/home. Camera analysis method was used with default paramters.  

	#CIBERSORTx:It calculated the abundances of the 22 immunce cell types in each cluster. Each input file is inserted in CYBERSORTx tool in the following link: https://cibersortx.stanford.edu/, with the following parameters: Impute cell fractions, Signature matrix file = LM22, Mixture file = pre-processed gene expression data, Enable batch 			correction (B-mode), Disable quantile normalization, Run in absolute mode, and 100 permutations. Then, Mann-Whitney U test (scipy.stats module) is applied on output files to see which cell type is significant between the two clusters. 
