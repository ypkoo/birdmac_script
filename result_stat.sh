#!/bin/bash

source config.cfg
source var_config.cfg

id_idx=2
cycle_idx=3
mode_idx=4
ontime_idx=5
rb_idx=6
rm_idx=7
f_idx=8
r_idx=9
drift_idx=10

# remove useless lines
for mac in "${macs[@]}"; do
	result_dir="$title"_"$mac"
	rawdata_dir="$result_dir"/rawdata
	files=$(ls ../$rawdata_dir/*result)

	for file in $files; do
		grep "\[data\]" $file > temp
		cat temp > $file
		rm temp
	done
done

