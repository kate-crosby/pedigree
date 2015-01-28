# Beagle workflow
From the imputed/phased GBS data, I chose a subset of lines to work with (106 initially with known parentage - according to Howie Smith).

The issue with this initial list is that it contained over 30 GBS samples of B73. The idea was that these would match each other perfectly because well, they are (or should) be all the same (they are actual duplicates). This is not the case. I detected only 21 segments with significant IBD, and none of the B73 matched each other (in spite of Mo17 and Oh43 each matching its owns duplicates). I have no idea why this is. But, I know it's not because the LOD score was set too high (have ruled this out) in beagle, by setting it very low. See below. This output a lot of IBD segments but again grepping while it was running revealed no B73 pairs.

```
java -jar beagle.r1398.jar gt=vcfSubsetBeagle.vcf.gz ibd=true ibdtrim=10 overlap=50 window=300 nthreads=4 ibdlod=0.1 out=out_subset_GBS_minLOD.gt
```

Beagle appears to be ignoring many of these duplicates of B73. The next solution is to eliminate most of them or at least have the same number as Oh43 and Mo17. I have a suspicion that the B73 LODs are actually insanely high, or samples completely identical and as such are discarded - but I have emailed Browning to double check if this is a possibility as to how Beagle behaves. I am also just going to eliminate all but 5 B73 samples that have different naming conventions in the list and rerun Beagle again 'keep_list_lessB73.txt'.

So run TASSEL - keep just certain accessions and output as plink with n = 77:

```
for file in *.gz
do
        echo "$file: " $(run_pipeline.pl -Xmx15g -fork1 -h $file -includeTaxaInfile keep_list_lessB73.txt -export -exportType Plink -runfork1)
done
```
This outputs the specific rows of samples I want by each chromosome. Next I'll merge these as one plink file and recode as vcf 4.1. This is because Tassel outputs vcf 4.0 and beagle does not tolerate it.

```
plink --file subsetchr10_77 --merge-list merge77_subset.txt --make-bed --out bed77_subset
plink --bfile bed77_subset --recode vcf --out vcfSubset_77Beagle
```

Copy the vcf to the Beagle dir, gzip, and run using same parameters as before.

```
java -jar beagle.r1398.jar gt=vcfSubset_77Beagle.vcf.gz ibd=true ibdtrim=10 overlap=50 window=300 nthreads=4 out=out_subset_77GBS.gt
```





