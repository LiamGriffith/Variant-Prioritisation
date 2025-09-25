#!/bin/bash
#SBATCH --job-name=flagstat_batch
#SBATCH --output=../logs/%x_%j.out
#SBATCH --error=../logs/%x_%j.err
#SBATCH --time=02:00:00            # Adjust time as needed
#SBATCH --cpus-per-task=2          # Adjust CPUs if parallelizing later
#SBATCH --mem=4G                   # Adjust memory if needed
# Directory with your BAM files
BAM_DIR="../data/aligned/"
OUTPUT_DIR="../analysis/flagstat_results"
SUMMARY_FILE="../analysis/flagstat_results/flagstat_summary.csv"

mkdir -p "$OUTPUT_DIR"

echo "sample,total_reads,mapped_reads,duplicates" > "$SUMMARY_FILE"

for bam in "$BAM_DIR"/*.bam; do
    sample=$(basename "$bam" .bam)
    echo "Processing $sample"

    # Run flagstat and save output
    samtools flagstat "$bam" > "$OUTPUT_DIR/${sample}_flagstat.txt"

    # Extract key metrics from flagstat output
    total_reads=$(grep "in total" "$OUTPUT_DIR/${sample}_flagstat.txt" | awk '{print $1}')
    mapped_reads=$(grep "mapped (" "$OUTPUT_DIR/${sample}_flagstat.txt" | awk '{print $1}')
    duplicates=$(grep "duplicates" "$OUTPUT_DIR/${sample}_flagstat.txt" | awk '{print $1}')

    # Append metrics to summary CSV
    echo "$sample,$total_reads,$mapped_reads,$duplicates" >> "$SUMMARY_FILE"
done

echo "Summary stats written to $SUMMARY_FILE"
