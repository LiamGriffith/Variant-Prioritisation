#!/bin/bash
#SBATCH --job-name=add_rg
#SBATCH --output=../logs/add_rg.out
#SBATCH --error=../logs/add_rg.err
#SBATCH --time=24:00:00
#SBATCH --mem=64G
#SBATCH --cpus-per-task=4

module purge
module load bear-apps/2023a/live
module load picard/3.4.0-Java-17

BAMDIR="/rds/projects/s/sharmaoa-gpcr/Variant-Prioritisation/data/W_Exomes/1_aligned"
OUTDIR="/rds/projects/s/sharmaoa-gpcr/Variant-Prioritisation/data/W_Exomes/2_RGAdded"

mkdir -p $OUTDIR

# Loop over BAM files
for bam in $BAMDIR/*_sorted.bam; do
    sample=$(basename $bam _sorted.bam)
    echo "Processing $sample..."

    java -jar $EBROOTPICARD/picard.jar AddOrReplaceReadGroups \
        I=$bam \
        O=$OUTDIR/${sample}_RG.bam \
        RGID=$sample \
        RGLB=lib1 \
        RGPL=ILLUMINA \
        RGPU=unit1 \
        RGSM=$sample \
        CREATE_INDEX=true \
        VALIDATION_STRINGENCY=SILENT

    echo "$sample done."
done