#!/bin/bash

while getopts "k:" opt; do
  case $opt in
    k) k=$OPTARG ;;
    *) echo "使用方式: $0 -k <k值>"; exit 1 ;;
  esac
done

if [ -z "$k" ]; then
  echo "錯誤：請使用 -k 指定 k 值"
  echo "使用方式: $0 -k <k值>"
  exit 1
fi

# 重要：加上 Data 路徑
index="Data/index_table/index_k_${k}.idx"
fasta="Data/transcript/transcripts.fasta"

kallisto index -i "$index" -k "$k" "$fasta"