#!/bin/bash
#SBATCH --job-name=samtoolsFilter
#SBATCH --mem=750Mb
#SBATCH --mail-user=schaal.s@northeastern.edu
#SBATCH --mail-type=FAIL
#SBATCH --partition=short
#SBATCH --time=0:30:00
#SBATCH --cpus-per-task=2
#SBATCH --output=../samtools_filter_Out/clustOut/samtoolsFilter.%j.out
#SBATCH --error=../samtools_filter_Out/clustOut/samtoolsFilter.%j.err
source activate lotterhos_utils_sara
samtools view -@2 -h -q 10 -F 0x100 -F 0x400 ../picard_Out/Pop7_18163aln.sorted.md.bam | mawk '$6 !~ /[1-9][0-9].[SH]/'| samtools view -@2 -b > ../samtools_filter_Out/Pop7_18163.f.bam
wait
picard AddOrReplaceReadGroups I=../samtools_filter_Out/Pop7_18163.f.bam O=../labeled_bam_Out/Pop7_18163.f.rg.bam RGID=Pop7_18163 RGSM=Pop7_18163 RGPL=Illumina RGLB=lib1 RGPU=unit1
