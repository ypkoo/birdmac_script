#!/bin/bash

period=$(expr $1 \* 3600)
timeout=$(expr $period \* 30 \* 1000)

echo "period="$period"
sigma="$2"
topology="$3"
seed="$4"
check_rate="$5"
density="$6"
home_dir=~/koo/birdmac_exp/lanada/app
timeout="$timeout"" > var_config.cfg
