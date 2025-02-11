#!/bin/bash 
#SBATCH --job-name=ProtoplastdataDL		    # Job name 
#SBATCH -o ProtoplastdataDL.out		        # Output file			   	
#SBATCH -e ProtoplastdataDL.err		        # Error file
#SBATCH --mail-type=ALL            # Mail events (NONE, BEGIN, END, FAIL, ALL) 
#SBATCH --mail-user=henryschmidt@ufl.edu     	# Where to send mail	 
#SBATCH --ntasks=20                      # Run on a single CPU 
#SBATCH --mem=16gb                       # Job memory request 
#SBATCH --time=8:00:00                 # Time limit hrs:min:sec
#SBATCH --account=kirst

wget https://download.cncb.ac.cn/gsa/CRA004476/CRR299240/CRR299240_f1.fastq.gz
wget https://download.cncb.ac.cn/gsa/CRA004476/CRR299240/CRR299240_r2.fastq.gz

wget https://download.cncb.ac.cn/gsa/CRA004476/CRR299250/CRR299250_f1.fastq.gz
wget https://download.cncb.ac.cn/gsa/CRA004476/CRR299250/CRR299250_r2.fastq.gz
wget https://download.cncb.ac.cn/gsa/CRA004476/CRR299251/CRR299251_f1.fastq.gz
wget https://download.cncb.ac.cn/gsa/CRA004476/CRR299251/CRR299251_r2.fastq.gz
wget https://download.cncb.ac.cn/gsa/CRA004476/CRR299252/CRR299252_f1.fastq.gz
wget https://download.cncb.ac.cn/gsa/CRA004476/CRR299252/CRR299252_r2.fastq.gz
wget https://download.cncb.ac.cn/gsa/CRA004476/CRR299253/CRR299253_f1.fastq.gz
wget https://download.cncb.ac.cn/gsa/CRA004476/CRR299253/CRR299253_r2.fastq.gz
wget https://download.cncb.ac.cn/gsa/CRA004476/CRR299254/CRR299254_f1.fastq.gz
wget https://download.cncb.ac.cn/gsa/CRA004476/CRR299254/CRR299254_r2.fastq.gz 
wget https://download.cncb.ac.cn/gsa/CRA004476/CRR299255/CRR299255_f1.fastq.gz
wget https://download.cncb.ac.cn/gsa/CRA004476/CRR299255/CRR299255_r2.fastq.gz
