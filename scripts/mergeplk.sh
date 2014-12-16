#!/bin/bash
#SBATCH -D /home/kcrosby/pedigree/data/processed_plink
#SBATCH -o /home/kcrosby/pedigree/data/logs/out_log-%j.txt
#SBATCH -e /home/kcrosby/pedigree/data/logs/err_log-%j.txt
#SBATCH -J mkbed
set -e
set -u
set -o pipefail

module load plink/1.90

plink --file AmesUSInbreds_AllZeaGBSv1.0_imputed_20130508_chr10.plk --merge-list allfiles.txt --make-bed --out bedmerged
