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

- Make binary plink files of each chromosome - plink did not like automation (so one per line), i.e. bed, fam, bim, no sex files
```
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
```

- Merge separate chromosome bed files into larger bed, fam, bim file - mergeplk.sh - located in data/bedmerged - note you must start with the first file - chrom. 10 in this case and use a white-spaced plain text of all the files (allfiles.txt or whatever) you want to do this to.
```
plink --file AmesUSInbreds_AllZeaGBSv1.0_imputed_20130508_chr10.plk --merge-list allfiles.txt --make-bed --out bedmerged
```

- Next you need to create an ibs/ibd "plink.genome" file - this is the file that is read into PRIMUS to construct relationships (some of these flags may be deprecated):

```
plink --bfile bedmerged --genome --genome-full --rel-check --min 0.05
```

- Use [PRIMUS] (https://primus.gs.washington.edu/primusweb/index.html) to build IBD pedigree with plink.genome file (not in repo too large - on FARM). Initial tests throw not an error - but "Unable to predict relationship from IBD estimates for xsample <-> ysample?"
        - More ideas: investigate [LD pruning in plink] (http://pngu.mgh.harvard.edu/~purcell/plink/summary.shtml#prune), which appears to be important before running PRIMUS
        


- Try out [PREPARE?] (http://www.ploscompbiol.org/article/info%3Adoi%2F10.1371%2Fjournal.pcbi.1003610)
