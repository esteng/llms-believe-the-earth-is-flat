#!/bin/bash


for seed in 12 42 64
do
    export SEED=${seed}
    for model in "llama_3.1_70B_dpo_agree_filtered_big_${seed}_seed" "llama_3.1_70B_combo_dpo_limited_filtered_big_${seed}_seed" "llama_3.1_70B_dpo_resist_limited_filtered_big_${seed}_seed"
    do
        for dataset in NQ1 NQ2 tqa boolq 
        do
            export LLAMA_CKPT="/nas-ssd2/esteng/trained_calibration/dialogue_models/trivia_qa/${model}"
            export DATASET=${dataset}
            echo "export LLAMA_CKPT=${LLAMA_CKPT}; export DATASET=${DATASET}; export SEED=${SEED}; slurm_scripts/decode_70b.sh" 
        done
    done 

    export LLAMA_CKPT="/nas-ssd2/esteng/.cache/models--meta-llama--Meta-Llama-3.1-70B-Instruct/snapshots/945c8663693130f8be2ee66210e062158b2a9693/" 
	for dataset in NQ1 NQ2 tqa boolq 
    do
        export DATASET=${dataset}
        # sbatch slurm_scripts/decode_70b.sh
        echo "export LLAMA_CKPT=${LLAMA_CKPT}; export DATASET=${DATASET}; export SEED=${SEED}; slurm_scripts/decode_70b.sh" 
    done
done 



