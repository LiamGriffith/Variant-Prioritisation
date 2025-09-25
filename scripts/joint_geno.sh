#!/bin/bash
#SBATCH --job-name=gatk_joint
#SBATCH --output=../logs/joint.out
#SBATCH --error=../logs/joint.err
#SBATCH --time=96:00:00
module purge
module load bear-apps/2022b/live
module load GATK/4.4.0.0-GCCcore-12.2.0-Java-17

OUTDIR=../data/vcf
REF=../data/reference/GCA_000001405.15_GRCh38_no_alt_analysis_set.fna
mkdir -p $OUTDIR/gvcfs

gatk IndexFeatureFile \
 -I ../data/vcf/combined.g.vcf.gz 

gatk GenotypeGVCFs \
 -R $REF \
 -V $OUTDIR/combined.g.vcf.gz \
 -O $OUTDIR/joint.vcf.gz
