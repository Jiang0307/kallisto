# kallisto

## Installation
* In `kallisto/`
```shell
chmod +x build.sh
sudo build.sh
```

## Usage : build index table
* Place the `.fasta` file you want to use to build the index table into `kallisto/Data/Transcript/`
* In `kallisto/`
```shell
chmod +x kallisto_index.sh
./kallisto_index.sh -k <k>
```

## Usage : pseudoalignment
* Place the `.fastq` file you want to test into `kallisto/Data/Read/`
* In `kallisto/`
```shell
chmod +x kallisto_pseudo.sh
./kallisto_pseudo.sh -k <k>
```