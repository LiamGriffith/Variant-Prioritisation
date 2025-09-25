#!/bin/bash
#SBATCH --job-name=index_gvcf
#SBATCH --output=../logs/index_gvcf_%A_%a.out
#SBATCH --error=../logs/index_gvcf_%A_%a.err
#SBATCH --time=12:00:00
#SBATCH --cpus-per-task=2
#SBATCH --mem=4G
#SBATCH --array=0-120   # adjust to number of GVCFs minus 1

module purge
module load bear-apps/2022b/live
module load GATK/4.4.0.0-GCCcore-12.2.0-Java-17

GVCFDIR=../data/vcf/gvcfs
GVCFLIST=($(ls $GVCFDIR/*.g.vcf.gz))
GVCF=${GVCFLIST[$SLURM_ARRAY_TASK_ID]}

# Index the GVCF
gatk IndexFeatureFile -I $GVCF
