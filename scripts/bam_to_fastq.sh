#!/bin/bash
set -euo pipefail

module purge
module load bear-apps/2024a/live
module load SAMtools/1.21-GCC-13.3.0

SCRIPT_DIR="$(dirname "$0")"
BAM_LIST="${SCRIPT_DIR}/bam_list.txt"
OUTDIR="${SCRIPT_DIR}/../data/old_bams"

mkdir -p "$OUTDIR"

# Loop over each BAM in bam_list.txt
while IFS= read -r BAM_FILE || [ -n "$BAM_FILE" ]; do
    BASENAME=$(basename "$BAM_FILE" .bam)
    echo "Converting $BAM_FILE to FASTQ..."
    samtools fastq -1 "${OUTDIR}/${BASENAME}_R1.fastq.gz" \
                   -2 "${OUTDIR}/${BASENAME}_R2.fastq.gz" \
                   -0 /dev/null -s /dev/null -n "$BAM_FILE"
    echo "Done: ${BASENAME}_R1.fastq.gz and ${BASENAME}_R2.fastq.gz"
done < "$BAM_LIST"
