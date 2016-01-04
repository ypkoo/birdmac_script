#!/bin/bash

timeout=`expr $1 \* 30 \* 1000`

echo "period="$1"
sigma="$2"
topology="$3"
seed="$4"
check_rate="$5"
density="$6"
result_dir="$7"
home_dir=~/koo/birdmac_exp/lanada/app
timeout=$timeout" > var_config.cfg
