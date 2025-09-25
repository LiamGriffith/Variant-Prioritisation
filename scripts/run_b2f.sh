#!/bin/bash
#SBATCH --job-name=bam2fq
#SBATCH --array=1-16
#SBATCH --cpus-per-task=2
#SBATCH --mem=4G
#SBATCH --time=24:00:00
#SBATCH --output=../logs/bam2fq_%A_%a.out
#SBATCH --error=../logs/bam2fq_%A_%a.err
module purge
module load bluebear
module load samtools

# Get BAM path for this task
BAM_FILE=$(sed -n "${SLURM_ARRAY_TASK_ID}p" bam_list.txt)

mkdir -p ../data/fastq

./bam_to_fastq.sh "$BAM_FILE"
