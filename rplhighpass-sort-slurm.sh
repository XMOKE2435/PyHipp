#!/bin/bash
#SBATCH -N 1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --time=3:00:00
#SBATCH -J "rplhpsort"
#SBATCH -o rplhpsort-slurm.%N.%j.out
#SBATCH -e rplhpsort-slurm.%N.%j.err
# If your cluster uses a partition name, uncomment and set it:
# #SBATCH -p queue1

# env
source ~/.bashrc
conda activate env1

python -u -c "import PyHipp as pyh; \
import time; \
pyh.RPLHighPass(saveLevel=1); \
from PyHipp import mountain_batch; \
mountain_batch.mountain_batch(); \
from PyHipp import export_mountain_cells; \
export_mountain_cells.export_mountain_cells(); \
print(time.localtime());"

