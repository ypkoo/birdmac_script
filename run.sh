#!/bin/bash

source config.cfg

for mac in "${macs[@]}"; do
	mkdir -p ../"$mac"_"$title"
	mkdir -p ../"$mac"_"$title"/results
	mkdir -p ../"$mac"_"$title"/rawdata
	for period in "${periods[@]}"; do
	  for topology in "${topologies[@]}"; do
	    for check_rate in "${check_rates[@]}"; do
	      for sigma in "${sigmas[@]}"; do
					for density in "${densities[@]}"; do
						for seed in "${seeds[@]}"; do
							./var_config.sh $period $sigma $topology $seed $check_rate $density $mac
							cat var_config.cfg
							./do_simulation.sh
						done
					done
	      done
	    done
	  done
	done
done

rm COOJA.log
rm COOJA.testlog
rm -rf se
