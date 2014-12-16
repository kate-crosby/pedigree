#!/bin/bash -l
#SBATCH -D /home/kcrosby/pedigree/data/bedfiles
#SBATCH -o /home/kcrosby/pedigree/logs/out_log-%j.txt
#SBATCH -e /home/kcrosby/pedigree/logs/err_log-%j.txt
#SBATCH -J freqAmes
set -e
set -u
set -o pipefail

module load plink/1.90
plink --bfile bedmerged --freqx
plink --bfile bedmerged --freq --missing
plink --bfile bedmerged --ibc

