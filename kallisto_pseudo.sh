#!/usr/bin/env bash
set -euo pipefail

# === Configurable parameters ===
READ_DIR="Data/Read"            # Change if your folder name is different
INDEX_DIR="Data/Index_Table"
THREADS=8
FRAG_LEN=100    # For single-end
FRAG_SD=5       # For single-end

usage() {
  echo "Usage: $0 -k <k-mer>" >&2
  exit 1
}

k=""
while getopts "k:" opt; do
  case $opt in
    k) k=$OPTARG ;;
    *) usage ;;
  esac
done
[[ -z "${k}" ]] && usage

index="${INDEX_DIR}/index_k_${k}.idx"
[[ -f "$index" ]] || { echo "Index file not found: $index" >&2; exit 2; }

shopt -s nullglob
files=( "$READ_DIR"/*.fastq "$READ_DIR"/*.fq "$READ_DIR"/*.fastq.gz "$READ_DIR"/*.fq.gz )
files=( "${files[@]}" )  # ensure array

count=${#files[@]}
if (( count == 0 )); then
  echo "No FASTQ file found in ${READ_DIR}/" >&2
  exit 3
elif (( count > 2 )); then
  echo "Expected 1 or 2 FASTQ files, but found ${count}:" >&2
  printf '%s\n' "${files[@]}" >&2
  exit 4
fi

output="Result/result_k_${k}"
mkdir -p "$output"

if (( count == 1 )); then
  echo "[INFO] Running single-end mode"
  read1="${files[0]}"
  echo "[INFO] read1=${read1}"
  kallisto pseudo \
    -i "$index" \
    -o "$output" \
    -t "$THREADS" \
    --single -l "$FRAG_LEN" -s "$FRAG_SD" \
    "$read1"
else
  echo "[INFO] Running paired-end mode"
  read1="${files[0]}"
  read2="${files[1]}"
  echo "[INFO] read1=${read1}"
  echo "[INFO] read2=${read2}"
  kallisto pseudo \
    -i "$index" \
    -o "$output" \
    -t "$THREADS" \
    "$read1" "$read2"
fi