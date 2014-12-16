#!/bin/bash
#OUTDIR=/home/kcrosby/pedigree/data/processed_plink
#SBATCH -D /home/kcrosby/pedigree/data/processed_plink
#SBATCH -o /home/kcrosby/pedigree/data/logs/out_log-%j.txt
#SBATCH -e /home/kcrosby/pedigree/data/logs/err_log-%j.txt
#SBATCH -J mkbed
set -e
set -u
set -o pipefail

module load plink/1.90

plink --file AmesUSInbreds_AllZeaGBSv1.0_imputed_20130508_chr1.plk --make-bed --out Ameschr1
plink --file AmesUSInbreds_AllZeaGBSv1.0_imputed_20130508_chr2.plk --make-bed --out Ameschr2 
plink --file AmesUSInbreds_AllZeaGBSv1.0_imputed_20130508_chr3.plk --make-bed --out Ameschr3
plink --file AmesUSInbreds_AllZeaGBSv1.0_imputed_20130508_chr4.plk --make-bed --out Ameschr4
plink --file AmesUSInbreds_AllZeaGBSv1.0_imputed_20130508_chr5.plk --make-bed --out Ameschr5
plink --file AmesUSInbreds_AllZeaGBSv1.0_imputed_20130508_chr6.plk --make-bed --out Ameschr6
plink --file AmesUSInbreds_AllZeaGBSv1.0_imputed_20130508_chr7.plk --make-bed --out Ameschr7
plink --file AmesUSInbreds_AllZeaGBSv1.0_imputed_20130508_chr8.plk --make-bed --out Ameschr8
plink --file AmesUSInbreds_AllZeaGBSv1.0_imputed_20130508_chr9.plk --make-bed --out Ameschr9
plink --file AmesUSInbreds_AllZeaGBSv1.0_imputed_20130508_chr10.plk --make-bed --out Ameschr10
