# Exomiser

### Plan: Interpret BAT scores and other data from report of each GAPP patient with WES to create a list of HPO terms, and run Exomiser to identify likely causative variants

### Significance cutoffs:
A patient was considered to have the following phenotypes if their score is >=1


## Installing exomiser:
Exomiser was installed using the following code:
wget https://data.monarchinitiative.org/exomiser/latest/exomiser-cli-14.0.0-distribution.zip
wget https://data.monarchinitiative.org/exomiser/latest/2406_hg38.zip
wget https://data.monarchinitiative.org/exomiser/latest/2406_phenotype.zip

unzip exomiser-cli-14.0.0-distribution.zip
unzip 2406_hg38.zip -d exomiser-cli-14.0.0/data
unzip 2406_phenotype.zip -d exomiser-cli-14.0.0/data`

## Running exomiser:
After everything is downloaded, the application.properties file needs to be updated with paths and versions. After that, make a .yml file where you input all the versions, HPO terms, sample name etc.

Single sample vcfs were made as such:
module purge
module load bear-apps/2024a/live
module load BCFtools/1.21-GCC-13.3.0
bcftools view -s S2450_sorted -Oz -o S2450_only.vcf.gz combined.vep.vcf.gz

The path to this vcf was then inputted into the .yml file

Then run exomiser using exomiser.sh


## Notes for HPO interpretation:
BAT >= 1 indicates that phenotype
P-selectin is a marker of alpha granules
CD63 is a marker of dense granules


#### S2521:
HPO terms: 
HP:0001873 (Thrombocytopenia)
HP:0000790 (Haematuria)
HP:0030140 (Oral cavity bleeding)
HP:0030139 (Venipuncture bleeding)
HP:0000978 (Cutaneous bleeding)
HP:0030399 (Abnormal platelet alpha granule secretion)
HP:0003540 (Impaired platelet aggregation)


#### S2520
HPO terms:
HP:0001892 (Abnormal bleeding)
HP:0040185 (Macrothrombocytopenia)
HP:0001873 (Thrombocytopenia)
HP:0001973 (Autoimmune thrombocytopenia)
HP:0000979 (Purpura)
HP:0030399 (Abnormal platelet alpha granule secretion)
HP:0003540 (Impaired platelet aggregation)

#### S2519
HPO terms:
HP:0001892 (Abnormal bleeding)
HP:0001873 (Thrombocytopenia)
HP:0001973 (Autoimmune thrombocytopenia)
HP:0000979 (Purpura)
HP:0030399 (Abnormal platelet alpha granule secretion)
HP:0003540 (Impaired platelet aggregation)

#### S2518
HPO terms:
HP:0001892 (Abnormal bleeding)
HP:0001873 (Thrombocytopenia)
HP:0001973 (Autoimmune thrombocytopenia)
HP:0000979 (Purpura)
HP:0030399 (Abnormal platelet alpha granule secretion)
HP:0003540 (Impaired platelet aggregation)

#### S2517
HPO terms:
HP:0000421 (Epistaxis)
HP:0000979 (Purpura)
HP:0011889 (Bleeding with minor or no trauma)
HP:0000790 (Hematuria)
HP:0001933 (Subcutaneous hemorrhage)
HP:0002239 (Gastrointestinal hemorrhage)
HP:0004846 (Prolonged bleeding after surgery)

#### S2516
HP:0001892 (Abnormal bleeding)
HP:0008148 (Impaired epinephrine-induced platelet aggregation)
HP:0011872 (Impaired thrombin-induced platelet aggregation)
HP:0030398 (Abnormal platelet ATP dense granule secretion)


#### S2515
HP:0000421 (Epistaxis)
HP:0000979 (Purpura)
HP:0011889 (Bleeding with minor or no trauma)
HP:0000790 (Hematuria)
HP:0001933 (Subcutaneous hemorrhage)
HP:0004846 (Prolonged bleeding after surgery)
HP:0030139 (Excessive bleeding after a venipuncture)
HP:0030140 (Oral cavity bleeding)
HP:0000132 (Menorrhagia)
HP:0004866 (Impaired ADP-induced platelet aggregation)
HP:0008148 (Impaired epinephrine-induced platelet aggregation)
HP:0011870 (Impaired arachidonic acid-induced platelet aggregation)
HP:0008320 (Impaired collagen-induced platelet aggregation)


#### S2514
HP:0001933 (Subcutaneous hemorrhage)
HP:0011889 (Bleeding with minor or no trauma)
HP:0006298 (Prolonged bleeding after dental extraction)
HP:0004846 (Prolonged bleeding after surgery)
HP:0011891 (Post-partum hemorrhage)
HP:0004866 (Impaired ADP-induced platelet aggregation)
HP:0008148 (Impaired epinephrine-induced platelet aggregation)
HP:0011870 (Impaired arachidonic acid-induced platelet aggregation)
HP:0008320 (Impaired collagen-induced platelet aggregation)
HP:0011872 (Impaired thrombin-induced platelet aggregation)
HP:0030398 (Abnormal platelet ATP dense granule secretion)


#### S2484
HP:0000421 (Epistaxis)
HP:0001933 (Subcutaneous hemorrhage)
HP:0030140 (Oral cavity bleeding)
HP:0000132 (Menorrhagia)
HP:0011891 (Post-partum hemorrhage)
HP:0011889 (Bleeding with minor or no trauma)
HP:0030139 (Excessive bleeding after a venipuncture)
HP:0004866 (Impaired ADP-induced platelet aggregation)
HP:0008148 (Impaired epinephrine-induced platelet aggregation)
HP:0008320 (Impaired collagen-induced platelet aggregation)
HP:0030398 (Abnormal platelet ATP dense granule secretion)


#### S2483
HP:0000421 (Epistaxis)
HP:0011889 (Bleeding with minor or no trauma)
HP:0030140 (Oral cavity bleeding)
HP:0006298 (Prolonged bleeding after dental extraction)
HP:0000132 (Menorrhagia)
HP:0011891 (Post-partum hemorrhage)
HP:0004846 (Prolonged bleeding after surgery)
HP:0004866 (Impaired ADP-induced platelet aggregation)
HP:0008148 (Impaired epinephrine-induced platelet aggregation)


#### S2458
HP:0000421 (Epistaxis)
HP:0001933 (Subcutaneous hemorrhage)
HP:0030140 (Oral cavity bleeding)
HP:0000132 (Menorrhagia)
HP:0011891 (Post-partum hemorrhage)
HP:0011889 (Bleeding with minor or no trauma)
HP:0030139 (Excessive bleeding after a venipuncture)
HP:0011872 (Impaired thrombin-induced platelet aggregation)
HP:0004866 (Impaired ADP-induced platelet aggregation)
HP:0008148 (Impaired epinephrine-induced platelet aggregation)
HP:0011870 (Impaired arachidonic acid-induced platelet aggregation)
HP:0008320 (Impaired collagen-induced platelet aggregation)
HP:0030398 (Abnormal platelet ATP dense granule secretion)
HP:0011871 (Impaired ristocetin-induced platelet aggregation)


#### S2457
HP:0011869 (Abnormal platelet function)
HP:0012233 (Intramuscular hematoma)
HP:0000421 (Epistaxis)
HP:0001933 (Subcutaneous hemorrhage)
HP:0002239 (Gastrointestinal hemorrhage)
HP:0006298 (Prolonged bleeding after dental extraction)
HP:0000132 (Menorrhagia)
HP:0011872 (Impaired thrombin-induced platelet aggregation)
HP:0004866 (Impaired ADP-induced platelet aggregation)
HP:0008148 (Impaired epinephrine-induced platelet aggregation)
HP:0011870 (Impaired arachidonic acid-induced platelet aggregation)
HP:0008320 (Impaired collagen-induced platelet aggregation)
HP:0030398 (Abnormal platelet ATP dense granule secretion)


#### S2456
HP:0030398 (Abnormal platelet ATP dense granule secretion)
HP:0000421 (Epistaxis)
HP:0002239 (Gastrointestinal hemorrhage)
HP:0030140 (Oral cavity bleeding)
HP:0011872 (Impaired thrombin-induced platelet aggregation)
HP:0004866 (Impaired ADP-induced platelet aggregation)
HP:0008148 (Impaired epinephrine-induced platelet aggregation)



#### S2455
HP:0000421 (Epistaxis)
HP:0030140 (Oral cavity bleeding)
HP:0000132 (Menorrhagia)
HP:0011891 (Post-partum hemorrhage)
HP:0030139 (Excessive bleeding after a venipuncture)
HP:0008320 (Impaired collagen-induced platelet aggregation)
HP:0011872 (Impaired thrombin-induced platelet aggregation)
HP:0004866 (Impaired ADP-induced platelet aggregation)
HP:0008148 (Impaired epinephrine-induced platelet aggregation)
HP:0030398 (Abnormal platelet ATP dense granule secretion)


#### S2454
HP:0030140 (Oral cavity bleeding) 
HP:0008148 (Impaired epinephrine-induced platelet aggregation)
HP:0004866 (Impaired ADP-induced platelet aggregation)
HP:0011870 (Impaired arachidonic acid-induced platelet aggregation)
HP:0008320 (Impaired collagen-induced platelet aggregation)
HP:0011872 (Impaired thrombin-induced platelet aggregation)
HP:0011871 (Impaired ristocetin-induced platelet aggregation)
HP:0030398 (Abnormal platelet ATP dense granule secretion)


#### S2453
HP:0001933 (Subcutaneous hemorrhage)
HP:0000132 (Menorrhagia)
HP:0000421 (Epistaxis)
HP:0030140 (Oral cavity bleeding) 
HP:0008148 (Impaired epinephrine-induced platelet aggregation)
HP:0004866 (Impaired ADP-induced platelet aggregation)
HP:0011870 (Impaired arachidonic acid-induced platelet aggregation)


#### S2452
HP:0001892 (Abnormal bleeding)
HP:0008148 (Impaired epinephrine-induced platelet aggregation)
HP:0004866 (Impaired ADP-induced platelet aggregation)
HP:0030398 (Abnormal platelet ATP dense granule secretion)
HP:0008320 (Impaired collagen-induced platelet aggregation)


#### S2451
HP:0000421 (Epistaxis)
HP:0030140 (Oral cavity bleeding) 
HP:0000132 (Menorrhagia)
HP:0030139 (Excessive bleeding after a venipuncture)
HP:0008148 (Impaired epinephrine-induced platelet aggregation)
HP:0004866 (Impaired ADP-induced platelet aggregation)


#### S2450
HP:0001873 (Thrombocytopenia)
HP:0001892 (Abnormal bleeding)
HP:0030399 (Abnormal platelet alpha granule secretion)


#### S2449
HP:0006298 (Prolonged bleeding after dental extraction)
HP:0003540 (Impaired platelet aggregation)
HP:0030398 (Abnormal platelet ATP dense granule secretion)
HP:0008148 (Impaired epinephrine-induced platelet aggregation)
HP:0004866 (Impaired ADP-induced platelet aggregation)
HP:0030398 (Abnormal platelet ATP dense granule secretion)


#### S2448
HP:0001873 (Thrombocytopenia)
HP:0000790 (Hematuria)
HP:0004846 (Prolonged bleeding after surgery)
HP:0003540 (Impaired platelet aggregation)
HP:0030398 (Abnormal platelet ATP dense granule secretion)
HP:0008148 (Impaired epinephrine-induced platelet aggregation)
HP:0004866 (Impaired ADP-induced platelet aggregation)
HP:0011870 (Impaired arachidonic acid-induced platelet aggregation)
HP:0011872 (Impaired thrombin-induced platelet aggregation)
HP:0008320 (Impaired collagen-induced platelet aggregation)


#### S2447
HP:0012233 (Intramuscular hematoma)
HP:0000132 (Menorrhagia)
HP:0030139 (Venipuncture bleeding)
HP:0008148 (Impaired epinephrine-induced platelet aggregation)
HP:0004866 (Impaired ADP-induced platelet aggregation)
HP:0011872 (Impaired thrombin-induced platelet aggregation)
HP:0011871 (Impaired ristocetin-induced platelet aggregation)


#### S2446
HP:0003540 (Impaired platelet aggregation)
HP:0030398 (Abnormal platelet ATP dense granule secretion)
HP:0004866 (Impaired ADP-induced platelet aggregation)
HP:0011872 (Impaired thrombin-induced platelet aggregation)
HP:0008148 (Impaired epinephrine-induced platelet aggregation)
HP:0011871 (Impaired ristocetin-induced platelet aggregation)
HP:0011870 (Impaired arachidonic acid-induced platelet aggregation)


#### S2445
HP:0000421 (Epistaxis)
HP:0001933 (Subcutaneous hemorrhage)
HP:0012233 (Intramuscular hematoma)
HP:0011889 (Bleeding with minor or no trauma)
HP:0006298 (Prolonged bleeding after dental extraction)
HP:0004846 (Prolonged bleeding after surgery)
HP:0011891 (Post-partum hemorrhage)
HP:0000132 (Menorrhagia)
HP:0004866 (Impaired ADP-induced platelet aggregation)
HP:0011870 (Impaired arachidonic acid-induced platelet aggregation)
HP:0008148 (Impaired epinephrine-induced platelet aggregation)
HP:0030398 (Abnormal platelet ATP dense granule secretion)



#### S2444
HP:0001873 (Thrombocytopenia)
HP:0030398 (Abnormal platelet ATP dense granule secretion)
HP:0003540 (Impaired platelet aggregation)
HP:0004866 (Impaired ADP-induced platelet aggregation)
HP:0011870 (Impaired arachidonic acid-induced platelet aggregation)


#### S2387
no clear phenotype


#### S2386
HP:0000421 (Epistaxis)
HP:0000978 (Cutaneous bleeding)
HP:0006298 (Prolonged bleeding after dental extraction)
HP:0030139 (Venipuncture bleeding)
HP:0030398 (Abnormal platelet ATP dense granule secretion)
HP:0003540 (Impaired platelet aggregation)


#### S2385
No phenotype


#### S2384
No phenotype


#### S2383
HP:0000421 (Epistaxis)
HP:0001933 (Subcutaneous hemorrhage)
HP:0001892 (Abnormal bleeding)


#### S2378
HP:0000421 (Epistaxis)
HP:0004846 (Prolonged bleeding after surgery)
HP:0000132 (Menorrhagia)
HP:0008148 (Impaired epinephrine-induced platelet aggregation)


#### S2377
HP:0000967 (Petechiae)
HP:0001933 (Subcutaneous hemorrhage)
HP:0002099 (Asthma)
HP:0001892 (Abnormal bleeding)
HP:0000967 (Petechiae)
HP:0001933 (Subcutaneous hemorrhage)
HP:0002099 (Asthma)
HP:0001892 (Abnormal bleeding)

#### S2376
HP:0001933 (Subcutaneous hemorrhage)
HP:0011889 (Bleeding with minor or no trauma)
HP:0001892 (Abnormal bleeding)


#### S2375
HP:0001933 (Subcutaneous hemorrhage)
HP:0011889 (Bleeding with minor or no trauma)
HP:0030399 (Abnormal platelet alpha granule secretion)
HP:0001873 (Thrombocytopenia)


#### S2374
HP:0001873 (Thrombocytopenia)
HP:0012233 (Intramuscular hematoma)
HP:0001933 (Subcutaneous hemorrhage)
HP:0030140 (Oral cavity bleeding)
HP:0000132 (Menorrhagia)
HP:0011891 (Post-partum hemorrhage)
HP:0004866 (Impaired ADP-induced platelet aggregation)
HP:0001975 (Decreased platelet glycoprotein IIb-IIIa)
HP:0011870 (Impaired arachidonic acid-induced platelet aggregation)

#### S2373
HP:0001873 (Thrombocytopenia)
HP:0004866 (Impaired ADP-induced platelet aggregation)
HP:0008320 (Impaired collagen-induced platelet aggregation)
HP:0030398 (Abnormal platelet ATP dense granule secretion)
HP:0030397 (Abnormal platelet dense granule secretion)
HP:0011871 (Impaired ristocetin-induced platelet aggregation)
HP:0011870 (Impaired arachidonic acid-induced platelet aggregation)


#### S2339
HP:0001933 (Subcutaneous hemorrhage)
HP:0000421 (Epistaxis)
HP:0012233 (Intramuscular hematoma)
HP:0011889 (Bleeding with minor or no trauma)


#### S2317
HP:0001933 (Subcutaneous hemorrhage)
HP:0030140 (Oral cavity bleeding)
HP:0000132 (Menorrhagia)
HP:0011891 (Post-partum hemorrhage)
HP:0001892 (Abnormal bleeding)



#### S2316
No- no clear phenotype


#### S2315
HP:0006298 (Prolonged bleeding after dental extraction)
HP:0004846 (Prolonged bleeding after surgery)
HP:0001892 (Abnormal bleeding)

#### S2314
HP:0001892 (Abnormal bleeding)


#### S2313
HP:0001892 (Abnormal bleeding)


#### S2312
HP:0000132 (Menorrhagia)
HP:0001933 (Subcutaneous hemorrhage)
HP:0006298 (Prolonged bleeding after dental extraction)
HP:0004846 (Prolonged bleeding after surgery)
HP:0011870 (Impaired arachidonic acid-induced platelet aggregation)
HP:0004866 (Impaired ADP-induced platelet aggregation)
HP:0008320 (Impaired collagen-induced platelet aggregation)
HP:0008148 (Impaired epinephrine-induced platelet aggregation)

#### S2311
HP:0001933 (Subcutaneous hemorrhage)
HP:0011889 (Bleeding with minor or no trauma)
HP:0008148 (Impaired epinephrine-induced platelet aggregation)

#### S2310
HP:0000421 (Epistaxis)
HP:0001933 (Subcutaneous hemorrhage)
HP:0011889 (Bleeding with minor or no trauma)
HP:0004846 (Prolonged bleeding after surgery)
HP:0008148 (Impaired epinephrine-induced platelet aggregation)

#### S2279
HP:0001873 (Thrombocytopenia)
HP:0011869 (Abnormal platelet function)

#### S2278
HP:0001892 (Abnormal bleeding)
HP:0001873 (Thrombocytopenia)


#### S2277
HP:0001892 (Abnormal bleeding)
HP:0001873 (Thrombocytopenia)


#### S2276
MISSING DATA


#### S2275
MISSING DATA


#### S1862
HP:0001892 (Abnormal bleeding)
HP:0001873 (Thrombocytopenia)


#### S1861
HP:0001873 (Thrombocytopenia)
HP:0000132 (Menorrhagia)
HP:0001892 (Abnormal bleeding)
HP:0030399 (Abnormal platelet alpha granule secretion)
HP:0003540 (Impaired platelet aggregation)

#### S1860
HP:0001873 (Thrombocytopenia)
HP:0001892 (Abnormal bleeding)
HP:0030399 (Abnormal platelet alpha granule secretion)
HP:0003540 (Impaired platelet aggregation)


#### S1859
HP:0001873 (Thrombocytopenia)
HP:0000421 (Epistaxis)
HP:0004846 (Prolonged bleeding after surgery)
HP:0031128 (Impaired collagen-related peptide-induced platelet aggregation)
HP:0030399 (Abnormal platelet alpha granule secretion)


#### S1858
HP:0001873 (Thrombocytopenia)
HP:0001892 (Abnormal bleeding)


#### S1857
HP:0030397 (Abnormal platelet dense granule secretion)
HP:0004866 (Impaired ADP-induced platelet aggregation)
HP:0008320 (Impaired collagen-induced platelet aggregation)
HP:0001873 (Thrombocytopenia)
HP:0003540 (Impaired platelet aggregation)
HP:0030398 (Abnormal platelet ATP dense granule secretion)
HP:0008148 (Impaired epinephrine-induced platelet aggregation)


#### S1856
HP:0030397 (Abnormal platelet dense granule secretion)
HP:0004866 (Impaired ADP-induced platelet aggregation)
HP:0008320 (Impaired collagen-induced platelet aggregation)
HP:0001873 (Thrombocytopenia)
HP:0003540 (Impaired platelet aggregation)
HP:0030398 (Abnormal platelet ATP dense granule secretion)
HP:0008148 (Impaired epinephrine-induced platelet aggregation)


#### S1855
HP:0001973 (Autoimmune thrombocytopenia)
HP:0000421 (Epistaxis)
HP:0011877 (Increased mean platelet volume)
HP:0003540 (Impaired platelet aggregation)
HP:0030397 (Abnormal platelet dense granule secretion)
HP:0004866 (Impaired ADP-induced platelet aggregation)
HP:0008148 (Impaired epinephrine-induced platelet aggregation)
HP:0011872 (Impaired thrombin-induced platelet aggregation)
HP:0008320 (Impaired collagen-induced platelet aggregation)
HP:0030398 (Abnormal platelet ATP dense granule secretion)
HP:0030397 (Abnormal platelet dense granule secretion)


#### S1854
HP:0001873 (Thrombocytopenia)
HP:0001933 (Subcutaneous hemorrhage)
HP:0000421 (Epistaxis)
HP:0006298 (Prolonged bleeding after dental extraction)
HP:0012233 (Intramuscular hematoma)
HP:0030398 (Abnormal platelet ATP dense granule secretion)
HP:0030397 (Abnormal platelet dense granule secretion)


#### S1853
HP:0001933 (Subcutaneous hemorrhage)
HP:0011889 (Bleeding with minor or no trauma)
HP:0000421 (Epistaxis)
HP:0011870 (Impaired arachidonic acid-induced platelet aggregation)
HP:0030398 (Abnormal platelet ATP dense granule secretion)
HP:0030397 (Abnormal platelet dense granule secretion)


#### S1608
HP:0001873 (Thrombocytopenia)
HP:0001902 (Giant platelets)


#### S1260
HP:0001873 (Thrombocytopenia)
HP:0006298 (Prolonged bleeding after dental extraction)
HP:0030139 (Venipuncture bleeding)
HP:0030399 (Abnormal platelet alpha granule secretion)


#### S1259
HP:0001873 (Thrombocytopenia)
HP:0030139 (Venipuncture bleeding)
HP:0001933 (Subcutaneous hemorrhage)
HP:0000790 (Hematuria)
HP:0000093 (Proteinuria)
HP:0000132 (Menorrhagia)


#### S1258
HP:0001873 (Thrombocytopenia)
HP:0000421 (Epistaxis)
HP:0002239 (Gastrointestinal hemorrhage)
HP:0006298 (Prolonged bleeding after dental extraction)
HP:0000132 (Menorrhagia)
HP:0030399 (Abnormal platelet alpha granule secretion)


#### S1257
HP:0001873 (Thrombocytopenia)
HP:0001933 (Subcutaneous hemorrhage)
HP:0011889 (Bleeding with minor or no trauma)
HP:0030139 (Venipuncture bleeding)


#### S1256
HP:0001873 (Thrombocytopenia)
HP:0001933 (Subcutaneous hemorrhage)
HP:0011889 (Bleeding with minor or no trauma)
HP:0030399 (Abnormal platelet alpha granule secretion)


#### S1255
HP:0000421 (Epistaxis)
HP:0001933 (Subcutaneous hemorrhage)
HP:0011889 (Bleeding with minor or no trauma)
HP:0002573 (Hematochezia)
HP:0034518 (Gingival fragility)
HP:0006298 (Prolonged bleeding after dental extraction)
HP:0004846 (Prolonged bleeding after surgery)


#### S1254
HP:0001873 (Thrombocytopenia)
HP:0000421 (Epistaxis)
HP:0001933 (Subcutaneous hemorrhage)
HP:0030139 (Venipuncture bleeding)
HP:0034518 (Gingival fragility)
HP:0011889 (Bleeding with minor or no trauma)
HP:0000790 (Hematuria)
HP:0000132 (Menorrhagia)



#### S1253
HP:0001873 (Thrombocytopenia)
HP:0001933 (Subcutaneous hemorrhage)
HP:0030139 (Venipuncture bleeding)
HP:0000132 (Menorrhagia)



#### S1252
HP:0001873 (Thrombocytopenia)
HP:0000132 (Menorrhagia)
HP:0001933 (Subcutaneous hemorrhage)
HP:0030399 (Abnormal platelet alpha granule secretion)
HP:0030398 (Abnormal platelet ATP dense granule secretion)
HP:0030397 (Abnormal platelet dense granule secretion)
HP:0003540 (Impaired platelet aggregation)

#### S1251
HP:0001873 (Thrombocytopenia)
HP:0000421 (Epistaxis)
HP:0001933 (Subcutaneous hemorrhage)
HP:0004866 (Impaired ADP-induced platelet aggregation)
HP:0008148 (Impaired epinephrine-induced platelet aggregation)


#### S1250
HP:0001873 (Thrombocytopenia)
HP:0000421 (Epistaxis)
HP:0001933 (Subcutaneous hemorrhage)
HP:0012233 (Intramuscular hematoma)
HP:0011889 (Bleeding with minor or no trauma)
HP:0000132 (Menorrhagia)
HP:0004866 (Impaired ADP-induced platelet aggregation)
HP:0011870 (Impaired arachidonic acid-induced platelet aggregation)
HP:0008148 (Impaired epinephrine-induced platelet aggregation)
HP:0011872 (Impaired thrombin-induced platelet aggregation)
HP:0008320 (Impaired collagen-induced platelet aggregation)
HP:0030398 (Abnormal platelet ATP dense granule secretion)
HP:0030397 (Abnormal platelet dense granule secretion)
HP:0001975 (Decreased platelet glycoprotein IIb-IIIa)
HP:0011881 (Decreased platelet glycoprotein VI)
HP:0030399 (Abnormal platelet alpha granule secretion)
HP:0003540 (Impaired platelet aggregation)
HP:0011871 (Impaired ristocetin-induced platelet aggregation)


#### S1249
HP:0001873 (Thrombocytopenia)
HP:0000421 (Epistaxis)
HP:0001933 (Subcutaneous hemorrhage)
HP:0011889 (Bleeding with minor or no trauma)
HP:0000132 (Menorrhagia)
HP:0011891 (Post-partum hemorrhage)
HP:0011877 (Increased mean platelet volume)
HP:0001975 (Decreased platelet glycoprotein IIb-IIIa)
HP:0011881 (Decreased platelet glycoprotein VI)
HP:0030399 (Abnormal platelet alpha granule secretion)
HP:0003540 (Impaired platelet aggregation)


#### S1248
HP:0001873 (Thrombocytopenia)
HP:0001933 (Subcutaneous hemorrhage)
HP:0000132 (Menorrhagia)



#### S1247
HP:0001873 (Thrombocytopenia)
HP:0001933 (Subcutaneous hemorrhage)
HP:0011869 (Abnormal platelet function)
HP:0030399 (Abnormal platelet alpha granule secretion)
HP:0003540 (Impaired platelet aggregation)


#### S1246
HP:0001873 (Thrombocytopenia)
HP:0001933 (Subcutaneous hemorrhage)
HP:0000132 (Menorrhagia)
HP:0011891 (Post-partum hemorrhage)
HP:0011877 (Increased mean platelet volume)
HP:0003540 (Impaired platelet aggregation)
HP:0011870 (Impaired arachidonic acid-induced platelet aggregation)
HP:0004866 (Impaired ADP-induced platelet aggregation)
HP:0003540 (Impaired platelet aggregation)



#### S1245
HP:0001873 (Thrombocytopenia)
HP:0001933 (Subcutaneous hemorrhage)
HP:0000132 (Menorrhagia)
HP:0004866 (Impaired ADP-induced platelet aggregation)
HP:0011870 (Impaired arachidonic acid-induced platelet aggregation)
HP:0008320 (Impaired collagen-induced platelet aggregation)
HP:0008148 (Impaired epinephrine-induced platelet aggregation)


#### S1244
HP:0001933 (Subcutaneous hemorrhage)
HP:0001873 (Thrombocytopenia)
HP:0011881 (Decreased platelet glycoprotein VI)
HP:0030399 (Abnormal platelet alpha granule secretion)
HP:0030398 (Abnormal platelet ATP dense granule secretion)
HP:0030397 (Abnormal platelet dense granule secretion)



#### S1243
HP:0001873 (Thrombocytopenia)
HP:0030399 (Abnormal platelet alpha granule secretion)



#### S1242
HP:0001873 (Thrombocytopenia)
HP:0000421 (Epistaxis)
HP:0004866 (Impaired ADP-induced platelet aggregation)
HP:0011870 (Impaired arachidonic acid-induced platelet aggregation)
HP:0008148 (Impaired epinephrine-induced platelet aggregation)
HP:0011872 (Impaired thrombin-induced platelet aggregation)
HP:0008320 (Impaired collagen-induced platelet aggregation)
HP:0003540 (Impaired platelet aggregation)


#### S1241
HP:0001873 (Thrombocytopenia)
HP:0000132 (Menorrhagia)
HP:0004866 (Impaired ADP-induced platelet aggregation)
HP:0011870 (Impaired arachidonic acid-induced platelet aggregation)
HP:0008148 (Impaired epinephrine-induced platelet aggregation)



#### S1240
HP:0001873 (Thrombocytopenia)
HP:0011870 (Impaired arachidonic acid-induced platelet aggregation)
HP:0008320 (Impaired collagen-induced platelet aggregation)



#### S1239
HP:0001873 (Thrombocytopenia)
HP:0001933 (Subcutaneous hemorrhage)
HP:0011889 (Bleeding with minor or no trauma)
HP:0006298 (Prolonged bleeding after dental extraction)
HP:0004866 (Impaired ADP-induced platelet aggregation)
HP:0008148 (Impaired epinephrine-induced platelet aggregation)
HP:0011872 (Impaired thrombin-induced platelet aggregation)
HP:0008320 (Impaired collagen-induced platelet aggregation)
HP:0011871 (Impaired ristocetin-induced platelet aggregation)
HP:0030398 (Abnormal platelet ATP dense granule secretion)
HP:0030397 (Abnormal platelet dense granule secretion)


#### S1238
HP:0000967 (Petechiae)
HP:0001933 (Subcutaneous hemorrhage)
HP:0011889 (Bleeding with minor or no trauma)
HP:0012233 (Intramuscular hematoma)
HP:0004866 (Impaired ADP-induced platelet aggregation)
HP:0011870 (Impaired arachidonic acid-induced platelet aggregation)
HP:0008148 (Impaired epinephrine-induced platelet aggregation)
HP:0011872 (Impaired thrombin-induced platelet aggregation)
HP:0008320 (Impaired collagen-induced platelet aggregation)
HP:0030398 (Abnormal platelet ATP dense granule secretion)
HP:0030397 (Abnormal platelet dense granule secretion)


#### S1237
HP:0001873 (Thrombocytopenia)
HP:0000967 (Petechiae)
HP:0001933 (Subcutaneous hemorrhage)
HP:0030399 (Abnormal platelet alpha granule secretion)
HP:0030397 (Abnormal platelet dense granule secretion)



#### S1035
HP:0000421 (Epistaxis)
HP:0001933 (Subcutaneous hemorrhage)
HP:0011889 (Bleeding with minor or no trauma)
HP:0004846 (Prolonged bleeding after surgery)
HP:0008148 (Impaired epinephrine-induced platelet aggregation)
HP:0008320 (Impaired collagen-induced platelet aggregation)


#### S1034
HP:0012233 (Intramuscular hematoma)
HP:0001933 (Subcutaneous hemorrhage)
HP:0001873 (Thrombocytopenia)
HP:0004866 (Impaired ADP-induced platelet aggregation)
HP:0011872 (Impaired thrombin-induced platelet aggregation)
HP:0008320 (Impaired collagen-induced platelet aggregation)
HP:0030398 (Abnormal platelet ATP dense granule secretion)
HP:0030397 (Abnormal platelet dense granule secretion)


#### S1033
HP:0000421 (Epistaxis)
HP:0001933 (Subcutaneous hemorrhage)
HP:0004866 (Impaired ADP-induced platelet aggregation)


#### S1032
HP:0006298 (Prolonged bleeding after dental extraction)
HP:0004866 (Impaired ADP-induced platelet aggregation)
HP:0008148 (Impaired epinephrine-induced platelet aggregation)



#### S1031
HP:0011889 (Bleeding with minor or no trauma)
HP:0001933 (Subcutaneous hemorrhage)
HP:0011891 (Post-partum hemorrhage)
HP:0004866 (Impaired ADP-induced platelet aggregation)
HP:0008148 (Impaired epinephrine-induced platelet aggregation)
HP:0011872 (Impaired thrombin-induced platelet aggregation)
HP:0008320 (Impaired collagen-induced platelet aggregation)


#### S1030
HP:0001933 (Subcutaneous hemorrhage)
HP:0004866 (Impaired ADP-induced platelet aggregation)
HP:0008148 (Impaired epinephrine-induced platelet aggregation)
HP:0008320 (Impaired collagen-induced platelet aggregation)
HP:0011872 (Impaired thrombin-induced platelet aggregation)



#### S1029
HP:0004846 (Prolonged bleeding after surgery)
HP:0001933 (Subcutaneous hemorrhage)
HP:0000132 (Menorrhagia)
HP:0006298 (Prolonged bleeding after dental extraction)
HP:0000421 (Epistaxis)
HP:0008148 (Impaired epinephrine-induced platelet aggregation)
HP:0011870 (Impaired arachidonic acid-induced platelet aggregation)



#### S1028 - unclear who's genome this is



#### S1027
HP:0006298 (Prolonged bleeding after dental extraction)
HP:0008148 (Impaired epinephrine-induced platelet aggregation)
HP:0008320 (Impaired collagen-induced platelet aggregation)



#### S1026
HP:0000132 (Menorrhagia)
HP:0011889 (Bleeding with minor or no trauma)
HP:0006298 (Prolonged bleeding after dental extraction)
HP:0011871 (Impaired ristocetin-induced platelet aggregation)
HP:0004866 (Impaired ADP-induced platelet aggregation)
HP:0011870 (Impaired arachidonic acid-induced platelet aggregation)
HP:0008148 (Impaired epinephrine-induced platelet aggregation)
HP:0008320 (Impaired collagen-induced platelet aggregation)
HP:0011872 (Impaired thrombin-induced platelet aggregation)
HP:0030398 (Abnormal platelet ATP dense granule secretion)
HP:0030397 (Abnormal platelet dense granule secretion)



#### S1025
HP:0001933 (Subcutaneous hemorrhage)
HP:0006298 (Prolonged bleeding after dental extraction)
HP:0008320 (Impaired collagen-induced platelet aggregation)
HP:0011872 (Impaired thrombin-induced platelet aggregation)
HP:0011871 (Impaired ristocetin-induced platelet aggregation)
HP:0030398 (Abnormal platelet ATP dense granule secretion)
HP:0030397 (Abnormal platelet dense granule secretion)


#### S1024
HP:0001929 (Reduced factor XI activity)
HP:0000421 (Epistaxis)
HP:0012233 (Intramuscular hematoma)
HP:0001873 (Thrombocytopenia)
HP:0004866 (Impaired ADP-induced platelet aggregation)
HP:0008148 (Impaired epinephrine-induced platelet aggregation)
HP:0011871 (Impaired ristocetin-induced platelet aggregation)
HP:0008320 (Impaired collagen-induced platelet aggregation)
HP:0011872 (Impaired thrombin-induced platelet aggregation)
HP:0030398 (Abnormal platelet ATP dense granule secretion)
HP:0030397 (Abnormal platelet dense granule secretion)



#### S1023
HP:0011889 (Bleeding with minor or no trauma)
HP:0030140 (Oral cavity bleeding)
HP:0004866 (Impaired ADP-induced platelet aggregation)
HP:0008148 (Impaired epinephrine-induced platelet aggregation)
HP:0008320 (Impaired collagen-induced platelet aggregation)



#### S1022
HP:0001933 (Subcutaneous hemorrhage)
HP:0011889 (Bleeding with minor or no trauma)
HP:0002248 (Hematemesis)
HP:0000132 (Menorrhagia)
HP:0030140 (Oral cavity bleeding)
HP:0004866 (Impaired ADP-induced platelet aggregation)
HP:0008148 (Impaired epinephrine-induced platelet aggregation)
HP:0011871 (Impaired ristocetin-induced platelet aggregation)
HP:0008320 (Impaired collagen-induced platelet aggregation)
HP:0030398 (Abnormal platelet ATP dense granule secretion)
HP:0030397 (Abnormal platelet dense granule secretion)
HP:0011877 (Increased mean platelet volume)
HP:0031156 (Decreased platelet glycoprotein Ib)
HP:0001975 (Decreased platelet glycoprotein IIb-IIIa)
HP:0011881 (Decreased platelet glycoprotein VI)


#### S1021
HP:0001933 (Subcutaneous hemorrhage)
HP:0011889 (Bleeding with minor or no trauma)
HP:0030140 (Oral cavity bleeding)
HP:0006298 (Prolonged bleeding after dental extraction)
HP:0000132 (Menorrhagia)
HP:0004866 (Impaired ADP-induced platelet aggregation)
HP:0008148 (Impaired epinephrine-induced platelet aggregation)
HP:0008320 (Impaired collagen-induced platelet aggregation)
HP:0011872 (Impaired thrombin-induced platelet aggregation)
HP:0030398 (Abnormal platelet ATP dense granule secretion)
HP:0030397 Abnormal platelet dense granule secretion



#### S1020
HP:0004866 (Impaired ADP-induced platelet aggregation)
HP:0008148 (Impaired epinephrine-induced platelet aggregation)
HP:0011870 (Impaired arachidonic acid-induced platelet aggregation)
HP:0011871 (Impaired ristocetin-induced platelet aggregation)



#### S1019
HP:0004866 (Impaired ADP-induced platelet aggregation)
HP:0008148 (Impaired epinephrine-induced platelet aggregation)
HP:0011871 (Impaired ristocetin-induced platelet aggregation)
HP:0004846 (Prolonged bleeding after surgery)
HP:0030398 (Abnormal platelet ATP dense granule secretion)
HP:0030397 Abnormal platelet dense granule secretion


#### S1018
HP:0011889 (Bleeding with minor or no trauma)
HP:0000421 (Epistaxis)
HP:0004846 (Prolonged bleeding after surgery)
HP:0011891 (Post-partum hemorrhage)
HP:0008148 (Impaired epinephrine-induced platelet aggregation)


#### S1017
HP:0011889 (Bleeding with minor or no trauma)
HP:0000132 (Menorrhagia)
HP:0006298 (Prolonged bleeding after dental extraction)
HP:0000421 (Epistaxis)
HP:0001892 (Abnormal bleeding)
HP:0004866 (Impaired ADP-induced platelet aggregation)
HP:0011870 (Impaired arachidonic acid-induced platelet aggregation)
HP:0008148 (Impaired epinephrine-induced platelet aggregation)
HP:0011872 (Impaired thrombin-induced platelet aggregation)
HP:0008320 (Impaired collagen-induced platelet aggregation)
HP:0030397 Abnormal platelet dense granule secretion



#### S1016
HP:0011889 (Bleeding with minor or no trauma)
HP:0012233 (Intramuscular hematoma)
HP:0004866 (Impaired ADP-induced platelet aggregation)
HP:0011870 (Impaired arachidonic acid-induced platelet aggregation)
HP:0011872 (Impaired thrombin-induced platelet aggregation)
HP:0011871 (Impaired ristocetin-induced platelet aggregation)


#### S1015
HP:0001933 (Subcutaneous hemorrhage)
HP:0011889 (Bleeding with minor or no trauma)
HP:0030140 (Oral cavity bleeding)
HP:0000132 (Menorrhagia)
HP:0006298 (Prolonged bleeding after dental extraction)
HP:0011891 (Post-partum hemorrhage)
HP:0004866 (Impaired ADP-induced platelet aggregation)
HP:0008148 (Impaired epinephrine-induced platelet aggregation)


#### S1014
HP:0001933 (Subcutaneous hemorrhage)
HP:0004846 (Prolonged bleeding after surgery)
HP:0004866 (Impaired ADP-induced platelet aggregation)
HP:0008148 (Impaired epinephrine-induced platelet aggregation)
HP:0030398 (Abnormal platelet ATP dense granule secretion)
HP:0030397 Abnormal platelet dense granule secretion



#### S1013
HP:0000421 (Epistaxis)
HP:0011889 (Bleeding with minor or no trauma)
HP:0000132 (Menorrhagia)
HP:0004846 (Prolonged bleeding after surgery)
HP:0001892 (Abnormal bleeding)


#### S1012
HP:0011889 (Bleeding with minor or no trauma)
HP:0030140 (Oral cavity bleeding)
HP:0006298 (Prolonged bleeding after dental extraction)
HP:0000132 (Menorrhagia)
HP:0011891 (Post-partum hemorrhage)
HP:0012233 (Intramuscular hematoma)
HP:0004846 (Prolonged bleeding after surgery)
HP:0030398 (Abnormal platelet ATP dense granule secretion)
HP:0030397 Abnormal platelet dense granule secretion



#### S1011
HP:0001933 (Subcutaneous hemorrhage)
HP:0006298 (Prolonged bleeding after dental extraction)
HP:0004846 (Prolonged bleeding after surgery)
HP:0000132 (Menorrhagia)
HP:0011891 (Post-partum hemorrhage)
HP:0004866 (Impaired ADP-induced platelet aggregation)
HP:0011870 (Impaired arachidonic acid-induced platelet aggregation)
HP:0008148 (Impaired epinephrine-induced platelet aggregation)
HP:0011871 (Impaired ristocetin-induced platelet aggregation)
HP:0011872 (Impaired thrombin-induced platelet aggregation)
HP:0008320 (Impaired collagen-induced platelet aggregation)
HP:0030398 (Abnormal platelet ATP dense granule secretion)
HP:0030399 (Abnormal platelet alpha granule secretion)
HP:0011894 (Impaired thromboxane A2 agonist-induced platelet aggregation)


#### S1010
HP:0006298 (Prolonged bleeding after dental extraction)
HP:0000421 (Epistaxis)
HP:0001933 (Subcutaneous hemorrhage)
HP:0004866 (Impaired ADP-induced platelet aggregation)
HP:0008148 (Impaired epinephrine-induced platelet aggregation)
HP:0008320 (Impaired collagen-induced platelet aggregation)
HP:0030398 (Abnormal platelet ATP dense granule secretion)
HP:0030399 (Abnormal platelet alpha granule secretion)


#### S1009
HP:0000132 (Menorrhagia)
HP:0001933 (Subcutaneous hemorrhage)
HP:0011889 (Bleeding with minor or no trauma)
HP:0002239 (Gastrointestinal hemorrhage)
HP:0034518 (Gingival fragility)
HP:0030398 (Abnormal platelet ATP dense granule secretion)
HP:0031156 (Decreased platelet glycoprotein Ib)
HP:0001975 (Decreased platelet glycoprotein IIb-IIIa)


#### S1008
HP:0000421 (Epistaxis)
HP:0001933 (Subcutaneous hemorrhage)
HP:0030140 (Oral cavity bleeding)
HP:0011889 (Bleeding with minor or no trauma)
HP:0006298 (Prolonged bleeding after dental extraction)
HP:0000132 (Menorrhagia)
HP:0001873 (Thrombocytopenia)
HP:0004866 (Impaired ADP-induced platelet aggregation)
HP:0008148 (Impaired epinephrine-induced platelet aggregation)
HP:0011872 (Impaired thrombin-induced platelet aggregation)
HP:0008320 (Impaired collagen-induced platelet aggregation)

#### S0560
HP:0000421 (Epistaxis)
HP:0001933 (Subcutaneous hemorrhage)
HP:0030140 (Oral cavity bleeding)
HP:0004846 (Prolonged bleeding after surgery)
HP:0001873 (Thrombocytopenia)
HP:0030396 (Abnormal platelet granule secretion)
HP:0008320 (Impaired collagen-induced platelet aggregation)
HP:0011872 (Impaired thrombin-induced platelet aggregation)


#### S0561
HP:0001933 (Subcutaneous hemorrhage)
HP:0012233 (Intramuscular hematoma)
HP:0000790 (Hematuria)
HP:0030140 (Oral cavity bleeding)
HP:0004846 (Prolonged bleeding after surgery)
HP:0001873 (Thrombocytopenia)
HP:0004866 (Impaired ADP-induced platelet aggregation)
HP:0008148 (Impaired epinephrine-induced platelet aggregation)
HP:0011872 (Impaired thrombin-induced platelet aggregation)
HP:0030399 (Abnormal platelet alpha granule secretion)
HP:0008320 (Impaired collagen-induced platelet aggregation)
HP:0030396 (Abnormal platelet granule secretion)
HP:0011881 (Decreased platelet glycoprotein VI)


#### S0562
HP:0001933 (Subcutaneous hemorrhage)
HP:0006298 (Prolonged bleeding after dental extraction)
HP:0000132 (Menorrhagia)
HP:0011889 (Bleeding with minor or no trauma)
HP:0012233 (Intramuscular hematoma)
HP:0011891 (Post-partum hemorrhage)
HP:0004866 (Impaired ADP-induced platelet aggregation)
HP:0011870 (Impaired arachidonic acid-induced platelet aggregation)
HP:0008148 (Impaired epinephrine-induced platelet aggregation)
HP:0011872 (Impaired thrombin-induced platelet aggregation)
HP:0008320 (Impaired collagen-induced platelet aggregation)
HP:0030398 (Abnormal platelet ATP dense granule secretion)
HP:0030399 (Abnormal platelet alpha granule secretion)


#### S0563
HP:0001873 (Thrombocytopenia)
HP:0004866 (Impaired ADP-induced platelet aggregation)
HP:0008148 (Impaired epinephrine-induced platelet aggregation)
HP:0011870 (Impaired arachidonic acid-induced platelet aggregation)
HP:0011872 (Impaired thrombin-induced platelet aggregation)
HP:0008320 (Impaired collagen-induced platelet aggregation)
HP:0030399 (Abnormal platelet alpha granule secretion)
HP:0030398 (Abnormal platelet ATP dense granule secretion)

#### S0567
HP:0001873 (Thrombocytopenia)
HP:0001933 (Subcutaneous hemorrhage)
HP:0000421 (Epistaxis)
HP:0002788 (Recurrent upper respiratory tract infections)
HP:0030399 (Abnormal platelet alpha granule secretion)
HP:0004866 (Impaired ADP-induced platelet aggregation)
HP:0008148 (Impaired epinephrine-induced platelet aggregation)
HP:0011870 (Impaired arachidonic acid-induced platelet aggregation)
HP:0011872 (Impaired thrombin-induced platelet aggregation)
HP:0008320 (Impaired collagen-induced platelet aggregation)


#### S0394
HP:0030140 (Oral cavity bleeding)
HP:0001933 (Subcutaneous hemorrhage)
HP:0005268 (Miscarriage)
HP:0003540 (Impaired platelet aggregation)
HP:0004866 (Impaired ADP-induced platelet aggregation)
HP:0008320 (Impaired collagen-induced platelet aggregation)


#### S0209
HP:0030746 (Intraventricular hemorrhage)
HP:0001873 (Thrombocytopenia)
HP:0030399 (Abnormal platelet alpha granule secretion)
HP:0030398 (Abnormal platelet ATP dense granule secretion)


#### S0208
HPO terms: 
HP:0001873 (Thrombocytopenia)
HP:0000421 (Epistaxis)
HP:0012233 (Intramuscular hematoma)
HP:0001933 (Subcutaneous hemorrhage)
HP:0030399 (Abnormal platelet alpha granule secretion)
HP:0011876 (Abnormal platelet volume)
HP:0030398 (Abnormal platelet ATP dense granule secretion)



#### G1013
HP:0001873 (Thrombocytopenia)
HP:0001892 (Abnormal bleeding)
HP:0040185 (Macrothrombocytopenia)
HP:0011870 (Impaired arachidonic acid-induced platelet aggregation)
HP:0011872 (Impaired thrombin-induced platelet aggregation)
HP:0008320 (Impaired collagen-induced platelet aggregation)
HP:0011871 (Impaired ristocetin-induced platelet aggregation)


#### G1018
HP:0001873 (Thrombocytopenia)
HP:0001892 (Abnormal bleeding)



#### G1019
HP:0001873 (Thrombocytopenia)
HP:0000967 (Petechiae)
HP:0000132 (Menorrhagia)
HP:0011889 (Bleeding with minor or no trauma)
HP:0030399 (Abnormal platelet alpha granule secretion)
HP:0003540 (Impaired platelet aggregation)


#### G1020
HP:0030139 Excessive bleeding after a venipuncture 
HP:0011890 Prolonged bleeding following procedure 
HP:0011891 Post-partum hemorrhage 
HP:0006298 Prolonged bleeding after dental extraction 
HP:0030140 Oral cavity bleeding 
HP:0011889 Bleeding with minor or no trauma 
HP:0000421 Epistaxis 
HP:0040185 Macrothrombocytopenia 
HP:0030398 Abnormal platelet ATP dense granule secretion
HP:0030397 Abnormal platelet dense granule secretion
HP:0011870 Impaired arachidonic acid-induced platelet aggregation
HP:0030398 Abnormal platelet ATP dense granule secretion



#### G1021 - no assays
HP:0001873 (Thrombocytopenia)
HP:0001892 (Abnormal bleeding)

#### G1022 - no assays
HP:0001873 (Thrombocytopenia)
HP:0001892 (Abnormal bleeding)

#### G1023
HP:0001873 (Thrombocytopenia)
HP:0001892 (Abnormal bleeding)
HP:0040185 (Macrothrombocytopenia)
HP:0011870 (Impaired arachidonic acid-induced platelet aggregation)
HP:0008320 (Impaired collagen-induced platelet aggregation)
HP:0011872 (Impaired thrombin-induced platelet aggregation)
HP:0011871 (Impaired ristocetin-induced platelet aggregation)

#### G1024
HP:0000421 (Epistaxis)
HP:0011889 (Bleeding with minor or no trauma)
HP:0030140 (Oral cavity bleeding)
HP:0004846 (Prolonged bleeding after surgery)
HP:0004866 (Impaired ADP-induced platelet aggregation)
HP:0008148 (Impaired epinephrine-induced platelet aggregation)
HP:0011870 (Impaired arachidonic acid-induced platelet aggregation)
HP:0008320 (Impaired collagen-induced platelet aggregation)
HP:0011872 (Impaired thrombin-induced platelet aggregation)
HP:0011871 (Impaired ristocetin-induced platelet aggregation)
HP:0030398 (Abnormal platelet ATP dense granule secretion)
HP:0030397 (Abnormal platelet dense granule secretion)
HP:0030399 (Abnormal platelet alpha granule secretion)



#### G2001 - DUPE


#### G2002
HP:0011889 (Bleeding with minor or no trauma)
HP:0030140 (Oral cavity bleeding)
HP:0000132 (Menorrhagia)
HP:0030398 (Abnormal platelet ATP dense granule secretion)
HP:0030397 (Abnormal platelet dense granule secretion)
HP:0030399 (Abnormal platelet alpha granule secretion)


#### G2005 
HP:0001873 (Thrombocytopenia)
HP:0001892 (Abnormal bleeding)



#### G2006 - no bleeding
HP:0001873 (Thrombocytopenia)
HP:0001892 (Abnormal bleeding)

#### G2007
HP:0001873 (Thrombocytopenia)
HP:0000421 (Epistaxis)
HP:0001892 (Abnormal bleeding)


#### G2008
HP:0000421 (Epistaxis)
HP:0001892 (Abnormal bleeding)



#### G2010
HP:0001873 (Thrombocytopenia)
HP:0001892 (Abnormal bleeding)

#### G2011
HP:0001873 (Thrombocytopenia)
HP:0001892 (Abnormal bleeding)




## Mass running exomiser
A csv file was made locally mapping sample names to associated HPO terms. This file had the terms converted to python list format, and was converted to .tsv, by running ../scripts/master_exomiser/convert_csv.sh. 

A template .yaml file (/rds/projects/s/sharmaoa-gpcr/Liam/exomiser/exomiser-cli-14.0.0/examples/template.yaml), was made, and then ../scripts/master_exomiser/master_exomiser.sh was then run. This script generates .yaml files for each sample and then runs exomiser. Following syntax errors in the tsv, the script was then rerun using rerun_input.tsv as input, which contained the reamining samples only


## Preprocessing
Genomic data was preprocessed in accordance to the guidelines established by Cooperstein et al. This includes the following filters:
GQ ≥ 20
0.15 ≤ VAF ≤ 0.85 for heterozygous variants
ALT != *

This was done by running ../../scripts/exomiser_filter.sh

Following this processing, temple.yaml was edited and master_exomiser.sh was rerun

## 
Remade vcfs were created using ../scripts/multi_sample_vcf.sh, following this, exomiser was rerun with the altered template.yaml (shasum a879fa2724aa0ed9ed481574ff1b6a558e570ede)

