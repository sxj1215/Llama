##env
pip install -e ".[torch,metrics]" --no-build-isolation

##download data

data_dir=../data
huggingface-cli download sxj1215/training_data --repo-type dataset --local-dir data/training_data
huggingface-cli download z-lab/xray-test --repo-type dataset --local-dir ${data_dir}/xray-test
mv "${data_dir}/xray-test" "${data_dir}/physionet.org"
huggingface-cli download 
huggingface-cli download sxj1215/barts2018 --repo-type dataset --local-dir ${data_dir}/barts2018
cd ${data_dir}/barts2018
tar -xvzf slices.tar.gz
cd ${data_dir}/physionet.org
cat cat physionet_files.tar.gz.part-* > physionet_files.tar.gz
tar -xvzf physionet_files.tar.gz


##train
llamafactory-cli train  examples/train_lora/medgemma_lora_sft.yaml