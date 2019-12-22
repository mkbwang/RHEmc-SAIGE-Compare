#!/bin/bash
#SBATCH --job-name=RHEmc_nosd
#SBATCH --time=00:30:00
#SBATCH --mail-type=NONE
#SBATCH --mem=1g
#SBATCH --cpus-per-task=1
#SBATCH --array=1-400

/net/wonderland/home/wangmk/GSRA/RHEmc-SAIGE-Compare/RHEmc/RHEmc \
    -g /net/wonderland/home/wangmk/GSRA/RHEmc-SAIGE-Compare/RHEmc/adr.txt \
    -p /net/wonderland/home/wangmk/GSRA/RHEmc-SAIGE-Compare/RHEmc/simulatedphenos/pheno_$SLURM_ARRAY_TASK_ID.txt \
    -k 500 -jn 100 \
    -o /net/wonderland/home/wangmk/GSRA/RHEmc-SAIGE-Compare/RHEmc/output/out_$SLURM_ARRAY_TASK_ID.txt \
    -annot /net/wonderland/home/wangmk/GSRA/RHEmc-SAIGE-Compare/RHEmc/annot.txt > /dev/null

