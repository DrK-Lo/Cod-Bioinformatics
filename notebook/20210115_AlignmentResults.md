# Analyzing alignment coverage

My initial evaluation of coverage was confusing because the numbers were so high.

## Check a set of samples through whole pipeline

i5_9 & i7_3

*Sequencer results*

number of reads: 144631311
Total sequences: 2 * 144631311 = 289262622
Yield (Mb): 43388 (= 144631311 * 300/10^6)
Average coverage: 70.78/4 = 17.7X

### Stacks results 

Total Sequnces: 289262622

*Per sample reads:*
Pop6_18017 - 58131592
Pop5_17278 - 69930118
Pop1_17291 - 75198088
Pop4_17236 - 74341164

*Per sample Yield (MB):*
Pop6_18017 - 58131592 * 300/10^6 = 17439.48
Pop5_17278 - 69930118 * 300/10^6 = 20979.04
Pop1_17291 - 75198088 * 300/10^6 = 22559.43
Pop4_17236 - 74341164 * 300/10^6 = 22302.35

*Per sample Coverage:*
Pop6_18017 - 17439.48/613 = 28.45 / 2 = 14.23
Pop5_17278 - 20979.04/613 = 34.22 / 2 = 17.11
Pop1_17291 - 22559.43/613 = 36.80 / 2 = 18.40
Pop4_17236 - 22302.35/613 = 36.38 / 2 = 18.39

### FastP results

*Reads after filtering:*
Pop6_18017 - 57449434
Pop5_17278 - 69115312
Pop1_17291 - 74298686
Pop4_17236 - 73432362

*Per sample Coverage:*
Pop6_18017 - 57449434 * 300/10^6 / 613 = 28.11 /2 = 14.05
Pop5_17278 - 69115312 * 300/10^6 / 613 = 33.82 /2 = 16.91
Pop1_17291 - 74298686 * 300/10^6 / 613 = 36.36 /2 = 18.18
Pop4_17236 - 73432362 * 300/10^6 / 613 = 35.94 /2 = 17.97

### BWA results 
*Paired in Sequencing*
matches post FastP match BWA results
Pop6_18017 - 57449434
Pop5_17278 - 69115312
Pop1_17291 - 74298686 
Pop4_17236 - 73432362

*Properly paired*
Pop6_18017 - 53871116 * 300/10^6 / 613 = 26.36 / 2 = 13.18
Pop5_17278 - 65351122 * 300/10^6 / 613 = 31.98 / 2 = 15.99
Pop1_17291 - 70504584 * 300/10^6 / 613 = 34.50 / 2 = 17.25
Pop4_17236 - 69644192 * 300/10^6 / 613 = 34.08 / 2 = 17.04

Questions:
What coverage do I use since we tried to have an insert size of 300 for sequencing so coverage of the genome may not be the divided by two number? 
Also how should we interpret the results of the alignment with the paiired in sequencing vs. properly paired?

![Alignment Results](../Figures/AlignmentResults.pdf)
