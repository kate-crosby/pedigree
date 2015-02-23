## New notes/approaches:

Several challenges have presented themselves in using the pedigree approach to detect selection through time - I'll list these here, and also discuss present some possibilities for how to approach each challenge.

# Challenge One: the issue of having certain inbreds differentially/non-randomly present in the pedigree in calling regions of IBD

- Beagle is not calling certain regions IBD (B73 problem) - this problem is not a problem with IBS/kinship as carried out in Tassel.
- The solution is to build a reference panel population first with HapMap3 BKN and CML lines. 
- Will need to adjust mapping positions accordingly so that the ref. panel pop and the GBS pop match in terms of position - there is a way of doing this in Beagle
- Test out with initially small subset of individuals.

# Challenge Two: genome wide IBS vs. IBS at a given SNP (binary matrix)
- This may be a viable solution but need to learn NUMPY to produce matrices (working on it)
- Need to think more about stats here and what is being computed.


# Challenge Three: 
- Transmission disequilibrium test - this is more along the lines of what Graham Coop suggested in tracking reproductive success down the pedigree. The challenge would be to map a correlation matrix of phenotypic traits to SNPs - in my head it looks similar to the multivariate breeder's equation, but I haven't thought it through enough yet.

