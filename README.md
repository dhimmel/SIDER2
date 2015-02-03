# SIDER 2

This repository contains an analysis of the [SIDER 2](http://sideeffects.embl.de/) (**sid**e **e**ffect **r**esource) [data](http://sideeffects.embl.de/download/). This resource automatically extracted concepts from drug labels to create a database of drug side effects and indications.

This analysis provides the source for a [companion website](http://git.dhimmel.com/SIDER2/), which displays the analysis.

This project is divided into three parts and each part contains a single notebook:

1. `./parse` -- processing the SIDER 2 data in *R*
2. `./similarity` -- calculating compound-compound similarities in *R*
3. `./compounds` -- querying pubchem for compound attributes in *python*

The SIDER database was described in:

> Kuhn M, Campillos M, Letunic I, Jensen LJ, Bork P (2010) A side effect resource to capture phenotypic effects of drugs. *Molecular Systems Biology*. doi:[10.1038/msb.2009.98](http://dx.doi.org/10.1038/msb.2009.98)

To compute compound-compound similarity, we use an analysis similar to:

> Campillos M, Kuhn M, Gavin AC, Jensen LJ, Bork P (2008). Drug Target Identification Using Side-Effect Similarity. *Science* doi:[10.1126/science.1158140](http://dx.doi.org/10.1126/science.1158140)

