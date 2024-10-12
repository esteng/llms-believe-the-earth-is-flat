#!/bin/bash


for seed in 12 42 64
do
    export SEED=${seed}
    for model in "llama_3.1_8B_dpo_agree_filtered_big_${seed}_seed" "llama_3.1_8B_combo_dpo_limited_filtered_big_${seed}_seed" "llama_3.1_8B_dpo_resist_limited_filtered_big_${seed}_seed" 
    do
        for dataset in NQ1 NQ2 tqa # boolq tqa 
        # for dataset in tqa 
        do
            export LLAMA_CKPT="/data/elias_stengel_eskin/trained_calibration/dialogue_models/trivia_qa/${model}"
            export DATASET=${dataset}
            sbatch  slurm_scripts/decode_model_llama.sh 
        done
    done 

    for model in  "mistral_v0.2_7B_dpo_agree_filtered_big_${seed}_seed" "mistral_v0.2_7B_dpo_resist_limited_filtered_big_${seed}_seed" "mistral_v0.2_7B_combo_dpo_limited_filtered_big_${seed}_seed"
    do 
        for dataset in NQ1 NQ2 tqa # boolq tqa 
        # for dataset in tqa 
        do
            export LLAMA_CKPT="/data/elias_stengel_eskin/trained_calibration/dialogue_models/trivia_qa/${model}"
            export DATASET=${dataset}
            sbatch  slurm_scripts/decode_model_mistral.sh 
        done
    done

    export MODEL="/data/huggingface/models--mistralai--Mistral-7B-Instruct-v0.2/snapshots/36d7e540e651b68dac59394d9c3381651df7fb01/" 
    for dataset in NQ1 NQ2 boolq tqa 
    # for dataset in tqa 
    do
        export LLAMA_CKPT=${MODEL}
        export DATASET=${dataset}
        sbatch slurm_scripts/decode_model_mistral.sh 
    done
    export MODEL="/data/huggingface/models--meta-llama--Meta-Llama-3.1-8B-Instruct/snapshots/8c22764a7e3675c50d4c7c9a4edb474456022b16/"
    for dataset in NQ1 NQ2 boolq tqa 
    # for dataset in tqa 
    do
        export LLAMA_CKPT=${MODEL}
        export DATASET=${dataset}
        sbatch slurm_scripts/decode_model_llama.sh 
    done
done 



