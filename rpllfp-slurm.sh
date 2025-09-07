#!/bin/bash
#SBATCH -N 1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --time=2:00:00
#SBATCH -J "rpllfp"
#SBATCH -o rpllfp-slurm.%N.%j.out
#SBATCH -e rpllfp-slurm.%N.%j.err
# If your cluster uses a partition name, uncomment and set it:
# #SBATCH -p queue1

# env
source ~/.bashrc
conda activate env1

python -u -c "import PyHipp as pyh; \
import time; \
pyh.RPLLFP(saveLevel=1); \
print(time.localtime());"

