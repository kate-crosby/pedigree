Pedigree: general worflow, questions, problems, observations
============================================================

Here lives a version controlled repo of my attempt at building IBD based pedigrees of maize with fully phased imputed 2.7 GBS data from [Romay et al. 2013] (http://genomebiology.com/2013/14/6/R55). Note, in all cases where I mention plink - I'm using plink 1.9 - and calling with module load plink/1.90 on FARM. To see [plink flag index - THERE ARE A LOT] (https://www.cog-genomics.org/plink2/index) as I did not define all the flags below.

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
- We had 4476 individuals to start with 681257 variants, and after running the above we have 3449 individuals and 575798 variants left with total genotyping rate in these samples being 0.948696. 

## Running pairwise IBD with plink 1.9/Pedigrees with PRIMUS v. 1.8.0
Running pairwise IBD on GBS 2.7 data is proving a tad difficult. JRI thinks it has something to do with minor allele frequency error in the GBS data being high and suggests going back to 55K SNP chip data (excluding teosinte TILs and BK lines). 
**Update 1** went back to 55k SNP chip data (28 individuals excluding the TILs and BKN lines) ran through same protocol including PRIMUS (primus will do pairwise IBD by calling plink -see below. NB: it appears that allowing PRIMUS to call plink ixnays the "nans" for P(IBD) estimates earlier). Every pairwise IBD estimate in this set P(IBD=0) = 1.000 , P(IBD=1) = 0, P(IBD=2) = 0. Essentially - maximally unrelated or possibly garbage???... sigh. As a result no pedigrees/networks could be constructed. 

```
run_PRIMUS.pl --file cleanedHapMap55 --genome
```

**Update 2** Reran GBS 2.7 through nearly same options (plink and primus) with:

```
run_PRIMUS.pl --file cleanedbed --genome
```

However, this resulted in a number of dot (for plotting pedigrees) and network files showing relationships of lines that are related - there were 490 network outputs. I will need to go through the documentation and figure out exactly what these mean, but the pairwise IBD P(IBD=1 or 2) was much higher for this group, albeit the majority of lines in GBS 2.7 showed high probability of low (0) pairwise IBD. Still no idea if these estimates/networks are garbage or not.

## Running flashPCA

See this [repo](https://github.com/gabraham/flashpca). Appears that cleaning is super important to obtaining non-spurious results. Tried simple default - note, this file requires --ntasks = 4 on bigmemh FARM, fewer and job fails. Produced outfiles 'eigenvectors.txt' and 'eigenvalues.txt'. Attempted LD pruning - but without the --make-founders option, it doesn't do anything. **May have to come back and look at this later - and may require going all the way back to the map file, and using --cm flag.**

```
flashpca --bfile cleanedbed --numthreads 8
```
Import into R, with flashpcaR lib and plot.

## Create the plink.genome file again but this time from the 'cleanedbed' files
- Next you need to create an ibs/ibd "plink.genome" file - this is the file that is read into PRIMUS to construct relationships (some of these flags may be deprecated):

```
plink --bfile cleanedbed --genome --genome-full --rel-check --min 0.05
```
Use this file 'plink.genome' with PRIMUS - or just use the cleanedbed file (above), and allow PRIMUS to call plink to perform pairwise IBD, while reconstructing pedigrees.

        


- Try out [PREPARE?] (http://www.ploscompbiol.org/article/info%3Adoi%2F10.1371%2Fjournal.pcbi.1003610)
