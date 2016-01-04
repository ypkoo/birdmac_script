#!/bin/bash

source config.cfg

rm -rf ../$result_dir

mkdir -p ../$result_dir
mkdir -p ../$result_dir/results
mkdir -p ../$result_dir/rawdata

for period in "${periods[@]}"; do
  for topology in "${topologies[@]}"; do
    for check_rate in "${check_rates[@]}"; do
      for sigma in "${sigmas[@]}"; do
        for density in "${densities[@]}"; do
          for seed in "${seeds[@]}"; do
            ./var_config.sh $period $sigma $topology $seed $check_rate $density
            cat var_config.cfg
            ./do_simulation.sh
          done
        done
      done
    done
  done
done

rm COOJA.log
rm COOJA.testlog
rm -rf se
