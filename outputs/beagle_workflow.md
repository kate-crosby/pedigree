# Beagle workflow
From the imputed/phased GBS data, I chose a subset of lines to work with (106 initially with known parentage - according to Howie Smith).

The issue with this initial list is that it contained over 30 GBS samples of B73. The idea was that these would match each other perfectly because well, they are (or should) be all the same (they are actual duplicates). This is not the case. I detected only 21 segments with significant IBD, and none of the B73 matched each other (in spite of Mo17 and Oh43 each matching its owns duplicates). I have no idea why this is. But, I know it's not because the LOD score was set too high (have ruled this out) in beagle, by setting it very low. See below. This output a lot of IBD segments but again grepping while it was running revealed no B73 pairs.

```
java -jar beagle.r1398.jar gt=vcfSubsetBeagle.vcf.gz ibd=true ibdtrim=10 overlap=50 window=300 nthreads=4 ibdlod=0.1 out=out_subset_GBS_minLOD.gt
```

Beagle appears to be ignoring many of these duplicates of B73. The next solution is to eliminate most of them or at least have the same number as Oh43 and Mo17. I have a suspicion that the B73 LODs are actually insanely high, or completely identical and as such are discarded - but I have emailed Browning to double check if this is a possibility as to how Beagle behaves. I am also just going to eliminate all but 4 B73 samples that have different naming conventions in the list and rerun Beagle again.





