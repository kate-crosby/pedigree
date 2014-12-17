#!/bin/bash
#SBATCH -D /home/kcrosby/pedigree/data/raw_imputed
#SBATCH -o /home/kcrosby/pedigree/logs/out_log-%j.txt
#SBATCH -e /home/kcrosby/pedigree/logs/err_log-%j.txt
#SBATCH -J convert
set -e
set -u
set -o pipefail
OUTDIR="home/kcrosby/pedigree/data/processed_plink"
module load gcc jdk/1.8 tassel/5

for file in *.gz
do
	echo "$file: " $(run_pipeline.pl -Xmx15g -fork1 -h $file -export -exportType Plink -runfork1)
done
