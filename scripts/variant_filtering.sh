#!/bin/bash
#SBATCH --job-name=vep_annotate
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=32G
#SBATCH --time=96:00:00
#SBATCH --output=../logs/vfilter.out
#SBATCH --error=../logs/vfilter.err

module purge
module load bear-apps/2023a/live
module load VEP/113-GCC-12.3.0

INPUT_VCF="/rds/projects/s/sharmaoa-gpcr/Liam/data/annotated/combined.vep.vcf"
OUTPUT_VCF="/rds/projects/s/sharmaoa-gpcr/Liam/data/filtered/filtered.vep.vcf"

filter_vep \
    --input_file ${INPUT_VCF} \
    --output_file ${OUTPUT_VCF} \
    --filter "Consequence is stop_gained OR Consequence is stop_lost OR Consequence is frameshift_variant OR Consequence is splice_acceptor_variant OR Consequence is splice_donor_variant OR Consequence is missense_variant" \
    --force_overwrite





