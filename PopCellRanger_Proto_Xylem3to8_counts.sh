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
#SBATCH --time=72:00:00 


# Before running the cell ranger count, you will have to create a custom reference package: 
# (https://support.10xgenomics.com/single-cell-gene-expression/software/pipelines/latest/advanced/references). 
# Cellranger requires a reference genome sequence (FASTA file) and gene annotations (GTF file).

#module load cellranger

#cellranger mkref --genome=Palba_with_mitochondria_reference --fasta=/blue/kirst/share/Genomes/Ptremulaxalba_hap2/Palba_with_mitochondria.fasta #--genes=/blue/kirst/share/Genomes/Ptremulaxalba_hap2/#Palba_with_mitochondria_filtered.gtf

#module load cellranger

# Generate a counts table, samples are ran separately

module load cellranger

cellranger count --id=Proto_Xylem3 --transcriptome=/blue/kirst/henryschmidt/SC_Stem_Comparison/Nuclei_Stem/Palba_with_mitochondria_reference --fastqs=/blue/kirst/henryschmidt/SC_Stem_Comparison/Protoplast_Xylem --sample=Xylem3_CRR299250 --include-introns=true --localcores=20 --localmem=217


cellranger count --id=Proto_Xylem4 --transcriptome=/blue/kirst/henryschmidt/SC_Stem_Comparison/Nuclei_Stem/Palba_with_mitochondria_reference --fastqs=/blue/kirst/henryschmidt/SC_Stem_Comparison/Protoplast_Xylem --sample=Xylem4_CRR299251 --include-introns=true --localcores=20 --localmem=217

cellranger count --id=Proto_Xylem5 --transcriptome=/blue/kirst/henryschmidt/SC_Stem_Comparison/Nuclei_Stem/Palba_with_mitochondria_reference --fastqs=/blue/kirst/henryschmidt/SC_Stem_Comparison/Protoplast_Xylem --sample=Xylem5_CRR299252 --include-introns=true --localcores=20 --localmem=217

cellranger count --id=Proto_Xylem6 --transcriptome=/blue/kirst/henryschmidt/SC_Stem_Comparison/Nuclei_Stem/Palba_with_mitochondria_reference --fastqs=/blue/kirst/henryschmidt/SC_Stem_Comparison/Protoplast_Xylem --sample=Xylem6_CRR299253 --include-introns=true --localcores=20 --localmem=217

cellranger count --id=Proto_Xylem7 --transcriptome=/blue/kirst/henryschmidt/SC_Stem_Comparison/Nuclei_Stem/Palba_with_mitochondria_reference --fastqs=/blue/kirst/henryschmidt/SC_Stem_Comparison/Protoplast_Xylem --sample=Xylem7_CRR299254 --include-introns=true --localcores=20 --localmem=217


cellranger count --id=Proto_Xylem8 --transcriptome=/blue/kirst/henryschmidt/SC_Stem_Comparison/Nuclei_Stem/Palba_with_mitochondria_reference --fastqs=/blue/kirst/henryschmidt/SC_Stem_Comparison/Protoplast_Xylem --sample=Xylem8_CRR299255 --include-introns=true --localcores=20 --localmem=217

