#!/bin/bash -ve

#SBATCH -p compute # partition (queue)
#SBATCH --export=ALL
#SBATCH -n 40

emapper.py --cpu 40 -i seed.fas --output seq -d euk -m diamond
