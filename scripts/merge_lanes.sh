#!/bin/bash
#SBATCH --job-name=merge_fastq
#SBATCH --output=../logs/merge_fastq_%j.out
#SBATCH --error=../logs/merge_fastq_%j.err
#SBATCH --time=12:00:00
#SBATCH --cpus-per-task=2
#SBATCH --mem=8G

set -euo pipefail

# Load modules
module purge
module load bear-apps/2024a/live

# Input/output directories
INDIR="/rds/projects/s/sharmaoa-gpcr/Liam/data/raw"
OUTDIR="/rds/projects/s/sharmaoa-gpcr/Liam/data/merged_fastq2"
mkdir -p "$OUTDIR"

# Loop through unique sample IDs
for sample in $(ls ${INDIR}/*.fastq.gz | xargs -n1 basename | cut -d'_' -f1 | sort -u); do
    echo "Merging lanes for sample: $sample"

    # Merge all R1s properly
    zcat ${INDIR}/${sample}_L*_R1.fastq.gz | gzip > ${OUTDIR}/${sample}_R1.fastq.gz

    # Merge all R2s properly
    zcat ${INDIR}/${sample}_L*_R2.fastq.gz | gzip > ${OUTDIR}/${sample}_R2.fastq.gz

    echo "Done: ${sample}_R1.fastq.gz and ${sample}_R2.fastq.gz"
done

echo "All merges complete!"
