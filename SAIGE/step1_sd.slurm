#!/bin/bash
#SBATCH --job-name=SAIGE_sd
#SBATCH --time=00:45:00
#SBATCH --mail-type=NONE
#SBATCH --mem=1g
#SBATCH --cpus-per-task=1
#SBATCH --array=1-400

Rscript /net/wonderland/home/wangmk/GSRA/RHEmc-SAIGE-Compare/SAIGE/step1_fitNULLGLMM.R     \
        --plinkFile=/net/wonderland/home/wangmk/GSRA/RHEmc-SAIGE-Compare/plink/example \
        --phenoFile=/net/wonderland/home/wangmk/GSRA/RHEmc-SAIGE-Compare/SAIGE/simulatedphenos_sd/pheno_$SLURM_ARRAY_TASK_ID.txt \
        --phenoCol=y_quantitative \
        --sampleIDColinphenoFile=IID \
        --traitType=quantitative       \
	--invNormalize=FALSE	\
        --outputPrefix=/net/wonderland/home/wangmk/GSRA/RHEmc-SAIGE-Compare/SAIGE/output_sd/out_$SLURM_ARRAY_TASK_ID \
        --isCovariateTransform=FALSE \
        --nThreads=4 \
        --LOCO=FALSE	\
	--tauInit=0,0 >/dev/null

