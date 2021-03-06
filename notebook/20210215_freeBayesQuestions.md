## FreeBayes

KEL: **Sara cannot afford the time to run FreeBayes twice if it takes a few weeks to run. Can you guarantee with 100% certainty that she will not have to run it again?**

--> If Jon cannot gaurantee that with 100% certainty, then develop a strategy to get variants called on subsets of the data that will finish quicker.

Questions: 
1) we have some populations that we are unsure will be separate populations (i.e., spring spawners) do we need to account for that in the SNP calling?
2) Should I be filtering any reads beforehand?
3) From my understanding, I will be making one large Bam file with all samples to then pipe into freebayes? I have all my individual samples sorted and indexed but do I then need to resort and reindex when I make this big file? 
4) -C how many observations should we consider a variant? - jon uses the -F for fraction of reads 10% have to show a variant
5) -g Skip over regions with really high read depth? - don't set this either
6) freebayes-parallel - Run in parallel?
7) -@ --variant-input VCF Use variants reported in VCF file as input to the algorithm. A report will be generated for every record in the VCF file. Do we need this for potentially the PanI locus?
8) -m min mapping or -q base quality mapping default is 1 and base default is 0
9) -! min-coverage to process as a site - jon doesn't set this
10) Split by chromosome?
11) -n limits the number of alleles to consider jon sets to 10
min complex -E 3 is the default don't need to change

Notes:

freebayes -b BIGbamfile.bam -f reference.fasta > out.vcf

-m 5 -q 5 -E 3 --min-repeat-entropy 1 --populations popmap -n 10 -F 0.1