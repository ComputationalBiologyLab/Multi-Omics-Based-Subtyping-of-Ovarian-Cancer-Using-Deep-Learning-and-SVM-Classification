library(Rtsne)
library(ggplot2)
library(RColorBrewer)

# Perform t-SNE
df = read.csv("file_name.csv",row.names = 1)
tsne<- Rtsne(df, dims = 2)

# Create a dataframe for t-SNE results in the original dimension
tsne_df <- data.frame(tsne$Y)

# Add the labels to the t-SNE results
labels= read.csv("Labels.csv",row.names = 1)
tsne_df$label <- labels_df$Clusters

# Define a color palette with a sufficient number of colors for the clusters
num_clusters <- length(unique(tsne_df$label))
colors <- brewer.pal(num_clusters, "Paired")

# Plot t-SNE with different colors for each cluster
ggplot(tsne_df, aes(x = X1, y = X2, color = factor(label))) +
  geom_point() +
  scale_color_manual(values = colors, labels = c("Subtype 1", "Subtype 2")) +  # Replace with actual labels
  labs(x = "Component 1", y = "Component 2") +
  theme(
    plot.title = element_text(face = "bold", size = 16),
    axis.title.x = element_text(face = "bold", size = 14),
    axis.title.y = element_text(face = "bold", size = 14),
    axis.text.x = element_text(size = 12),
    axis.text.y = element_text(size = 12)
  )

