#!/bin/bash
#SBATCH --job-name=SAIGE_nosd
#SBATCH --time=01:00:00
#SBATCH --mail-type=NONE
#SBATCH --mem=1g
#SBATCH --cpus-per-task=1
#SBATCH --array=3,31,38,116,136,148,171,193,223,226,228,256,258,270,291,294,296,311,352,354,391,394

Rscript /net/wonderland/home/wangmk/GSRA/RHEmc-SAIGE-Compare/SAIGE/step1_fitNULLGLMM.R     \
        --plinkFile=/net/wonderland/home/wangmk/GSRA/RHEmc-SAIGE-Compare/plink/example \
        --phenoFile=/net/wonderland/home/wangmk/GSRA/RHEmc-SAIGE-Compare/SAIGE/simulatedphenos/pheno_$SLURM_ARRAY_TASK_ID.txt \
        --phenoCol=y_quantitative \
        --sampleIDColinphenoFile=IID \
        --traitType=quantitative       \
	--invNormalize=FALSE	\
        --outputPrefix=/net/wonderland/home/wangmk/GSRA/RHEmc-SAIGE-Compare/SAIGE/output/out_$SLURM_ARRAY_TASK_ID \
        --isCovariateTransform=FALSE \
        --nThreads=4 \
        --LOCO=FALSE	\
	--tauInit=0,0 >/dev/null

