#!/bin/bash -l
#$ -N Log_afhq_64
#$ -j y
#$ -l h=virya
#$ -l h_vmem=250G
# set environment
module load anaconda/3.2019.10/default
module load cuda/10.2/default
source activate stargan-v2
export CUDA_VISIBLE_DEVICES=6
cd deployment/tini_starganv2/

python main.py --mode distill_train --num_domains 3 --w_hpf 0 --batch_size 8 --num_workers 4 --resume_iter 0  --alpha 64 --efficient 1 \
               --lambda_reg 1 --lambda_sty 1 --lambda_ds 2 --lambda_cyc 1 --f_lr 1e-4  --D_channels 64 \
               --train_img_dir data/afhq/train --val_img_dir data/afhq/val \
               --teacher_checkpoint_dir expr/checkpoints/afhq --teacher_resume_iter 100000 \
               --checkpoint_dir expr/Log_afhq_64 --print_every 10 --save_every 10000
