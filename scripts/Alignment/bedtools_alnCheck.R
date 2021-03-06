## Plot Coverage per Chromosome
library(wesanderson)
library(ggplot2)
library(ggpubr)

#### Using Bedtools Coverage ####
Pop1_samp <- read.table("src/alignment/coverageCalc/Pop1_16216switch.coverageCalc.txt", fill = TRUE)
Pop1_16216 <- Pop1_samp[,c(1,5,11)]
colnames(Pop1_16216) <- c("chr_name", "chr_size", "reads_mapped")
Pop1_16216$reads_mapped <- as.numeric(as.character(Pop1_16216$reads_mapped))
str(Pop1_16216)
Pop1_16216_readL <- 121
Pop1_16216$totalbases <- Pop1_16216$reads_mapped * Pop1_16216_readL
Pop1_16216$coverage <- Pop1_16216$totalbases/Pop1_16216$chr_size
Pop1_16216$samp <- "Pop1_16216"

Pop1_17291_samp <- read.table("src/alignment/coverageCalc/Pop1_17291.coverageCalc.txt", fill = TRUE)
Pop1_17291 <- Pop1_17291_samp[,c(1,5,11)]
colnames(Pop1_17291) <- c("chr_name", "chr_size", "reads_mapped")
Pop1_17291$reads_mapped <- as.numeric(as.character(Pop1_17291$reads_mapped))
str(Pop1_17291)
Pop1_17291_readL <- 126
Pop1_17291$totalbases <- Pop1_17291$reads_mapped * Pop1_17291_readL
Pop1_17291$coverage <- Pop1_17291$totalbases/Pop1_17291$chr_size
Pop1_17291$samp <- "Pop1_17291"

Pop4_17236_samp <- read.table("src/alignment/coverageCalc/Pop4_17236.coverageCalc.txt", fill = TRUE)
Pop4_17236 <- Pop4_17236_samp[,c(1,5,11)]
colnames(Pop4_17236) <- c("chr_name", "chr_size", "reads_mapped")
Pop4_17236$reads_mapped <- as.numeric(as.character(Pop4_17236$reads_mapped))
str(Pop4_17236)
Pop4_17236_readL <- 125
Pop4_17236$totalbases <- Pop4_17236$reads_mapped * Pop4_17236_readL
Pop4_17236$coverage <- Pop4_17236$totalbases/Pop4_17236$chr_size
Pop4_17236$samp <- "Pop4_17236"

Pop5_17278_samp <- read.table("src/alignment/coverageCalc/Pop5_17278.coverageCalc.txt", fill = TRUE)
Pop5_17278 <- Pop5_17278_samp[,c(1,5,11)]
colnames(Pop5_17278) <- c("chr_name", "chr_size", "reads_mapped")
Pop5_17278$reads_mapped <- as.numeric(as.character(Pop5_17278$reads_mapped))
str(Pop5_17278)
Pop5_17278_readL <- 127
Pop5_17278$totalbases <- Pop5_17278$reads_mapped * Pop5_17278_readL
Pop5_17278$coverage <- Pop5_17278$totalbases/Pop5_17278$chr_size
Pop5_17278$samp <- "Pop5_17278"

Pop6_18017_samp <- read.table("src/alignment/coverageCalc/Pop6_18017.coverageCalc.txt", fill = TRUE)
Pop6_18017 <- Pop6_18017_samp[,c(1,5,11)]
colnames(Pop6_18017) <- c("chr_name", "chr_size", "reads_mapped")
Pop6_18017$reads_mapped <- as.numeric(as.character(Pop6_18017$reads_mapped))
str(Pop6_18017)
Pop6_18017_readL <- 126
Pop6_18017$totalbases <- Pop6_18017$reads_mapped * Pop6_18017_readL
Pop6_18017$coverage <- Pop6_18017$totalbases/Pop6_18017$chr_size
Pop6_18017$samp <- "Pop6_18017"

all.samps <- rbind(Pop1_16216[1:23,], Pop1_17291[1:23,], Pop4_17236[1:23,], Pop5_17278[1:23,], Pop6_18017[1:23,])

scat.chromCov <- ggplot(data = all.samps, aes(x = chr_name, y = coverage)) +
  geom_point(data = all.samps, aes(col = samp)) + 
  scale_y_continuous(limits = c(15, 30), breaks = c(15,20,25,30)) + 
  labs(title="Coverage Per Chromosomes",
       y = "Coverage",
       x = "Chromosome Name") + 
  theme(panel.border = element_blank(), panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(), 
        axis.line = element_line(colour = "black")) + 
  theme(axis.text.x = element_text(angle = 90)) +
  scale_color_manual(values = wes_palette(n=5, name="Darjeeling1"))

box.genCov <- ggplot(data = all.samps, aes(x = samp, y = coverage, group = samp)) + 
  geom_boxplot(data = all.samps, aes(col = samp)) +
  scale_color_manual(values = wes_palette(n=5, name="Darjeeling1")) + 
  scale_y_continuous(limits = c(15, 30), breaks = c(15,20,25,30)) +
  labs(title="Average Coverage Over Chromosomes Per Sample",
       y = "Coverage",
       x = "Sample Name") + 
  theme(panel.border = element_blank(), panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(), 
        axis.line = element_line(colour = "black")) + 
  theme(axis.text.x = element_text(angle = 90), legend.position = "none")
  
ggarrange(scat.chromCov, box.genCov, labels = c("A", "B"))


#### Using Bedtools gencoverage

Pop6_18017_genCov <- read.table("src/alignment/coverageCalc/Pop6_18017.GenCovCalc.txt")
Pop6_18017_genCov$samp <- "Pop6_18017"
#df.Pop6_18017.chrom <- Pop6_18017_genCov[3:25,]

Pop5_17278_genCov <- read.table("src/alignment/coverageCalc/Pop5_17278.GenCovCalc.txt")
Pop5_17278_genCov$samp <- "Pop5_17278"
#df.Pop5_17278.chrom <- Pop5_17278_genCov[3:25,]

Pop4_17236_genCov <- read.table("src/alignment/coverageCalc/Pop4_17236.GenCovCalc.txt")
Pop4_17236_genCov$samp <- "Pop4_17236"
#df.Pop4_17236.chrom <- Pop4_17236_genCov[3:25,]

Pop1_17291_genCov <- read.table("src/alignment/coverageCalc/Pop1_17291.GenCovCalc.txt")
Pop1_17291_genCov$samp <- "Pop1_17291"
#df.Pop1_17291.chrom <- Pop1_17291_genCov[3:25,]

Pop1_16216_genCov <- read.table("src/alignment/coverageCalc/Pop1_16216.GenCovCalc.txt")
Pop1_16216_genCov$samp <- "Pop1_16216"
#df.Pop1_16216.chrom <- Pop1_16216_genCov[3:25,]

df.all.data <- rbind(Pop6_18017_genCov, Pop5_17278_genCov, Pop4_17236_genCov, 
                     Pop1_17291_genCov, Pop1_16216_genCov)
colnames(df.all.data) <- c("chr_name", "coverage", "baseCount_withCov", "chr_size", "frac_bases", "samp")


df.all.data$numBase_x_Cov <- df.all.data$coverage * df.all.data$baseCount_withCov
df.sums <- aggregate(cbind(numBase_x_Cov, baseCount_withCov)~samp + chr_name, FUN = sum, data = df.all.data)
df.sums$aveCov <- df.sums$numBase_x_Cov/df.sums$baseCount_withCov
df.chroms <- df.sums[11:125,]

scat.chromCov.gen <- ggplot(data = df.chroms, aes(x = chr_name, y = aveCov)) +
  geom_point(data = df.chroms, aes(col = samp)) + 
  scale_y_continuous(limits = c(10, 25), breaks = c(10,15,20,25)) + 
  labs(title="Coverage Per Chromosomes",
       y = "Coverage",
       x = "Chromosome Name") + 
  theme(panel.border = element_blank(), panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(), 
        axis.line = element_line(colour = "black")) + 
  theme(axis.text.x = element_text(angle = 90)) +
  scale_color_manual(values = wes_palette(n=5, name="Darjeeling1"))

box.genCov.gen <- ggplot(data = df.chroms, aes(x = samp, y = aveCov, group = samp)) + 
  geom_boxplot(data = df.chroms, aes(col = samp)) +
  scale_color_manual(values = wes_palette(n=5, name="Darjeeling1")) + 
  scale_y_continuous(limits = c(10, 25), breaks = c(10,15,20,25)) +
  labs(title="Average Coverage Over Chromosomes Per Sample",
       y = "Coverage",
       x = "Sample Name") + 
  theme(panel.border = element_blank(), panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(), 
        axis.line = element_line(colour = "black")) + 
  theme(axis.text.x = element_text(angle = 90), legend.position = "none")

ggarrange(scat.chromCov.gen, box.genCov.gen, labels = c("A", "B"))




