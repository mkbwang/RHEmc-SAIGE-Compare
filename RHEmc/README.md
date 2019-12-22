# How to run RHEmc

In this folder, there has already been an executable file called `RHEmc`. To learn about how this file is generated, please visit 
this [link](https://github.com/skybullbobby/RHE-mc/tree/simupheno). 

To run jobs parallelly, we are going to submit job arrays to the cluster. To send a series of job arrays, type

```
sbatch runRHEmc.slurm
```
or

```
sbatch runRHEmcsd.slurm
```

in the shell. `runRHEmc.slurm` is used for phenotypes generated from raw genotype matrix and `runRHEmcsd.slurm` is used for standardizes genotype matrix.
The results will be in `output` and `output_sd` correspondingly. In every output txt file, the first number is the variance component of SNP effect and the second number is the variance component of random errors.

**Note: You need to customize the directory name in the two slurm files to get it working.**

To learn more about batch processing, follow this [link](https://slurm.schedmd.com/sbatch.html).
