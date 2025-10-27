# run BLAT to all ant genes from publicly available ant genomes

blat -t=dnax -q=prot genome.fas ../../all_ant_genome_pep.fasta map.psl -noHead

# run PEP_scaffolder

sh PEP_scaffolder.sh -d ./ -i map.psl -j genome.fas
