#!/bin/bash -l
#SBATCH -D /home/kcrosby/pedigree/data/processed_plink
#SBATCH -o /home/kcrosby/pedigree/logs/out_log-%j.txt
#SBATCH -e /home/kcrosby/pedigree/logs/err_log-%j.txt
#SBATCH -J cleanPCA
set -e
set -u
set -o pipefail
OUTDIR="home/kcrosby/pedigree/data/bedfiles"

module load plink/1.90
plink --file pedmapmerged --mind 0.1 --geno 0.1 --maf 0.05 --make-bed --out cleanedbed
