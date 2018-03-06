#!/usr/bin/env bash


#SBATCH --cluster=gpu
#SBATCH --gres=gpu:1
#SBATCH --partition=titan
#SBATCH --job-name=wiki_base_eval
#SBATCH --output=wiki_base_eval.out
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --time=6-00:00:00
#SBATCH --qos=long

# Load modules
module restore

# Run the job
srun python ../model/eval.py -ngpus 1 -bsize 100 -fw transformer -out wiki_base -layer_drop 0.2 -op adagrad -lr 0.1 --mode wiki -nhl 6 -nel 6 -ndl 6 -lc True --it_train True -eval_freq 0

