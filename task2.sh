#!/bin/bash

file="NC_000913.faa"

# Check if the file exists
if [ ! -f "$file" ]; then
    echo "Error: $file not found. Please make sure the file is in the current directory."
    exit 1
fi

# Count the number of sequences and calculate total amino acids
num_sequences=$(grep -c '^>' "$file")
total_amino_acids=$(grep -v '^>' "$file" | tr -d '\n' | wc -c)

# Calculate the average length
average_length=$((total_amino_acids / num_sequences))


# Print the result
echo "Average length of proteins: $average_length"
