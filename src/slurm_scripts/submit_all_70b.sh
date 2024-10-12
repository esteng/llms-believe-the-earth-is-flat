#!/bin/bash


for seed in 12 42 64
do
    export SEED=${seed}
    for model in "llama_3.1_70B_dpo_agree_filtered_big_${seed}_seed" "llama_3.1_70B_combo_dpo_limited_filtered_big_${seed}_seed" "llama_3.1_70B_dpo_resist_limited_filtered_big_${seed}_seed"
    do
        for dataset in NQ1 NQ2 tqa # boolq tqa 
        do
            export LLAMA_CKPT="/data/elias_stengel_eskin/trained_calibration/dialogue_models/trivia_qa/${model}"
            export DATASET=${dataset}
            sbatch slurm_scripts/decode_70b.sh 
        done
    done 

    export LLAMA_CKPT="/data/huggingface/models--meta-llama--Meta-Llama-3.1-70B-Instruct/snapshots/33101ce6ccc08fa6249c10a543ebfcac65173393/" 
	for dataset in NQ1 NQ2 tqa # boolq tqa 
    do
        export DATASET=${dataset}
        sbatch slurm_scripts/decode_70b.sh
    done
done 



