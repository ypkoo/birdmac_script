#!/bin/bash

source var_config.cfg

./param.sh
#$home_dir/sim_scripts/bird-$topology-regular-tree-$density.sh
./script.sh

java -mx512m -jar $home_dir/../../tools/cooja/dist/cooja.jar -nogui="$home_dir/simulation.csc" -contiki="$home_dir/../.."
