# Sunflower Outgroups

Reads were downloaded from the Sequence Read Archive from BioProject PRJNA397453

Sequence data was obtained as described in Hubner et al. (2019)

---

### Mapping sunflower outgroups _Helianthus debilis_ :

| SRA Name  | Renamed as |
|-----------| ---------- |
|SRS2413722 | Debilis_22 |
|SRS2413743 | Debilis_43 |
|SRS2413744 | Debilis_44 |
|SRS2413741 | Debilis_41 |
|SRS2413740 | Debilis_40 |
|SRS2413739 | Debilis_39 |
|SRS2413737 | Debilis_37 |

---

## Methods

Samples were quality assessed and trimmed using sequence handling https://github.com/EDitt/sequence_handling

Samples were then mapped to the HA412Ho v.2.0 genome
- First, a genome index file was created using the following command:
> `module load Stampy/1.0.31-foss-2016b-Python-2.7.14`  
`cd scratch/eld72413/NSFproj/ancestralseqs/GenomeFiles/`  
`stampy.py -G Ha412HOv2 /scratch/eld72413/Ha412HOv2.0/Ha412HOv2.0-20181130.fasta`  
(The `-G` flag specifies the PREFIX for the genome index)  
This created a genome file "Ha412HOv2.stidx"  
- Then a genome hash file was created in the same directory:  
> `stampy.py -g Ha412HOv2 -H Ha412HOv2`   
>Inputs needed are `-g` to specify the genome index prefix (use the genome index file PREFIX.stidx),
and `-H` to build a hash file with the prefix listed (build hash PREFIX.sthash)
