#!/bin/bash
# Batch script to run BUSCO on Y. lipolytica genomes
BUSCO_DB="saccharomycetes_odb10"
CPU_COUNT=8
OUTPUT_DIR="busco_all_results"

mkdir -p $OUTPUT_DIR

for fasta_file in Yarrowia_lipolytica_*.fasta; do
    strain_name=$(basename "$fasta_file" .fasta)
    echo "Processing $strain_name..."
    busco -i "$fasta_file" -o "$OUTPUT_DIR/$strain_name" -m genome -l $BUSCO_DB --cpu $CPU_COUNT --quiet
done
