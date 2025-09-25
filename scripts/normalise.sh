#!/bin/bash
#SBATCH --job-name=vcf_normalize
#SBATCH --output=../logs/vcf_normalize_%j.out
#SBATCH --error=../logs/vcf_normalize_%j.err
#SBATCH --time=24:00:00
#SBATCH --cpus-per-task=4
#SBATCH --mem=32G

module purge
module load bear-apps/2024a/live
module load BCFtools/1.21-GCC-13.3.0
VCF_DIR="../data/vcfs_called"
OUT_DIR="../data/vcfs_normalised"

mkdir -p $OUT_DIR

for vcf in $VCF_DIR/*.vcf.gz; do
    base=$(basename $vcf .vcf.gz)
    bcftools norm -m-any -Oz -o $OUT_DIR/${base}.norm.vcf.gz $vcf
    tabix -p vcf $OUT_DIR/${base}.norm.vcf.gz
done
