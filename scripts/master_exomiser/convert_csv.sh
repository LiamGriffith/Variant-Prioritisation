#!/bin/bash
# convert_csv_to_python_list_fixed.sh

INPUT_CSV="$1"
OUTPUT_TSV="$2"

mkdir -p "$(dirname "$OUTPUT_TSV")"

while IFS= read -r line; do
    [[ -z "$line" ]] && continue  # skip empty lines

    # Get sample and HPO part
    SAMPLE="$(echo "$line" | cut -d',' -f1 | tr -d '"')"
    HPO_RAW="$(echo "$line" | cut -d',' -f2-)"

    # Remove quotes and trim spaces
    HPO_CLEAN="$(echo "$HPO_RAW" | tr -d '"' | sed 's/ *, */,/g' | sed 's/^ *//;s/ *$//')"

    # Convert to python list format
    HPO_LIST="['$(echo "$HPO_CLEAN" | sed "s/,/','/g")']"

    # Output sample <tab> python-list
    echo -e "${SAMPLE}\t${HPO_LIST}"

done < "$INPUT_CSV" > "$OUTPUT_TSV"

echo "Conversion complete: $OUTPUT_TSV"