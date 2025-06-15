###Preprocessing the methylation data 

library(VIM)

# Read unpreprocessed methylation data
(df_methylation)= read.csv("methylation.csv",row.names = 1)

# Transpose the dataframe to have samples as rows and features as columns
df_transposed <- t(df_methylation)
df_methyl = as.data.frame(df_transposed)

# Calculate the percentage of zero expression for each feature
zero_percentages <- colMeans(df_methyl == "NA", na.rm = TRUE)
print(zero_percentages)

# Drop features with zero expression in more than 10% of the samples
features_to_drop <- names(zero_percentages[zero_percentages > 0.1])
meth_filtered <- df_methyl[ , !(names(df_methyl) %in% features_to_drop)]
View(meth_filtered[1:20, ])

# to see if there are NA values still 
zero_percentages <- colMeans(meth_filtered == "NA", na.rm = TRUE)
percentage_sum <- sum(zero_percentages)
print(percentage_sum) # 105.1093 to be replaced by KNN 5

# Implement Na values using KNN 
knn_meth <- kNN(meth_filtered, k = 5)
# The kNN function adds additional columns with the suffix 'imp' for imputed values,
# so to get only the imputed data, we need to select the original columns
knn_meth <- knn_meth[, colnames(meth_filtered)]

# Sort genes in decreasing order using standard deviation  
meth_std <- apply(knn_meth,2, sd)
meth_sorted <- knn_meth[, order(meth_std, decreasing = TRUE)]

# Select the top 2000 most variable genes (features)
top_meth_features <- names(meth_sorted)[1:2000]
meth_top <- meth_sorted[, top_meth_features]
class(meth_top)

# Export the preprocessed data to a CSV file
write.csv(meth_top, file = "methylation.csv")