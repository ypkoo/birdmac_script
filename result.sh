#!/bin/bash

source config.cfg

for mac in "${macs[@]}"; do
	result_dir="$mac"_"$title"
	rawdata_dir="$result_dir"/rawdata
	files=$(ls ../$rawdata_dir/*result)

	for file in $files; do
		grep "\[data\]" $file > temp
		cat temp > $file
		rm temp
	done
done

for mac in "${macs[@]}"; do
	result_dir="$mac"_"$title"
	rawdata_dir="$result_dir"/rawdata
	rm -f ../$result_dir/over_period
	for topology in "${topologies[@]}"; do
		for check_rate in "${check_rates[@]}"; do
		  for sigma in "${sigmas[@]}"; do
		    for density in "${densities[@]}"; do
					echo "#" $topology-$check_rate-$density >> ../$result_dir/over_period
					for period_ in "${periods[@]}"; do
						period=$(expr $period_ \* 3600)
						rm -f temp_power
				    for seed in "${seeds[@]}"; do
				      grep "AVG ON" ../$rawdata_dir/$period-$topology-$check_rate-$density-$seed-power >> temp_power
				    done
						awk -v period="$period_" '{sum+=$3}; END {print period, sum/NR}' temp_power >> ../$result_dir/over_period
						rm -f temp_power
					done
					echo "" >> ../$result_dir/over_period
		    done
		  done
		done
	done
done

for mac in "${macs[@]}"; do
	result_dir="$mac"_"$title"
	rawdata_dir="$result_dir"/rawdata
	rm -f ../$result_dir/over_degree
	for period_ in "${periods[@]}"; do
		period=$(expr $period_ \* 3600)
		for check_rate in "${check_rates[@]}"; do
		  for sigma in "${sigmas[@]}"; do
		    for density in "${densities[@]}"; do
					echo "#" $period-$check_rate-$density >> ../$result_dir/over_degree
					for topology in "${topologies[@]}"; do
						rm -f temp_power
		      	for seed in "${seeds[@]}"; do
							grep "AVG ON" ../$rawdata_dir/$period-$topology-$check_rate-$density-$seed-power >> temp_power
		        done
						awk -v degree="$topology" '{sum+=$3}; END {print degree, sum/NR}' temp_power >> ../$result_dir/over_degree
						rm -f temp_power
		      done
					echo "" >> ../$result_dir/over_degree
		    done
		  done
		done
	done
done



