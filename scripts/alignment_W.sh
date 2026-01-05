#!/bin/bash
#SBATCH --job-name=install_bwa_samtools
#SBATCH --output=install_tools_%j.log
#SBATCH --error=install_tools_%j.err
#SBATCH --time=48:00:00
#SBATCH --cpus-per-task=4
#SBATCH --mem=8G

module purge 
module load bear-apps/2023a/live
module load BWA/0.7.17-GCCcore-12.3.0

# Directory containing input FASTQ files
INPUT_DIR="/rds/projects/s/sharmaoa-gpcr/Variant-Prioritisation/data/W_Exomes/0.2_merged"
OUTPUT_DIR="/rds/projects/s/sharmaoa-gpcr/Variant-Prioritisation/data/W_Exomes/1_aligned"
REFERENCE="../data/reference/GRCh38_no_alt.fna"

# Loop through R1 files and align paired-end reads
for fq in "$INPUT_DIR"/*_R1.fastq.gz; do
    SAMPLE=$(basename "$fq" | sed -E 's/_R1\.fastq\.gz//')
    
    R1="${INPUT_DIR}/${SAMPLE}_R1.fastq.gz"
    R2="${INPUT_DIR}/${SAMPLE}_R2.fastq.gz"
    SAM="${OUTPUT_DIR}/${SAMPLE}.sam"
    BAM="${OUTPUT_DIR}/${SAMPLE}.bam"
    SORTED_BAM="${OUTPUT_DIR}/${SAMPLE}_sorted.bam"
    
    # Align with BWA
    bwa mem "$REFERENCE" "$R1" "$R2" > "$SAM"

    # Convert SAM to BAM, sort and index
    samtools view -bS "$SAM" | samtools sort -o "$SORTED_BAM"
    samtools index "$SORTED_BAM"

    rm "$SAM"

done

