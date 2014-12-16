#!/bin/bash -l
#SBATCH -D /home/kcrosby/pedigree/data/bedfiles
#SBATCH -o /home/kcrosby/pedigree/logs/out_log-%j.txt
#SBATCH -e /home/kcrosby/pedigree/logs/err_log-%j.txt
#SBATCH -J prunePCA
set -e
set -u
set -o pipefail

module load plink/1.90
plink --bfile bedmerged --indep 50 5 2 

