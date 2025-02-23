## genome - assembly
busco -i {genome.fas} \
        -l ./arachnida_odb10 \
        -o busco \
        -m genome \
        --cpu 30

## genome - annotated gene models
busco -i {genome.pep} \
        -l ./arachnida_odb10 \
        -o busco \
        -m prot \
        --cpu 30

## transcriptome - assembly
busco -i {RNA.fas} \
        -l ./arachnida_odb10 \
        -o busco \
        -m trans \
        --cpu 30
        
## transcriptome - annotated gene models
busco -i {RNA.fas} \
        -l ./arachnida_odb10 \
        -o busco \
        -m prot \
        --cpu 30
