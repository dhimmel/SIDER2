FORMAT DESCRIPTION
==================

label_mapping.tsv.gz
--------------------

1 & 2: generic and brand names

3: a marker if the drug could be successfully mapped to STITCH. Possible values:
 - [empty field]: success
 - combination: two or more drugs were combined
 - not found: could not find the name in the database
 - mapping conflict: the available names point to two different compounds
 - template: a package insert that contains information for a group of related drugs

4 & 5: STITCH compound ids, based on PubChem. Salt forms and stereo-isomers have been merged.
   Column 4: "flat compound", i.e. stereo-isomers have been merged into one compound
	 Column 5: stereo-specific compound id
	
	 To get the PubChem Compound Ids: take absolute value, for flat compounds ids: subtract 100000000
	 E.g. aspirin: -100002244 --> 2244

6: URL of the downloaded PDF. This column is empty for FDA SPL labels, which are available in XML.
	 Unfortunately, many links have become stale since the labels were downloaded in 2009. 

7: label identifier



meddra_adverse_effects.tsv.gz
-----------------------------

1 & 2: STITCH compound ids (flat/stereo, see above)
3: UMLS concept id as it was found on the label
4: drug name
5: side effect name
6: MedDRA concept type (LLT = lowest level term, PT = preferred term)
7: UMLS concept id for MedDRA term
8: MedDRA side effect	name

All side effects found on the labels are given as LLT. Additionally, the PT is shown. There is at least one
PT for every side effect, but sometimes the PT is the same as the LLT. 


adverse_effects_raw.tsv.gz and indications_raw.tsv.gz
-----------------------------------------------------

Medical concepts are extracted both from the adverse effects and the indications sections of the drug labels.
Terms that contain in the indication section are then removed from the adverse effect section. For example,
the indications for an anti-depressant might contain "depression", but also the adverse effect section (e.g.
"in clinical trials to treat depression ..."). 

Format: label identifier, concept id, name of side effect (as found on the label)


meddra_freq_parsed.tsv.gz
-------------------------

This file contains the frequencies of side effects as extracted from the labels. Format:

1 & 2: STITCH compound ids (flat/stereo, see above)
3: the source label, if you don't use STITCH compound ids, you can use the label mapping file to 
   find out more about the label
4: UMLS concept id
5: concept name
6: "placebo" if the info comes from placebo administration, "" otherwise
7: a description of the frequency: either "postmarketing", "rare", "infrequent", "frequent", or an exact
   percentage
8: a lower bound on the frequency
9: an upper bound on the frequency
10-12: MedDRA information as for meddra_adverse_effects.tsv.gz

The bounds are ranges like 0.01 to 1 for "frequent". If the exact frequency is known, then the lower bound 
matches the upper bound. Due to the nature of the data, there can be more than one frequency for the same label,
e.g. from different clinical trials or for different levels of severeness.

