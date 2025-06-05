#!/bin/bash

while getopts "k:n:" opt; do
  case $opt in
    k) k=$OPTARG ;;
    n) num_read=$OPTARG ;;
    *) echo " - Usage: $0 -k <k-mer> -n <num_read>"; exit 1 ;;
  esac
done

if [ -z "$k" ] || [ -z "$num_read" ]; then
  echo " - Error, please specify arguments -k and -n"
  echo "Usage: $0 -k <k-mer> -n <num_read : 100K, 1M, 10M, 100M>"
  exit 1
fi

index="Data/index_table/index_k_${k}.idx"
output="Result/result_k_${k}_${num_read}"
threads=8

read1="Data/read/ERR251006_${num_read}_1.fastq"
read2="Data/read/ERR251006_${num_read}_2.fastq"

kallisto pseudo -i "$index" -o "$output" -t "$threads" "$read1" "$read2"