#!/bin/bash
#SBATCH --job-name=merge_fastq
#SBATCH --output=../logs/merge_fastq.out
#SBATCH --error=../logs/merge_fastq.err
#SBATCH --time=12:00:00
#SBATCH --cpus-per-task=2
#SBATCH --mem=8G

set -euo pipefail

module purge
module load bear-apps/2024a/live

INDIR="/rds/projects/s/sharmaoa-gpcr/Variant-Prioritisation/data/W_Exomes/0.0_raw"
OUTDIR="/rds/projects/s/sharmaoa-gpcr/Variant-Prioritisation/data/W_Exomes/0.2_merged"
mkdir -p "$OUTDIR"

# Extract unique sample prefixes (everything before _S<number>)
samples=$(ls ${INDIR}/*.fastq.gz | xargs -n1 basename | sed -E 's/(_S[0-9]+).*$/\1/' | sed 's/_S[0-9]\+//g' | sort -u)

for sample in $samples; do
    echo "Merging lanes for sample: $sample"

    # Merge all R1 files
    R1_files=($(ls "$INDIR"/${sample}_*R1*.fastq.gz 2>/dev/null))
    if [ ${#R1_files[@]} -eq 0 ]; then
        echo "Warning: No R1 files found for $sample"
    else
        zcat "${R1_files[@]}" | gzip > "${OUTDIR}/${sample}_R1.fastq.gz"
    fi

    # Merge all R2 files
    R2_files=($(ls "$INDIR"/${sample}_*R2*.fastq.gz 2>/dev/null))
    if [ ${#R2_files[@]} -eq 0 ]; then
        echo "Warning: No R2 files found for $sample"
    else
        zcat "${R2_files[@]}" | gzip > "${OUTDIR}/${sample}_R2.fastq.gz"
    fi

    echo "Done: ${sample}_R1.fastq.gz and ${sample}_R2.fastq.gz"
done

echo "All merges complete!"