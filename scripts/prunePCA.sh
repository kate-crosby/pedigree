#!/bin/bash -l
#SBATCH -D /home/kcrosby/pedigree/data/bedfiles
#SBATCH -o /home/kcrosby/pedigree/logs/out_log-%j.txt
#SBATCH -e /home/kcrosby/pedigree/logs/err_log-%j.txt
#SBATCH -J prunePCA
set -e
set -u
set -o pipefail

module load plink/1.90
plink --file pedmapmerged --mind 0.1 --geno 0.1 --maf 0.05 --make-bed --out cleanedbed

