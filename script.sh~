#!/bin/bash

source var_config.cfg

cat $home_dir/sim_scripts/bird-$topology-regular-tree-$density-1 > $home_dir/simulation.csc

echo "TIMEOUT($timeout);&#xD;
output1 = new FileWriter(\"$result_dir/result\");&#xD;
output2 = new FileWriter(\"$result_dir/power\");&#xD;
plugin = mote.getSimulation().getGUI().getStartedPlugin(\"PowerTracker\");&#xD;
&#xD;
while (true) {&#xD;
  output1.write(msg + \"\n\");&#xD;
  log.log(time + \":\" + id + \":\" + msg + \"\n\");&#xD;
  try{&#xD;
    YIELD();&#xD;
  } catch (e) {&#xD;
    stats = plugin.radioStatistics();&#xD;
    output2.write(stats + \"\n\");&#xD;
    output1.close();&#xD;
    output2.close();&#xD;
    throw('test script killed')&#xD;
  }&#xD;" >> $home_dir/simulation.csc

cat $home_dir/sim_scripts/bird-$topology-regular-tree-$density-2 >> $home_dir/simulation.csc
