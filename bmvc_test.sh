#!/bin/bash -l
#$ -N bmvc_sample_test
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

python main.py --mode sample --num_domains 2 --w_hpf 1 \
               --resume_iter 100000 \
               --checkpoint_dir expr/checkpoints/celeba_hq \
               --val_batch_size 4 --latent_sample_per_domain 1 \
               --filename celeba_hq.jpg \
               --src_dir assets/paper/celeba_hq/src \
               --ref_dir assets/paper/celeba_hq/ref
               
python main.py --mode sample --num_domains 3 --w_hpf 0 \
               --resume_iter 100000 \
               --checkpoint_dir expr/checkpoints/afhq \
               --val_batch_size 4 --latent_sample_per_domain 1 \
               --filename afhq.jpg \
               --src_dir assets/paper/afhq/src \
               --ref_dir assets/paper/afhq/ref
               
python main.py --mode sample --num_domains 2 --w_hpf 1 \
               --alpha 128 --efficient 1 \
               --resume_iter 100000 \
               --checkpoint_dir expr/checkpoints/tiny_celeba_hq \
               --val_batch_size 4 --latent_sample_per_domain 1 \
               --filename tiny_celeba_hq.jpg \
               --src_dir assets/paper/celeba_hq/src \
               --ref_dir assets/paper/celeba_hq/ref

python main.py --mode sample --num_domains 3 --w_hpf 0 \
               --alpha 128 --efficient 1 \
               --resume_iter 100000 \
               --checkpoint_dir expr/checkpoints/tiny_afhq \
               --val_batch_size 4 --latent_sample_per_domain 1 \
               --filename tiny_afhq.jpg \
               --src_dir assets/paper/afhq/src \
               --ref_dir assets/paper/afhq/ref