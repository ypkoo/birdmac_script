#!/bin/bash

source var_config.cfg

cat $home_dir/sim_scripts/bird-$topology-regular-tree-$density-1 > $home_dir/simulation.csc

echo "TIMEOUT(1296000000);&#xD;
output1 = new FileWriter("$home_dir/$result_dir/result.txt");&#xD;
output2 = new FileWriter("$home_dir/$result_dir/power.txt");&#xD;
plugin = mote.getSimulation().getGUI().getStartedPlugin("PowerTracker");&#xD;
&#xD;
while (true) {&#xD;
  output1.write(msg + "\n");&#xD;
  log.log(time + ":" + id + ":" + msg + "\n");&#xD;
  try{&#xD;
    YIELD();&#xD;
  } catch (e) {&#xD;
    stats = plugin.radioStatistics();&#xD;
    output2.write(stats + "\n");&#xD;
    output1.close();&#xD;
    output2.close();&#xD;
    throw('test script killed')&#xD;
  }&#xD;" >> $home_dir/simulation.csc

cat $home_dir/sim_scripts/bird-$topology-regular-tree-$density-2 >> $home_dir/simulation.csc
