Pedigree
========

Here lives a version controlled repo of my attempt at building IBD based pedigrees of maize with fully phased imputed HapMap 2.7 GBS data from [Romay et al. 2013] (http://genomebiology.com/2013/14/6/R55). Note, in all cases where I mention plink - I'm using plink 1.9 - and calling with module load plink/1.90 on FARM. To see [plink flag index - THERE ARE A LOT] (https://www.cog-genomics.org/plink2/index) as I did not define all the flags below.

### Workflow
- Get the data: 
```
wget http://www.panzea.org/dynamic/derivative_data/genotypes/AmesUSInbreds_AllZeaGBSv1.0_imputed-130508.zip
```

- Use Tassel to convert hmp.txt.gz files to basic plink .map and .ped (with no sex, no phenotype, no family id, and no parents) in scripts folder: hmpchr_allplk.sh
```
for file in *.gz
do
        echo "$file: " $(run_pipeline.pl -Xmx15g -fork1 -h $file -export -exportType Plink -runfork1)
done
```
- Prior to converting to binary files the converted plink/map files were merged (all chromosomes included) in ped and map. This is because the data must be cleaned in this format and then converted to bed, bim and fam

```
plink --file AmesUSInbreds_AllZeaGBSv1.0_imputed_20130508_chr10.plk --merge-list allfiles.txt --recode --out pedmapmerged
```

- Now ready to clean the data and convert to binary format with cleanPCA.sh. The purpose of running this script is to filter the data according to missingness (remove any SNP that has 10% missing data, remove any individual genotype with 10% missing data and set minor allele frequency to 5%) and convert to binary format. Then run flashpca on output 'cleanedbed' files.

```
plink --file pedmapmerged --mind 0.1 --geno 0.1 --maf 0.05 --make-bed --out cleanedbed
```
- We had 4476 individuals to start with 681257 variants, and after running the above we have 3449 individuals and 575798 variants left with total genotyping rate in these samples being 0.948696

## Running flashPCA

See this [repo](https://github.com/gabraham/flashpca). Appears that cleaning is super important to obtaining non-spurious results.

## Create the plink.genome file again but this time from the 'cleanedbed' files
- Next you need to create an ibs/ibd "plink.genome" file - this is the file that is read into PRIMUS to construct relationships (some of these flags may be deprecated):

```
plink --bfile cleanedbed --genome --genome-full --rel-check --min 0.05
```
Use this file 'plink.genome' with PRIMUS.

## Pedigrees with PRIMUS v. 1.8.0
- Use [PRIMUS] (https://primus.gs.washington.edu/primusweb/index.html) to build IBD pedigree with plink.genome file (not in repo too large - on FARM). Initial tests throw not an error - but "Unable to predict relationship from IBD estimates for xsample <-> ysample?"
        - More ideas: investigate [LD pruning in plink] (http://pngu.mgh.harvard.edu/~purcell/plink/summary.shtml#prune), which appears to be important before running PRIMUS
        


- Try out [PREPARE?] (http://www.ploscompbiol.org/article/info%3Adoi%2F10.1371%2Fjournal.pcbi.1003610)
