set.seed(3112)
library(tradeSeq)
library(RColorBrewer)
library(SingleCellExperiment)
library(slingshot)
library(ggplot2)

setwd("/blue/kirst/henryschmidt/Tradeseq")

cds <- readRDS("HighresXyside.rds")

UMAP <- Seurat::Embeddings( cds[["umap"]] )

start_clust <- "10"

### trajectory inference with slingshot, starting at cluster with more cells from T0h.
sling_res <- slingshot::slingshot( UMAP, 
                                   clusterLabels = cds@meta.data$seurat_clusters, 
                                   start.clus = start_clust,  # select starting point
                                   extend = "n",
                                   omega = F
)

slingshot::slingLineages(sling_res)

##########################################
### Trajectory Differential Expression ###
##########################################

require(tradeSeq)
require(slingshot)
require(tidyverse)

my_write_csv <- function( my_obj = my_obj,
                          name = name,
                          col.names = T,
                          row.names = F,
                          quote = F,
                          sep = "\t") {
  
  write.table(my_obj,
              name,
              col.names = T,
              row.names = F,
              quote = F,
              sep = "\t")
}

my_ggsave <- function( name = name,
                       plot = plot,
                       height = 12,
                       width = 16) {
  
  ggplot2::ggsave(
    filename = name,
    plot = plot,
    height = height,
    width = width,
    units = "in",
    bg = "#FFFFFF", 
    dpi = 300)
  
}

##### Using TradeSeq####
BPPARAM <- BiocParallel::bpparam()
BPPARAM$workers <- 23

counts_mt <- cds@assays$RNA$counts
# Remove genes with only zero counts
counts_mt <- counts_mt[rowSums(counts_mt) > 0, ]

icMat <- evaluateK(counts = counts_mt, # counts
                   #sds = sling_res, # trajectory
                   #verbose = F)

sce_fitted <- tradeSeq::fitGAM(counts = counts_mt,
                               sds = sling_res,
                               nknots = 8,
                               verbose = T,
                               parallel = TRUE,
                               BPPARAM = BPPARAM)

system( "mkdir -p rds_files")
saveRDS(sce_fitted,
        file = "rds_files/Stem_Tradeseq_Xylem.rds")


sce_fitted <- readRDS("Stem_Tradeseq_Xylem.rds")
## Association test to check if each genes is DEG within the trajectories of each lineage.
feat_importances <- tradeSeq::associationTest(sce_fitted,
                                              lineages = TRUE)



### >>>> Plots and heatmaps (Needs adjusts to work with Seurat)

# Adjust the p-value detected in each lineage to correct for multiple test (by using FDR).
feat_importances$fdr_1 <- stats::p.adjust(feat_importances$pvalue_1,
                                          method = "fdr",
                                          n = length(feat_importances$pvalue_1))

feat_importances$genes <- rownames(feat_importances)

DEGs_within_traj_of_lineage_1 <- feat_importances %>%
  dplyr::filter(fdr_1 < 0.001) %>%
  dplyr::select(waldStat_1, df_1, pvalue_1, fdr_1, genes) %>%
  dplyr::rename(gene_id = genes) %>%
  dplyr::arrange( desc( waldStat_1 ) )

DEGs_within_traj_of_lineage_1 <- merge(DEGs_within_traj_of_lineage_1,
                                       annot_summary,
                                       by = "gene_id",
                                       all.x = T )

write.table( DEGs_within_traj_of_lineage_1,
             paste0(Tradrseq.rdsfiles, "/tradeseq_DEGs_lineage1.tsv"), col.names = T, row.names = F, sep = "\t" )
write.csv(DEGs_within_traj_of_lineage_1, file = "DEGs_within_traj_of_lineage_1.csv", row.names = TRUE)

write.csv(DEGs_within_traj_of_lineage_1, file = "1.22.25_LINEAGE1_DEGs_tradeseq.csv")

# Adjust the p-value detected in each lineage to correct for multiple test (by using FDR).
feat_importances$fdr_2 <- stats::p.adjust(feat_importances$pvalue_2,
                                          method = "fdr",
                                          n = length(feat_importances$pvalue_2))

feat_importances$genes <- rownames(feat_importances)

DEGs_within_traj_of_lineage_2 <- feat_importances %>%
  dplyr::filter(fdr_2 < 0.001) %>%
  dplyr::select(waldStat_2, df_2, pvalue_2, fdr_2, genes) %>%
  dplyr::rename(gene_id = genes) %>%
  dplyr::arrange( desc( waldStat_2 ) )

DEGs_within_traj_of_lineage_2 <- merge(DEGs_within_traj_of_lineage_2,
                                       annot_summary,
                                       by = "gene_id",
                                       all.x = T )

write.table( DEGs_within_traj_of_lineage_1,
             paste0(Tradrseq.rdsfiles, "/tradeseq_DEGs_lineage1.tsv"), col.names = T, row.names = F, sep = "\t" )
write.csv(DEGs_within_traj_of_lineage_2, file = "1.22.25_DEGs_within_traj_of_lineage_2.csv", row.names = TRUE)
############ Differentiated cell type markers DiffEndTest##########
endRes <- diffEndTest(sce_fitted)
endRes$FDR <- stats::p.adjust(endRes$pvalue,
                                          method = "fdr",
                                          n = length(endRes$pvalue))
write.csv(endRes, file = "Tradeseq_diffendTest_FDR")



############ Genes Differentially expressed at a specific point##########
############ EarlyDETest of genes at bifurcation point knots 6,7##########
earlyDERes56 <- earlyDETest(sce_fitted, knots = c(5, 6))
earlyDERes$FDR <- stats::p.adjust(earlyDERes$pvalue,
                              method = "fdr",
                              n = length(earlyDERes$pvalue))





