#!/bin/bash

echo "Number of hkl files"
find . -name "*.hkl" | grep -v -e spiketrain -e mountains | wc -l

echo "Number of mda files"
find mountains -name "firings.mda" | wc -l
echo

echo "#==========================================================="
file_pattern="*-slurm*.out"
echo "Start Times"
for file in $(find . -name "$file_pattern"); do
    echo "==> $(basename "$file") <=="
    start_time=$(head -n 1 "$file")
    echo "$start_time"
    echo
done

echo "End Times"
for file in $(find . -name "$file_pattern"); do
    echo "==> $(basename "$file") <=="
    echo "$(tail -n 5 "$file")"
    echo
done

echo "#==========================================================="


