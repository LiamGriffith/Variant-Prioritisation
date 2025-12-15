#!/bin/bash
#SBATCH --job-name=wgs_genomicsdb
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=128G
#SBATCH --time=96:00:00
#SBATCH --output=../logs/genomicsdbg2.log
#SBATCH --error=../logs/genomicsdbg2.err

BB_WORKDIR=$(mktemp -d /scratch/${USER}_${SLURM_JOBID}.XXXXXX)
export TMPDIR=${BB_WORKDIR}

module purge
module load bear-apps/2022b/live
module load GATK/4.4.0.0-GCCcore-12.2.0-Java-17

BED="/rds/projects/s/sharmaoa-gpcr/Variant-Prioritisation/data/G_Exomes/Bed/final.bed"
GVCF="/rds/projects/s/sharmaoa-gpcr/Variant-Prioritisation/data/G_Exomes/5_HaploTypeCalled"

gatk --java-options "-Xmx60g -Xms60g" \
    GenomicsDBImport \
    --genomicsdb-workspace-path ${TMPDIR}/gvcf_db \
    --batch-size 50 \
    -L $BED \
    --merge-input-intervals \
    --reader-threads 8 \
    --variant $GVCF/G1013.g.vcf.gz \
    --variant $GVCF/G1018.g.vcf.gz \
    --variant $GVCF/G1019.g.vcf.gz \
    --variant $GVCF/G1021.g.vcf.gz \
    --variant $GVCF/G1022.g.vcf.gz \
    --variant $GVCF/G1023.g.vcf.gz \
    --variant $GVCF/G1024.g.vcf.gz \
    --variant $GVCF/G2001.g.vcf.gz \
    --variant $GVCF/G2002.g.vcf.gz \
    --variant $GVCF/G2005.g.vcf.gz \
    --variant $GVCF/G2006.g.vcf.gz \
    --variant $GVCF/G2007.g.vcf.gz \
    --variant $GVCF/G2008.g.vcf.gz \
    --variant $GVCF/G2010.g.vcf.gz \
    --variant $GVCF/G2011.g.vcf.gz

# Check if successful
if [ $? -eq 0 ]; then
    echo "GenomicsDB import completed successfully"
    
    # Copy workspace to permanent location
    OUTDIR="/rds/projects/s/sharmaoa-gpcr/Variant-Prioritisation/data/G_Exomes/6_GDBImport"
    mkdir -p "$OUTDIR"
    rsync -av ${TMPDIR}/gvcf_db/ "$OUTDIR/gvcf_db/"
    
    echo "Workspace copied to $OUTDIR/gvcf_db/"xa
    rm -rf ${BB_WORKDIR}
else
    echo "GenomicsDB import failed"
    exit 1
fi