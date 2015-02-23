# New notes/approaches:

Several challenges have presented themselves in using the pedigree approach to detect selection through time - I'll list these here, and also discuss present some possibilities for how to approach each challenge.

## Challenge One: the issue of having certain inbreds differentially/non-randomly present in the pedigree in calling regions of IBD

- Beagle is not calling certain regions IBD (B73 problem) - this problem is not a problem with IBS/kinship as carried out in Tassel.
- The solution is to build a reference panel population first with HapMap3 BKN and CML lines. 
- Will need to adjust mapping positions accordingly so that the ref. panel pop and the GBS pop match in terms of position - there is a way of doing this in Beagle
- Test out with initially small subset of individuals.

## Challenge Two: genome wide IBS vs. IBS at a given SNP (binary matrix)
- This may be a viable solution but need to learn NUMPY or pandas to produce matrices (working on it) that won't take up as much space.
- Need to think more about stats here and what is being computed here too.


## Challenge Three: Transmission disequilibrium test - this is what Justin called it
- This is more along the lines of what Graham Coop suggested in tracking reproductive success down the pedigree. In my view, the challenge would be to map a matrix of traits that are genotypically correlated to each other to particular SNPs or IBD haplotype segments - in my head it looks similar to the multivariate breeder's equation, but I haven't thought it through enough yet. 

$$\Delta z  = G\beta$$

Where $\Delta z$ is the change in any trait, including the change in the trait of fitness $\omega$ from one generation to the next.

$$\Delta\omega = G\beta$$

Since we can estimate $\Delta\omega$ down the pedigree from one generation to the next, and we can combine different traits together in a G matrix (a genotypic correlation matrix between any two traits and we can do this for many traits), we can estimate the selection gradient $\beta$ on any given set of traits. True, this does not get at polygenic selection. It gets at something different.

$$\Delta\omega * G^T = \beta$$

Although one interesting prediction to test here is that the directional selection gradient ought to get shallower through time - as $N_e$ drops (due to alleles being chucked), and the genetic variance getting narrower through time, if selection is not relaxed. 

