############################
#Genetic distance/similarity heatmap

setwd("~/Desktop/NT/")

# Setup and Libraries
if (!require("viridis")) install.packages("viridis")
if (!require("pheatmap")) install.packages("pheatmap")
if (!require("dplyr")) install.packages("dplyr")

library(pheatmap); library(dplyr); library(viridis)

# Load the data
data <- read.csv("~/Desktop/NT/matrix1.csv")

# Convert the first column into row names
data_matrix <- as.data.frame(data)
rownames(data_matrix) <- data_matrix[[1]]
data_matrix <- data_matrix[, -1]

# Convert to numeric matrix
similarity_matrix <- as.matrix(sapply(data_matrix, as.numeric))

# Genetic Similarity Heatmap 
# Using 'magma': Dark colors for low similarity, bright yellow for high similarity
pheatmap(similarity_matrix, 
         cluster_rows = TRUE, 
         cluster_cols = TRUE, 
         display_numbers = TRUE, 
         color = viridis(100, option = "magma"), 
         main = "Genetic Similarity Heatmap", 
         fontsize_row = 9, 
         fontsize_col = 9)

# Convert to matrix while PRESERVING row names
similarity_matrix <- as.matrix(data_matrix)
class(similarity_matrix) <- "numeric" # Ensures it is numeric for pheatmap

# Genetic Distance Heatmap
distance_matrix <- 100 - similarity_matrix

# Genetic Distance Heatmap with longer branches
pheatmap(distance_matrix, 
         cluster_rows = TRUE, 
         cluster_cols = TRUE, 
         show_rownames = TRUE,          
         show_colnames = TRUE,          
         color = viridis(100), 
         main = "Genetic Distance Heatmap", 
         fontsize_row = 6,              
         fontsize_col = 6, 
         angle_col = 90,                # Tilts bottom labels for better fit
         treeheight_row = 80,           # INCREASED: Makes side branches longer
         treeheight_col = 80)           # INCREASED: Makes top branches longer