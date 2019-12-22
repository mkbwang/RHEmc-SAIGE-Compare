
library(BEDMatrix)


# read in the genotype matrix
# Note: Set the directory so that you can read in the file
genotype = BEDMatrix("plink/example.bed", n = NULL, p = NULL, simple_names = FALSE)
genotype = as.matrix(genotype)
standard_geno = scale(genotype)

Nindv = dim(genotype)[1]
Nsnp = dim(genotype)[2]
h = 0.9 # this is the parameter that decides the variance components proportion

# template phenotypes files to feed to RHEmc and SAIGE
RHEmc_template = read.table('RHEmc/RHEmc_template.txt', sep="", header=T)
SAIGE_template = read.table('SAIGE/SAIGE_pheno_template.txt', sep="", header=T)

for (i in 1:400){
# output files directory
RHEmc_out = sprintf("RHEmc/simulatedphenos/pheno_%d.txt", i)
RHEmc_sd_out = sprintf("RHEmc/simulatedphenos_sd/pheno_%d.txt", i)
SAIGE_out = sprintf("SAIGE/simulatedphenos/pheno_%d.txt", i)
SAIGE_sd_out = sprintf("SAIGE/simulatedphenos_sd/pheno_%d.txt", i)
y_int = genotype %*% rnorm(Nsnp)
y = scale(y_int) * h + sqrt(1-h^2)*rnorm(Nindv)
y_sd_int = standard_geno %*% rnorm(Nsnp)
y_sd = scale(y_sd_int) * h + sqrt(1-h^2)*rnorm(Nindv)

# write RHEmc files(both standardized and non-standardized ones)
RHEmc_template$y_quantitative = y
write.table(RHEmc_template, file=RHEmc_out, sep=" ", row.names=F, quote = F)
RHEmc_template$y_quantitative = y_sd
write.table(RHEmc_template, file=RHEmc_sd_out, sep=" ", row.names=F, quote = F)

# write SAIGE files(both standardized and non-standardized ones)
SAIGE_template$y_quantitative = y
write.table(SAIGE_template, file=SAIGE_out, sep=" ", row.names=F, quote = F)
SAIGE_template$y_quantitative = y_sd
write.table(SAIGE_template, file=SAIGE_sd_out, sep=" ", row.names=F, quote = F)
}
