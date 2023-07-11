#!/bin/bash
#SBATCH -p skylake
#SBATCH -N 1
#SBATCH -n 16
#SBATCH --time=01:00:00   
#SBATCH --mem=128GB       
#SBATCH -o /hpcfs/users/a1018048/compare_diffsignal/slurm/%x_%j.out
#SBATCH -e /hpcfs/users/a1018048/compare_diffsignal/slurm/%x_%j.err
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=stephen.pederson@adelaide.edu.au

source /home/a1018048/.bashrc
mamba init
mamba activate '/hpcfs/users/a1018048/envs/compare_diffsignal'

echo 'Checking mamba is activated'
which mamba
which R
which Rscript

cd '/hpcfs/users/a1018048/compare_diffsignal'

Rscript --vanilla 'code/build_site.R'

mamba deactivate