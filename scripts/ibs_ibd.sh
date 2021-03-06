#!/bin/bash -l
#SBATCH -D /home/kcrosby/pedigree/data/hapmap55k
#SBATCH -o /home/kcrosby/pedigree/logs/out_log-%j.txt
#SBATCH -e /home/kcrosby/pedigree/logs/err_log-%j.txt
#SBATCH -J ibsibd
set -e
set -u
set -o pipefail
module load plink/1.90

plink --bfile cleanedHapMap55 --genome --min 0.05 --out primus55


