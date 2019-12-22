# RHEmc-SAIGE-Compare
This repo offers guidance in terms of how to generate simulated phenotypes to compare the performance of RHEmc and the first step of SAIGE in terms of variance component estimation. There are also example bash scripts that help run the SAIGE and RHEmc analysis.

## Environment
All the instructions in this repo should be run on a Center for Statistical Genetics(CSG) cluster at the University of Michigan.

## Phenotype Generation

First, clone this repository into the cluster. The second step is to run the `gen_pheno.R` script. Before that, 
You will need to install the [BEDMatrix](https://cran.r-project.org/web/packages/BEDMatrix/index.html) package. Type in the R console 
```
install.packages("BEDMatrix")
```

Then create the folders which will hold the simulated phenotypes as well as the analysis results. Type in the bash shell
```
mkdir SAIGE/simulatedphenos
mkdir SAIGE/simulatedphenos_sd
mkdir RHEmc/simulatedphenos
mkdir RHEmc/simulatedphenos_sd
mkdir RHEmc/output
mkdir RHEmc/output_sd
mkdir SAIGE/output
mkdir SAIGE/output_sd
```

After that, type in the bash shell

```
Rscript gen_pheno.R
```
Then the simulated phenotypes will be in the RHEmc and SAIGE folders. Note that in both RHEmc and SAIGE folders there are two folders that contain simulated phenotypes. One folder has "sd" in it, representing that the genotype matrix has been standardized before simulating the phenotypes. The other folder doesn't have "sd" in it, representing that the genotype matrix is used as it is when simulating phenotypes.

## Running RHEmc

Please follow the suggestions in the README file in RHEmc folder.

## Running SAIGE

Please follow the suggestions in the README file in SAIGE folder.
