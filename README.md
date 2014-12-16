Pedigree
========

Here lives a version controlled repo of my attempt at building IBD based pedigrees of maize with fully phased imputed HapMap 2.7 GBS data from [Romay et al. 2013] (http://genomebiology.com/2013/14/6/R55). 

### Workflow
1. Get the data: 
```
wget http://www.panzea.org/dynamic/derivative_data/genotypes/AmesUSInbreds_AllZeaGBSv1.0_imputed-130508.zip
```

2. Use Tassel to convert .gz files to basic plink .map and .ped (with no sex, no phenotype, no family id, and no parents) in scripts folder. 

3. Use plink to merge all chromosomes into one file and create binary files. 

4. Use [PRIMUS] (https://primus.gs.washington.edu/primusweb/index.html) to build IBD pedigree with plink.genome file (not in repo - too large - on FARM).

5. Try out [PREPARE?] (http://www.ploscompbiol.org/article/info%3Adoi%2F10.1371%2Fjournal.pcbi.1003610)
