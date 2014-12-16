#!/bin/bash
#OUTDIR=home/kcrosby/pedigree/data/processed_plink
#SBATCH -D /home/kcrosby/pedigree/data/raw_imputed
#SBATCH -o /home/kcrosby/pedigree/data/logs/out_log-%j.txt
#SBATCH -e /home/kcrosby/pedigree/data/logs/err_log-%j.txt
#SBATCH -J test1chr
set -e
set -u
set -o pipefail

module load gcc jdk/1.8 tassel/5

for file in *.gz
do
	echo "$file: " $(run_pipeline.pl -Xmx15g -fork1 -h $file -export -exportType Plink -runfork1)
done
