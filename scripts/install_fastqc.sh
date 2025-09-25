#!/bin/bash

# Exit on any error
set -e

# Load necessary modules
module purge
module load bluebear
module load Java

# Define install location
INSTALL_DIR=~/tools/FastQC
ZIP_FILE=~/tools/fastqc_v0.12.1.zip

# Check if ZIP exists
if [ ! -f "$ZIP_FILE" ]; then
  echo "Error: $ZIP_FILE not found. Please download it first."
  exit 1
fi

# Unzip FastQC
echo "Unzipping FastQC..."
unzip -o "$ZIP_FILE" -d ~/tools/

# Set executable permissions
chmod +x "$INSTALL_DIR/fastqc"

# Test the installation
echo "FastQC version:"
"$INSTALL_DIR/fastqc" --version
