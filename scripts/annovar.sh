#!/bin/bash
#SBATCH --job-name=annovar
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=128G
#SBATCH --time=96:00:00
#SBATCH --output=../../logs/annovar.out
#SBATCH --error=../../logs/annovar.err

# Load modules
module purge
module load bear-apps/2024a/live
module load Perl/5.38.2-GCCcore-13.3.0
# Directories
PERL=/rds/bear-apps/2024a/EL8-ice/software/Perl/5.38.2-GCCcore-13.3.0/bin/perl
TABLE_ANNOVAR=/rds/projects/s/sharmaoa-gpcr/Liam/annovar/annovar/table_annovar.pl
INPUT=/rds/projects/s/sharmaoa-gpcr/Liam/annovar/annovar/S0208.avinput
HUMANDB=/rds/projects/s/sharmaoa-gpcr/Liam/annovar/annovar/humandb
OUTPUT=/rds/projects/s/sharmaoa-gpcr/Liam/annovar/annovar/S0208_annotated

$PERL $TABLE_ANNOVAR $INPUT $HUMANDB \
    -buildver hg38 \
    -out $OUTPUT \
    -remove \
    -protocol refGene,gnomad211_exome,gnomad30_genome,1000g2015aug_all,exac03 \
    -operation g,f,f,f,f \
    -nastring .