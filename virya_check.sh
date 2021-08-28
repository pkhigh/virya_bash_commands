#!/bin/bash -l
#$ -N gpu_check
#$ -l h_vmem=5G
#$ -l h=virya
#$ -j y
nvidia-smi