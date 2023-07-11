#!/bin/bash
#SBATCH -p icelake
#SBATCH -N 1
#SBATCH -n 16
#SBATCH --time=01:00:00   
#SBATCH --mem=128GB       
#SBATCH -o /hpcfs/users/a1018048/compare_diffsignal/slurm/%x_%j.out
#SBATCH -e /hpcfs/users/a1018048/compare_diffsignal/slurm/%x_%j.err
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=stephen.pederson@adelaide.edu.au


mamba init
mamba activate '/hpcfs/users/a1018048/envs/compare_diffsignal'

cd '/hpcfs/users/a1018048/compare_diffsignal'

Rscript --vanilla 'code/build_site'