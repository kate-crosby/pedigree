This readme.txt file applies to genotypic data from the following publication, which
should be cited as the source of the data:

Romay MC, Millard M, Glaubitz JC, Peiffer JA, Swarts KL, Casstevens TM, Elshire RJ,
Acharya CB, Mitchell SE, Flint-Garcia S, McMullen MD, Holland JB, Buckler ES, Gardner C.
2013. Comprehensive genotyping of the USA national maize inbred seed bank. Genome Biology
(in press).

There are no restrictions on the usage of these published genotypic data (other than
citing the above paper).

The (raw and imputed) genotypes are contained within the following zip archives:
AmesUSInbreds_AllZeaGBSv1.0_raw-130508.zip
AmesUSInbreds_AllZeaGBSv1.0_imputed-130508.zip

The files in each zip archive are:

AmesUSInbreds_AllZeaGBSv1.0_raw-130508.zip
------------------------------------------
AmesUSInbreds_AllZeaGBSv1.0_BPEC_20130508.hmp.txt.gz (raw genotypes for all 10 chrs)
AmesUSInbreds_AllZeaGBSv1.0_SampleNameKey.xlsx (more information on each sample)
readme.txt (this file)


AmesUSInbreds_AllZeaGBSv1.0_imputed-130508.zip
----------------------------------------------
AmesUSInbreds_AllZeaGBSv1.0_imputed_20130508_chr1.hmp.txt.gz
AmesUSInbreds_AllZeaGBSv1.0_imputed_20130508_chr2.hmp.txt.gz
AmesUSInbreds_AllZeaGBSv1.0_imputed_20130508_chr3.hmp.txt.gz
AmesUSInbreds_AllZeaGBSv1.0_imputed_20130508_chr4.hmp.txt.gz
AmesUSInbreds_AllZeaGBSv1.0_imputed_20130508_chr5.hmp.txt.gz
AmesUSInbreds_AllZeaGBSv1.0_imputed_20130508_chr6.hmp.txt.gz
AmesUSInbreds_AllZeaGBSv1.0_imputed_20130508_chr7.hmp.txt.gz
AmesUSInbreds_AllZeaGBSv1.0_imputed_20130508_chr8.hmp.txt.gz
AmesUSInbreds_AllZeaGBSv1.0_imputed_20130508_chr9.hmp.txt.gz
AmesUSInbreds_AllZeaGBSv1.0_imputed_20130508_chr10.hmp.txt.gz
AmesUSInbreds_AllZeaGBSv1.0_SampleNameKey.xlsx (more information on each sample)
readme.txt (this file)


The GBS genotype files in HapMap format (*.hmp.txt.gz) can be opened directly in TASSEL in
their compressed (*.gz) state. To save space, we use single letters to encode unphased,
diploid genotypes, where:
A = A/A
C = C/C
G = G/G
T = T/T
K = G/T
M = A/C
R = A/G
S = C/G
W = A/T
Y = C/T
N = missing

The raw genotypes are the output of the BiparentalErrorCorrectionPlugin (BPEC) step of the
Tassel3 GBS pipeline. AllZeaGBSv1.0 was formerly known as the "January 2012 build" or the
"20120110 build".

The phenotypes used in the paper (for different subsets of the imputed GBS samples
depending on the trait) are also available from the following link and, like the
genotypes, have no restrictions on their use, other than citing the paper:
www.panzea.org/db/gateway?file_id=Romay_etal_2013_pheno_data

If you have any questions regarding these genotypic or phenotypic data contact:
Cinta Romay <mcr72@cornell.edu>, or
Jeff Glaubitz <jcg233@cornell.edu>
