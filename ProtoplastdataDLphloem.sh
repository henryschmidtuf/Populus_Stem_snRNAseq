#!/bin/bash 
#SBATCH --job-name=ProtoplastdataDLphloem		    # Job name 
#SBATCH -o ProtoplastdataDLphloem.out		        # Output file			   	
#SBATCH -e ProtoplastdataDLphloemL.err		        # Error file
#SBATCH --mail-type=ALL            # Mail events (NONE, BEGIN, END, FAIL, ALL) 
#SBATCH --mail-user=henryschmidt@ufl.edu     	# Where to send mail	 
#SBATCH --ntasks=20                      # Run on a single CPU 
#SBATCH --mem=16gb                       # Job memory request 
#SBATCH --time=8:00:00                 # Time limit hrs:min:sec
#SBATCH --account=kirst

wget https://download.cncb.ac.cn/gsa/CRA004476/CRR299240/CRR299240_f1.fastq.gz
wget https://download.cncb.ac.cn/gsa/CRA004476/CRR299240/CRR299240_r2.fastq.gz

wget https://download.cncb.ac.cn/gsa/CRA004476/CRR299241/CRR299241_f1.fastq.gz
wget https://download.cncb.ac.cn/gsa/CRA004476/CRR299241/CRR299241_r2.fastq.gz

wget https://download.cncb.ac.cn/gsa/CRA004476/CRR299242/CRR299242_f1.fastq.gz
wget https://download.cncb.ac.cn/gsa/CRA004476/CRR299242/CRR299242_r2.fastq.gz

wget https://download.cncb.ac.cn/gsa/CRA004476/CRR299243/CRR299243_f1.fastq.gz
wget https://download.cncb.ac.cn/gsa/CRA004476/CRR299243/CRR299243_r2.fastq.gz

wget https://download.cncb.ac.cn/gsa/CRA004476/CRR299244/CRR299244_f1.fastq.gz
wget https://download.cncb.ac.cn/gsa/CRA004476/CRR299244/CRR299244_r2.fastq.gz

wget https://download.cncb.ac.cn/gsa/CRA004476/CRR299245/CRR299245_f1.fastq.gz
wget https://download.cncb.ac.cn/gsa/CRA004476/CRR299245/CRR299245_r2.fastq.gz

wget https://download.cncb.ac.cn/gsa/CRA004476/CRR299246/CRR299246_f1.fastq.gz
wget https://download.cncb.ac.cn/gsa/CRA004476/CRR299246/CRR299246_r2.fastq.gz

wget https://download.cncb.ac.cn/gsa/CRA004476/CRR299247/CRR299247_f1.fastq.gz
wget https://download.cncb.ac.cn/gsa/CRA004476/CRR299247/CRR299247_r2.fastq.gz

