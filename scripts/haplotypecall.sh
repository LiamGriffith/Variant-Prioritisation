#!/bin/bash
#SBATCH --job-name=gatk_hc
#SBATCH --output=../logs/gatk_hc_%A_%a.out
#SBATCH --error=../logs/gatk_hc_%A_%a.err
#SBATCH --time=24:00:00
#SBATCH --cpus-per-task=4
#SBATCH --mem=16G
#SBATCH --array=0-120    # adjust to the number of BAMs minus 1

module purge
module load bear-apps/2022b/live
module load GATK/4.4.0.0-GCCcore-12.2.0-Java-17
module load SAMtools/1.17-GCC-12.2.0

REF=../data/reference/GCA_000001405.15_GRCh38_no_alt_analysis_set.fna
BAMDIR=../data/rg_bam
OUTDIR=../data/vcf/gvcfs

mkdir -p $OUTDIR

# Get list of BAMs into an array
BAMLIST=($BAMDIR/*.bam)

# Pick BAM for this array task
BAM=${BAMLIST[$SLURM_ARRAY_TASK_ID]}
SAMPLE=$(basename $BAM .bam)

# Run HaplotypeCaller
gatk HaplotypeCaller \
    -R $REF \
    -I "$BAM" \
    -O "$OUTDIR/${SAMPLE}.g.vcf.gz" \
    -ERC GVCF
    --verbosity DEBUG
