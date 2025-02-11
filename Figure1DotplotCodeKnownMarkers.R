# Load necessary libraries
library(Seurat)

# Set the file path to the .rds file
rds_file <- "Integrated_data_STEM_Final_clustering.rds"

# Load the integrated single-cell data object
sc_data <- readRDS(rds_file)

# Check if the object is loaded correctly
print(sc_data)

# Perform necessary preprocessing if UMAP embeddings aren't present
# Check if UMAP is already computed
if (!"umap" %in% names(sc_data@reductions)) {
  # Normalize the data (if needed)
  sc_data <- NormalizeData(sc_data)
  
  # Identify highly variable features (if not done)
  sc_data <- FindVariableFeatures(sc_data)
  
  # Scale the data
  sc_data <- ScaleData(sc_data)
  
  # Perform dimensionality reduction using PCA
  sc_data <- RunPCA(sc_data)
  
  # Compute the UMAP embeddings
  sc_data <- RunUMAP(sc_data, dims = 1:20)  # Adjust the number of dimensions as necessary
}

# Generate the UMAP plot
DimPlot(sc_data, reduction = "umap", label = TRUE, label.size = 6) 
   
  

# Save the plot to a file (optional)
ggsave("UMAP_Plot_Integrated_Data.png", width = 10, height = 8)

# Load necessary libraries
library(Seurat)

# Set the file path to the .rds file
rds_file <- "Integrated_data_STEM_Final_clustering.rds"

# Load the integrated single-cell data object
sc_data <- readRDS(rds_file)

# Define the mapping of clusters to their respective labels
cluster_labels <- list(
  "CZ" = c(10, 4, 5, 17),
  "Phl" = c(18, 14, 12),
  "MX" = c(13, 3, 22, 25),
  "EP/PC" = c(6, 16, 23),
  "CR" = c(8, 19),
  "XP" = c(7),
  "CO" = c(9, 2),
  "Phe" = c(15),
  "CEID" = c(21),
  "UNID" = c(11, 1, 0, 24, 20)
)

# Create a vector to store the new labels
new_labels <- rep(NA, length(Idents(sc_data)))

# Assign new labels to each cell based on its cluster
for (label in names(cluster_labels)) {
  clusters <- cluster_labels[[label]]
  new_labels[Idents(sc_data) %in% clusters] <- label
}

# Add the new labels to the Seurat object as a metadata column
sc_data$Unified_Labels <- new_labels

# Set the new labels as the active identity for visualization
Idents(sc_data) <- sc_data$Unified_Labels

# Generate a UMAP plot with the unified labels
DimPlot(sc_data, reduction = "umap", label = TRUE, label.size = 6, group.by = "Unified_Labels")
 

# Save the plot to a file (optional)
ggsave("UMAP_Plot_Unified_Labels.png", width = 10, height = 8)


