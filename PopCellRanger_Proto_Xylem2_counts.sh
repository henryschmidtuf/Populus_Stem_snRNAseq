#!/bin/bash
#SBATCH --job-name=cellranger_counts
#SBATCH --out Schmidt_SC_PoplarProtoplast_counts.out
#SBATCH --mail-type=ALL
#SBATCH --mail-user=henryschmidt@ufl.edu
#SBATCH --account=kirst
#SBATCH --qos=kirst
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=90GB
#SBATCH --time=48:00:00 


# Before running the cell ranger count, you will have to create a custom reference package: 
# (https://support.10xgenomics.com/single-cell-gene-expression/software/pipelines/latest/advanced/references). 
# Cellranger requires a reference genome sequence (FASTA file) and gene annotations (GTF file).

#module load cellranger

#cellranger mkref --genome=Palba_with_mitochondria_reference --fasta=/blue/kirst/share/Genomes/Ptremulaxalba_hap2/Palba_with_mitochondria.fasta #--genes=/blue/kirst/share/Genomes/Ptremulaxalba_hap2/#Palba_with_mitochondria_filtered.gtf

#module load cellranger

# Generate a counts table, samples are ran separately

module load cellranger

cellranger count --id=Proto_Xylem2 --transcriptome=/blue/kirst/henryschmidt/SC_Stem_Comparison/Nuclei_Stem/Palba_with_mitochondria_reference --fastqs=/blue/kirst/henryschmidt/SC_Stem_Comparison/Protoplast_Xylem --sample=Xylem2_CRR299249 --include-introns=true --localcores=20 --localmem=217



