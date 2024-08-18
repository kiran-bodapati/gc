#!/bin/bash
if [ -z "$1" ]; then
   echo "Usage: $0 <fasta_file>"
   exit 1
fi

fasta_file="$1"
gc_bases=$(awk '/^[^>]/ { g += gsub(/[GCgc]/, ""); t += length } END { print g }' "$fasta_file")
total_bases=$(awk '/^[^>]/ {t += length} END { print t}' "$fasta_file")


#gc_bases=$(grep -v '^>' "fasta_file" | tr -cd 'Gcgc' | wc -c)
#total_bases=$(grep -v '^>' "fasta_file" | tr -cd 'ACGTacgt' | wc -c)

#sequence=$(grep -v '^>' "fasta_file" | tr -d '\n') 
#total_bases=${#sequence}
#gc_bases=$(echo "$sequence" | grep -o -i '[GC]' | wc -l)

#gc_content=$((gc_bases/total_bases)*100)




gc_content=$(awk "BEGIN { printf \"%.4f\", $gc_bases / $total_bases * 100 }") 
echo "GC content in $fasta_file: $gc_content%" 