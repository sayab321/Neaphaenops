############################
#Genetic distance/similarity heatmap
setwd("~/Desktop/NT/")

# libraries
library(pheatmap); library(dplyr); library(viridis)

# data
data <- read.csv("~/Desktop/NT/matrix1.csv")

# Convert the first column into row names
data_matrix <- as.data.frame(data)
rownames(data_matrix) <- data_matrix[[1]]
data_matrix <- data_matrix[, -1]

# Convert to numeric matrix
similarity_matrix <- as.matrix(sapply(data_matrix, as.numeric))

# Genetic Similarity Heatmap 
pheatmap(similarity_matrix, cluster_rows = TRUE, cluster_cols = TRUE, 
         display_numbers = TRUE, color = viridis(100, option = "magma"), main = "Genetic Similarity Heatmap", fontsize_row = 9, fontsize_col = 9)

# Convert to matrix
similarity_matrix <- as.matrix(data_matrix)
class(similarity_matrix) <- "numeric"

# Genetic distance Heatmap
distance_matrix <- 100 - similarity_matrix

# Genetic distance Heatmap with longer branches
pheatmap(distance_matrix, cluster_rows = TRUE, cluster_cols = TRUE, show_rownames = TRUE, show_colnames = TRUE, color = viridis(100), 
         main = "Genetic Distance Heatmap",fontsize_row = 6, fontsize_col = 6, angle_col = 90,treeheight_row = 80, treeheight_col = 80)