#!/bin/bash

source var_config.cfg
source config.cfg

./param.sh
./script.sh

java -mx512m -jar ../$mac/tools/cooja/dist/cooja.jar -nogui="simulation.csc" -contiki="../$mac"
