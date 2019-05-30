#PBS -S /bin/bash
#PBS -q batch
#PBS -N Map_Debilis_Outgroup
#PBS -l nodes=1:ppn=24
#PBS -l walltime=124:00:00
#PBS -l mem=100gb
#PBS -M dittmare@gmail.com
#PBS -m abe
#PBS -t 1-7


### This script will map reference sequence files to a genome using Stampy

set -o pipefail


module load

#   User provided arguments

#	Directory containing Trimmed sequences to map
SEQ_DIR='/scratch/eld72413/NSFproj/ancestralseqs/Debilis/Adapter_Trimming'

#   Where do our output files go?
OUT_DIR='/scratch/eld72413/NSFproj/ancestralseqs/Debilis/Mapped'

#	Naming scheme for forward and reverse reads
FORWARDNAME="_Forward_ScytheTrimmed.fastq.gz"

REVERSENAME="_Reverse_ScytheTrimmed.fastq.gz"

#   What is our per site substitution rate?
DIVERGENCE='0.04'

###
#Still need to fix the following
#   Reference prefix must match .stidx files
REF_PREFIX='barley_pseudomolecules_parts'
#   What directory contains our reference files?
REF_DIR='/'



#####

f1=$(find ${SEQ_DIR} -maxdepth 1 -name "*${FORWARDNAME}" | sed -n ${PBS_ARRAYID}p)

f2=${f1%%$FORWARDNAME}"$REVERSENAME"

#   Takes our forward read and generates sample name for output file
SAMPLE_NAME=$(basename ${f1%%$FORWARDNAME}"")

#   Stampy test run
#       -g is the genome index file, PREFIX.stidx
#       -h is the genome hash file, PREFIX.sthash
#       --substitutionrate is the expected fraction of Poisson-distributed substitutions (default is 0.001)
#       -f is the output file format
#       -M reads to map
#       -o is our output file
cd ${REF_DIR}
stampy -g "${REF_PREFIX}" \
       -h "${REF_PREFIX}" \
       --substitutionrate="${DIVERGENCE}" \
       -f sam \
       -o "${OUT_DIR}/${SAMPLE_NAME}_0.04.sam" \
       -M "${f1}","${f2}"