#!/bin/bash -l
#SBATCH -D /home/kcrosby/pedigree/data/NAM
#SBATCH -o /home/kcrosby/pedigree/logs/out_log-%j.txt
#SBATCH -e /home/kcrosby/pedigree/logs/err_log-%j.txt
#SBATCH -J convert
#SBATCH --mail-type=END
#SBATCH --mail-user=kcrosby@ucdavis.edu
#SBATCH -p serial
set -e
set -u
set -o pipefail

module load gcc jdk/1.8 tassel/5

for file in *.gz
do
	echo "$file: " $(run_pipeline.pl -Xmx15g -fork1 -h $file -export -exportType Plink -runfork1)
done
