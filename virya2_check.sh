#!/bin/bash -l
#$ -N gpu_check
#$ -j y
#$ -l h=virya2
#$ -l h_vmem=20G
# set environment
nvidia-smi