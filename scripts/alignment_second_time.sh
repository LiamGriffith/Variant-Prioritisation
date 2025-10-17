#!/bin/bash
#SBATCH --job-name=install_bwa_samtools
#SBATCH --output=alignment.log
#SBATCH --error=alignment.err
#SBATCH --time=48:00:00
#SBATCH --cpus-per-task=4
#SBATCH --mem=8G

set -euo pipefail

module purge
module load bear-apps/2023a/live
module load BWA/0.7.17-GCCcore-12.3.0

# Create necessary directories
mkdir -p ../data/aligned ../data/reference

cd ../data/reference

### STEP 1: Download the reference genome
wget -O GRCh38_no_alt.fna.gz ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/000/001/405/GCA_000001405.15_GRCh38/seqs_for_alignment_pipelines.ucsc_ids/GCA_000001405.15_GRCh38_no_alt_analysis_set.fna.gz

### STEP 2: Decompress the genome
gunzip -f GRCh38_no_alt.fna.gz

### STEP 3: Index the genome with BWA
bwa index GRCh38_no_alt.fna

# Move back to the working directory
cd -

# Directory containing input FASTQ files
INPUT_DIR="../data/fastq_final"
OUTPUT_DIR="../data/aligned_second_set"
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