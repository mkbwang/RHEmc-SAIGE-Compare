# How to run SAIGE

To learn about how SAIGE works in detail, check out this [link](https://github.com/weizhouUMICH/SAIGE/wiki/Genetic-association-tests-using-SAIGE).

We are going to send a set of job arrays to the cluster to carry out all the computations parallelly.

To send job arrays, type

```
sbatch step1.slurm
```
or
```
sbatch step1_sd.slurm
```
in the shell. The first case applies to phenotypes generated from the raw genotype matrix, and the second case applies to phenotypes generated from standardized genotype matrix.
The results are going to be in `output` and `output_sd` folders correspondingly.

_Note: You need to customize the directory names in both slurm files to get them running._

To retreve the variance components, you need to go into `output` or `output_sd` folders, then type

```
#open R
R
#load the model file in R
load("out_1.rda") # 
modglmm$theta
```

`theta` is a vector with two elements. The first one is the variance component of random effects and the second one is the variance components of SNPs.

