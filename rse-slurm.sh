#!/bin/bash
#SBATCH -N 1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --time=1:00:00
#SBATCH -J "rse"
#SBATCH -o rse-slurm.%N.%j.out
#SBATCH -e rse-slurm.%N.%j.err
# If your cluster uses a named partition/queue, uncomment and set it:
# #SBATCH -p queue1

# env
source ~/.bashrc
conda activate env1

python -u -c "import PyHipp as pyh; \
import time; \
import os; \
t0 = time.time(); \
print(time.localtime()); \
os.chdir('sessioneye'); \
pyh.RPLSplit(SkipLFP=False, SkipHighPass=False); \
print(time.localtime()); \
print(time.time()-t0);"

