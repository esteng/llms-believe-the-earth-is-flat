#!/bin/bash
#SBATCH --nodes=1
#SBATCH --gpus-per-node=1
#SBATCH --time=18:00:00
#SBATCH --job-name=decode
#SBATCH --output /data/elias_stengel_eskin/trained_calibration/third_party/llms-believe-the-earth-is-flat/src/logs/decode6.out


llama_ckpt=${LLAMA_CKPT} 
dataset=${DATASET}


if [[ "${LLAMA_CKPT}" == *"trained_calibration"* ]]; then
    type="trained"
else
    type="base"
fi

python -u run_exp.py \
	--model ${llama_ckpt} \
	--custom_model_type llama3 \
	--dataset ${dataset} \
	--failure 1 \
	--seed ${SEED} #> logs/decode_${dataset}_${type}_${SEED}_llama_new.log
	
