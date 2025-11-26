#!/bin/bash
#SBATCH --job-name=exomiser_batch
#SBATCH --output=logs/exomiser_batch.out
#SBATCH --error=logs/exomiser_batch.err
#SBATCH --time=24:00:00
#SBATCH --cpus-per-task=4
#SBATCH --mem=144G

module purge
module load bear-apps/2024a/live
module load Java/17.0.15

set -euo pipefail

TSV="/rds/projects/s/sharmaoa-gpcr/Variant-Prioritisation/scripts/master_exomiser/exomiser_input_clean.tsv"
YAML_TEMPLATE="/rds/projects/s/sharmaoa-gpcr/Variant-Prioritisation/scripts/master_exomiser/template.yaml"
OUTDIR="/rds/projects/s/sharmaoa-gpcr/Variant-Prioritisation/exomiser/results"


mkdir -p "$OUTDIR"
mkdir -p logs

while IFS=$'\t' read -r SAMPLE HPO_RAW; do
    echo "Processing sample: $SAMPLE"

    # keep raw python list EXACTLY as provided
    HPO_STRING="$HPO_RAW"

    YAML_OUT="${OUTDIR}/${SAMPLE}.yaml"

    sed \
        -e "s|__SAMPLE__|$SAMPLE|g" \
        -e "s|__HPO_TERMS__|$HPO_STRING|g" \
        "$YAML_TEMPLATE" > "$YAML_OUT"

    echo "Generated $YAML_OUT"

    java -Xmx64G -jar /rds/projects/s/sharmaoa-gpcr/Variant-Prioritisation/exomiser/exomiser-cli-14.0.0/exomiser-cli-14.0.0.jar \
     --analysis $YAML_OUT

    echo "Finished $SAMPLE"
    echo "-----------------------------"

done < "$TSV"