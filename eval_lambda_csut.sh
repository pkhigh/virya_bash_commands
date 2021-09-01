#!/bin/bash -l
#$ -N bmvc_afhq_128_lambda_csut2_test
#$ -j y
#$ -l h=virya
#$ -l g=1
#$ -l h_vmem=300G
# set environment
module load anaconda/3.2019.10/default
module load cuda/10.2/default
source activate stargan-v2
export CUDA_VISIBLE_DEVICES=0
cd paper_work/tini_starganv2/

python main.py --mode eval --num_domains 3 --resume_iter 100000 --w_hpf 0 --alpha 128 --efficient 1 \
               --train_img_dir data/afhq/train --val_img_dir data/afhq/val \
               --checkpoint_dir expr/bmvc_afhq_128_lambda_csut2 --eval_dir expr/eval/bmvc_afhq_128_lambda_csut2