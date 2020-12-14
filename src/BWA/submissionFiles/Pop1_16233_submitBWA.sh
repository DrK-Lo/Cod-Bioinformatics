#!/bin/bash
#SBATCH --job-name=Pop1_16233_submitBWA
#SBATCH --mem=3Gb
#SBATCH --mail-user=schaal.s@northeastern.edu
#SBATCH --mail-type=FAIL
#SBATCH --partition=lotterhos
#SBATCH --time=15:00:00
#SBATCH --nodes=1
#SBATCH --tasks-per-node=1
#SBATCH --output=BWA_Out/clustOut/Pop1_16233.%j.out
#SBATCH --error=BWA_Out/clustOut/Pop1_16233.%j.err
module load lotterhos/2020-08-24
source activate lotterhos-py38
bwa mem -O 5 -B 3 -a -M BWA_genome/GCF_902167405.1_gadMor3.0_genomic.fna FastP_Out/Pop1_16233.R1.fq.gz FastP_Out/Pop1_16233.R2.fq.gz  > BWA_Out/Pop1_16233aln.sam
