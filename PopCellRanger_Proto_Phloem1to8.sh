#!/bin/bash
#SBATCH --job-name=cellranger_counts_phloem
#SBATCH --out Schmidt_SC_PoplarProtoplast_counts.out
#SBATCH --mail-type=ALL
#SBATCH --mail-user=henryschmidt@ufl.edu
#SBATCH --account=kirst
#SBATCH --qos=kirst
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=90GB
#SBATCH --time=72:00:00 
# Generate a counts table, samples are ran separately

module load cellranger

cellranger count --id=Proto_Phloem1 --transcriptome=/blue/kirst/henryschmidt/SC_Stem_Comparison/Nuclei_Stem/Palba_with_mitochondria_reference --fastqs=/blue/kirst/henryschmidt/SC_Stem_Comparison/Protoplast_Phloem --sample=Phloem1_CRR299240 --include-introns=true --localcores=20 --localmem=217

cellranger count --id=Proto_Phloem2 --transcriptome=/blue/kirst/henryschmidt/SC_Stem_Comparison/Nuclei_Stem/Palba_with_mitochondria_reference --fastqs=/blue/kirst/henryschmidt/SC_Stem_Comparison/Protoplast_Phloem --sample=Phloem2_CRR299241 --include-introns=true --localcores=20 --localmem=217

cellranger count --id=Proto_Phloem3 --transcriptome=/blue/kirst/henryschmidt/SC_Stem_Comparison/Nuclei_Stem/Palba_with_mitochondria_reference --fastqs=/blue/kirst/henryschmidt/SC_Stem_Comparison/Protoplast_Phloem --sample=Phloem3_CRR299242 --include-introns=true --localcores=20 --localmem=217

cellranger count --id=Proto_Phloem4 --transcriptome=/blue/kirst/henryschmidt/SC_Stem_Comparison/Nuclei_Stem/Palba_with_mitochondria_reference --fastqs=/blue/kirst/henryschmidt/SC_Stem_Comparison/Protoplast_Phloem --sample=Phloem4_CRR299243 --include-introns=true --localcores=20 --localmem=217

cellranger count --id=Proto_Phloem5 --transcriptome=/blue/kirst/henryschmidt/SC_Stem_Comparison/Nuclei_Stem/Palba_with_mitochondria_reference --fastqs=/blue/kirst/henryschmidt/SC_Stem_Comparison/Protoplast_Phloem --sample=Phloem5_CRR299244 --include-introns=true --localcores=20 --localmem=217

cellranger count --id=Proto_Phloem6 --transcriptome=/blue/kirst/henryschmidt/SC_Stem_Comparison/Nuclei_Stem/Palba_with_mitochondria_reference --fastqs=/blue/kirst/henryschmidt/SC_Stem_Comparison/Protoplast_Phloem --sample=Phloem6_CRR299245 --include-introns=true --localcores=20 --localmem=217

cellranger count --id=Proto_Phloem7 --transcriptome=/blue/kirst/henryschmidt/SC_Stem_Comparison/Nuclei_Stem/Palba_with_mitochondria_reference --fastqs=/blue/kirst/henryschmidt/SC_Stem_Comparison/Protoplast_Phloem --sample=Phloem7_CRR299246 --include-introns=true --localcores=20 --localmem=217

cellranger count --id=Proto_Phloem8 --transcriptome=/blue/kirst/henryschmidt/SC_Stem_Comparison/Nuclei_Stem/Palba_with_mitochondria_reference --fastqs=/blue/kirst/henryschmidt/SC_Stem_Comparison/Protoplast_Phloem --sample=Phloem8_CRR299247 --include-introns=true --localcores=20 --localmem=217