#!/bin/bash

source config.cfg

DATE=`date +"%y%m%d"`

dir_name="$DATE"_"$title"

echo $DATE
echo $dir_name

mkdir -p $dir_name
mkdir -p $dir_name/results
mkdir -p $dir_name/rawdata

for period in "${periods[@]}"; do
  for topology in "${topologies[@]}"; do
    for check_rate in "${check_rates[@]}"; do
      for sigma in "${sigmas[@]}"; do
        for density in "${densities[@]}"; do
          for seed in "${seeds[@]}"; do
            ./var_config.sh $period $sigma $topology $seed $check_rate $density $dir_name
            cat var_config.cfg
            ./do_simulation.sh
          done
        done
      done
    done
  done
done
