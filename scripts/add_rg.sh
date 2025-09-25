#!/bin/bash
#SBATCH --job-name=gatk_hc
#SBATCH --output=../logs/gatk_hc_%A_%a.out
#SBATCH --error=../logs/gatk_hc_%A_%a.err
#SBATCH --time=24:00:00
#SBATCH --cpus-per-task=4
#SBATCH --mem=16G
#SBATCH --array=0-120   # adjust based on number of BAMs
module purge
module load bear-apps/2023a/live
module load picard/3.4.0-Java-17

REF=../data/reference/GCA_000001405.15_GRCh38_no_alt_analysis_set.fna
BAMDIR=../data/aligned
OUTDIR=../data/rg_bam
mkdir -p $OUTDIR

# Get list of BAMs
BAMLIST=($(ls $BAMDIR/*_sorted.bam))
BAM=${BAMLIST[$SLURM_ARRAY_TASK_ID]}
SAMPLE=$(basename $BAM .bam)

RG_BAM="$OUTDIR/${SAMPLE}_rg.bam"
# Add read group BAM
java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups \
      I=$BAM \
      O=$RG_BAM \
      RGID=$SAMPLE \
      RGLB=lib1 \
      RGPL=ILLUMINA \
      RGPU=unit1 \
      RGSM=$SAMPLE
