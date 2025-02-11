# Scripts to reproduce the snRNA-seq analysis of Populus trichocarpa stem
## Introduction
This repository contains the source code necessary to reproduce the results described in the manuscript "________"

Clustered .rds files necessary as inputs for analysis steps below can be downloaded from Figshare: https://doi.org/10.6084/m9.figshare.28392170.v1

The clustering of the snRNA-seq data was performed on Asc-Seurat v2.1. 

The Protoplast single-cell data utilized for the comparative analysis from the article titled "Transcriptional landscape of highly lignified poplar stems at single-cell resolution" Genome Biol 22, 319 (2021). https://doi.org/10.1186/s13059-021-02537-2, was downloaded from NGDC BioProject Accession number PRJCA005543 (https://ngdc.cncb.ac.cn/bioproject/browse/PRJCA005543). 
Data from "Response to: “Merit of integrating in situ transcriptomics and anatomical information for cell annotation and lineage construction in single-cell analyses of Populus”" Genome Biol 25, 86 (2024). https://doi.org/10.1186/s13059-024-03228-4 was downloaded from Zenodo - https://doi.org/10.5281/zenodo.10691111 


NOTE: These steps requires the installation of dynverse, as shown at https://dynverse.org/users/1-installation/. In addition, Docker must be installed and running since dynverse requires it.
The .R code " SessionInfo.R" can be utilized to view and install all necessary packages and their respective versions utilized in this analyis. 

### Integration of SnRNA-seq _Populus_trichocarpa_ stem reps 1 and 2
On Asc-Seurat, perform the integration using the file "Configuration_file_for_integration_analysis_SnRNAseq" as input and the default parameters of Asc-Seurat. 
* Output: Integrated_dataSnRNAseqSTEMFinalclustering.rds


Once the integrated data is generated, it is possible to infer the developmental trajectories. Data should be reclustered according to the clustering guide in additional file 9.
* Output: HighresXyside.rds
  
### Trajectory Analysis with Tradeseq was then carried out using the following code:
  * trajectory_inference_tradeseq.R

#### Input file:
* HighresXyside.rds
* Stem_Tradeseq_Xylem.rds
  * Outputs:
  * EarlyDETest_Knots5,6FDRcorrected.csv
  * Tradeseq_diffEndTest_FDR.csv
  * 1.22.25_LINEAGE1_DEGs_tradeseq.csv
  * 1.22.25_DEGs_within_traj_of_lineage_2.csv
  * 

