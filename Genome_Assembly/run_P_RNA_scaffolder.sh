# mapping RNA-seq data to ant genome
hisat2-build ant.fa ant_hisat
hisat2 -x ant_hisat -1 read_1.fq -2 read_2.fq -k 3 -p 10 --pen-noncansplice 1000000 -S input.sam

# P_RNA_scaffolder
sh P_RNA_scaffolder.sh -d ./ -i input.sam -j ant.fa -F read_1.fa -R read_2.fq -o output
