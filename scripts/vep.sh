#!/bin/bash
#SBATCH --job-name=vep_annotate
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=32G
#SBATCH --time=96:00:00
#SBATCH --output=../logs/vep_annotate.%j.out
#SBATCH --error=../logs/vep_annotate.%j.err

# Load modules
module purge
module load bear-apps/2023a/live
module load VEP/113-GCC-12.3.0

# Directories
IN_DIR=../data/vcf/
OUT_DIR=../data/annotated
CACHE_DIR=/rds/projects/s/sharmaoa-gpcr/Liam/vep_cache
CADD_DIR=/rds/projects/s/sharmaoa-gpcr/Liam/CADD

mkdir -p "$OUT_DIR"
mkdir -p "$CACHE_DIR"

FASTA=/rds/projects/s/sharmaoa-gpcr/Liam/data/reference/GCA_000001405.15_GRCh38_no_alt_analysis_set.fna.gz 

# Run VEP 
IN_VCF=$IN_DIR/combined.g.vcf.gz

    vep \
        --dir_cache $CACHE_DIR \
	--cache_version 113 \
        --assembly GRCh38 \
        --fasta $FASTA \
        --vcf \
        --cache \
        --format vcf \
        --everything \
        --regulatory \
        --pick \
	--offline \
        --variant_class \
        --af_1kg \
        --force_overwrite \
        --plugin CADD,$CADD_DIR/InDels.tsv.gz,$CADD_DIR/whole_genome_SNVs.tsv.gz \
        --plugin REVEL,/rds/projects/s/sharmaoa-gpcr/Liam/REVEL/new_tabbed_revel_grch38.tsv.gz \
	-i "$IN_VCF" \
        -o "$OUT_DIR/combined.vep.vcf" \
        --stats_file "$OUT_DIR/vep.stats.html"


