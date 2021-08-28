#!/bin/bash -l
#$ -N celeb_64_5e5
#$ -j y
#$ -l h=virya
#$ -l h_vmem=200G
# set environment
module load anaconda/3.2019.10/default
module load cuda/10.2/default
source activate stargan-v2
export CUDA_VISIBLE_DEVICES=3
cd deployment/tini_starganv2/
python main.py --mode distill_train --num_domains 2 --w_hpf 1 --batch_size 8 --num_workers 4 --resume_iter 0  --alpha 64 --efficient 1 \
               --lambda_reg 1 --lambda_sty 1 --lambda_ds 1 --lambda_cyc 1 --f_lr 5e-5 \
               --train_img_dir data/celeba_hq/train --val_img_dir data/celeba_hq/val \
               --teacher_checkpoint_dir expr/checkpoints/celeba_hq --teacher_resume_iter 100000 \
               --checkpoint_dir expr/celeb_64_5e5 --print_every 10 --save_every 10000