#!/bin/bash
#SBATCH --job-name=plink_pca
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=32G
#SBATCH --time=96:00:00
#SBATCH --output=../logs/plink_pca.out
#SBATCH --error=../logs/plink_pca.err

module purge
module load bear-apps/2023a/live
module load PLINK/2.0.0-a.5.17-gfbf-2023a

IN_VCF="/rds/projects/s/sharmaoa-gpcr/Liam/data/annotated/combined.vep.vcf"
OUT_DIR="/rds/projects/s/sharmaoa-gpcr/Liam/data/plink_pca"
mkdir -p ${OUT_DIR}
BASENAME="GAPP"

# Step 1: Convert VCF to PLINK binary format
plink --vcf ${IN_VCF} \
      --make-bed \
      --out ${OUT_DIR}/${BASENAME}

# Step 2: Optional filtering
plink --bfile ${OUT_DIR}/${BASENAME} \
      --geno 0.05 \
      --mind 0.1 \
      --indep-pairwise 50 5 0.2 \
      --make-bed \
      --out ${OUT_DIR}/${BASENAME}_filtered

# Step 3: Perform PCA on filtered dataset
plink --bfile ${OUT_DIR}/${BASENAME}_filtered \
      --pca 40 \
      --out ${OUT_DIR}/${BASENAME}_pca