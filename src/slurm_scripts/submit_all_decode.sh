#!/bin/bash


for seed in 12 42 64
do
    export SEED=${seed}
    for model in "llama_3.1_8B_dpo_agree_filtered_big_${seed}_seed" "llama_3.1_8B_combo_dpo_limited_filtered_big_${seed}_seed" "llama_3.1_8B_dpo_resist_limited_filtered_big_${seed}_seed" 
    do
     	for dataset in NQ1 NQ2 boolq tqa 
        do
            export LLAMA_CKPT="/nas-ssd2/esteng/trained_calibration/dialogue_models/trivia_qa/${model}"
            export DATASET=${dataset}
            echo "export SEED=${SEED}; export LLAMA_CKPT=${LLAMA_CKPT}; export DATASET=${DATASET}; export SEED=${SEED}; slurm_scripts/decode_model_llama.sh"

        done
    done 

    for model in  "mistral_v0.2_7B_dpo_agree_filtered_big_${seed}_seed" "mistral_v0.2_7B_dpo_resist_limited_filtered_big_${seed}_seed" "mistral_v0.2_7B_combo_dpo_limited_filtered_big_${seed}_seed"
    do 
     	for dataset in NQ1 NQ2 boolq tqa 
        do
            export LLAMA_CKPT="/nas-ssd2/esteng/trained_calibration/dialogue_models/trivia_qa/${model}"
            export DATASET=${dataset}
            echo "export SEED=${SEED}; export LLAMA_CKPT=${LLAMA_CKPT}; export DATASET=${DATASET}; export SEED=${SEED}; slurm_scripts/decode_model_mistral.sh"
            # sbatch  slurm_scripts/decode_model_mistral.sh 
        done
    done

     export MODEL="/nas-ssd2/esteng/.cache/models--mistralai--Mistral-7B-Instruct-v0.2/snapshots/b70aa86578567ba3301b21c8a27bea4e8f6d6d61/" 
     for dataset in NQ1 NQ2 boolq tqa 
     # for dataset in tqa 
     do
         export LLAMA_CKPT=${MODEL}
         export DATASET=${dataset}
         # sbatch slurm_scripts/decode_model_mistral.sh 
     done
     export MODEL="/nas-ssd2/esteng/.cache/models--meta-llama--Meta-Llama-3.1-8B-Instruct/snapshots/0e9e39f249a16976918f6564b8830bc894c89659/" 
     for dataset in NQ1 NQ2 boolq tqa 
     # for dataset in tqa 
     do
         export LLAMA_CKPT=${MODEL}
         export DATASET=${dataset}
         # sbatch slurm_scripts/decode_model_llama.sh 
     done
done 



