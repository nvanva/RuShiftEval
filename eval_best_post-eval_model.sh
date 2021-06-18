#!/bin/bash
mkdir for_gold
cp -r rushiftEval/*rusemshift for_gold/
python src/tsv_to_json_gold.py --path_to_combine for_gold/
python src/sample_scr.py --path_to_test rushiftEval/Evaluation_words/ --path_to_dev rushiftEval/RuSemShift_instances/ --path_to_sampled pairs/ --path_to_combine pairs/combine/ --in_words_dev1 rushiftEval/testset1.tsv --in_words_dev2 rushiftEval/testset2.tsv --delete_short_and_long True --delete_first_and_last_position True --n_pairs 100
echo "sample comlete"
cd mcl-wic
python run_model.py --do_eval --ckpt_path ../mean_dist_l1ndotn_CE --eval_input_dir ../pairs/combine/sampled_data --eval_output_dir rusemshift_predictions/ --output_dir ../first_concat --loss crossentropy_loss --pool_type mean --symmetric true --train_scd 
mkdir sampled_data
mkdir sampled_data/score
mkdir sampled_data/ans
mv mean_dist_l1ndotn_CE/rusemshift_predictions/*.scores sampled_data/score/
mv mean_dist_l1ndotn_CE/rusemshift_predictions/* sampled_data/ans/ 
python src/constr.py --type mean --model_name mean_dist_l1ndotn_CE
python src/mean_method.py --model_name mean_dist_l1ndotn_CE
python src/statistics_method.py --model_name mean_dist_l1ndotn_CE
python src/iso_method.py --model_name mean_dist_l1ndotn_CE
