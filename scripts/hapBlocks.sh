#!/bin/bash -l
#SBATCH -D /home/kcrosby/pedigree/data/bedfiles
#SBATCH -o /home/kcrosby/pedigree/logs/out_log-%j.txt
#SBATCH -e /home/kcrosby/pedigree/logs/err_log-%j.txt
#SBATCH -J blocks
set -e
set -u
set -o pipefail
OUTDIR="/home/kcrosby/pedigree/plink_outputs_clean"

module load plink/1.90
plink --bfile bedmerged --blocks --make-founders 
