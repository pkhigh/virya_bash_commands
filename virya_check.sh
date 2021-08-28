!/bin/bash -l
#$ -N gpu_check
#$ -j y
#$ -l h=virya
#$ -l h_vmem=20G
nvidia-smi