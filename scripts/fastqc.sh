#!/bin/bash
#SBATCH --job-name=fastqc_all
#SBATCH --cpus-per-task=2
#SBATCH --mem=4G
#SBATCH --time=24:00:00
#SBATCH --output=../logs/fastqc_%j.out
#SBATCH --error=../logs/fastqc_%j.err

# Required modules
module purge
module load bear-apps/2023a/live
module load FastQC/0.11.9-Java-11

# Input and output directories
INPUT_DIR="/rds/projects/s/sharmaoa-gpcr/Liam/data/fastq"
OUTPUT_DIR="/rds/projects/s/sharmaoa-gpcr/Liam/data/qc"

# Create output directory if it doesn't exist
mkdir -p "$OUTPUT_DIR"

# Run FastQC on all fastq.gz files in INPUT_DIR
~/tools/FastQC/fastqc -t 2 -o "$OUTPUT_DIR" "$INPUT_DIR"/*.fastq.gz
                                                          
echo "FastQC analysis complete."
