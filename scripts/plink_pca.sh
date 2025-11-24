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

IN_DIR="/rds/projects/s/sharmaoa-gpcr/Liam/data/plink_files"

plink2 --bfile $IN_DIR/plink --pca 40 --out /rds/projects/s/sharmaoa-gpcr/Liam/data/plink_pca