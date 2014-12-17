#!/bin/bash -l
#SBATCH -D /home/kcrosby/pedigree/data/bedfiles
#SBATCH -o /home/kcrosby/pedigree/logs/out_log-%j.txt
#SBATCH -e /home/kcrosby/pedigree/logs/err_log-%j.txt
#SBATCH -J flashP84
set -e
set -u
set -o pipefail

flashpca --bfile cleanedbed --stand center --numthreads 8 --outvec eigenvectorR --outload SNPloadR --outval eigenvalueR
