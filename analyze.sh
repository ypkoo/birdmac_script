#!/bin/bash

source config.cfg
source var_config.cfg

id_idx=2
cycle_idx=3
mode_idx=4
ontime_idx=5
rb_idx=6
rm_idx=7
f_idx=8
r_idx=9
drift_idx=10

mkdir -p result

awk -v i="$i" '{
  sum_ontime+=$5;
  sum_rb+=$6;
  sum_rm+=$7;
  sum_f+=$8;
  sum_r+=$9;
  sum_bs+=$10};
  END {
  printf("#%-9s%-5s%-5s%-5s%-5s%-5s\n", "ontime", "rb", "rm", "f", "r", "bs");
  printf("%-10d%-5d%-5d%-5d%-5d%-5d\n", sum_ontime, sum_rb, sum_rm, sum_f, sum_r, sum_bs);
  printf("%-10.2f%-5.2f%-5.2f%-5.2f%-5.2f%-5.2f\n", sum_ontime/NR, sum_rb/NR, sum_rb/NR, sum_f/NR, sum_r/NR, sum_bs/NR);}' $result_dir/result >> $result_dir/result_overall.txt

if [ "$ontime_per_node" = 1 ]; then
  for (( i=1; i<=$node_num; i++ )); do
    awk -v i="$i" '{ if ($2==i) sum+=$5 }
                  END {print i, sum }' $result_dir/result >> $result_dir/result_ontime_per_node.txt
  done
fi

if [ "$rb_per_node" = 1 ]; then
  for (( i=1; i<=$node_num; i++ )); do
    awk -v i="$i" '{ if ($2==i) sum+=$6 }
                  END {print i, sum }' $result_dir/result >> $result_dir/result_rb_per_node.txt
  done
fi

if [ "$rm_per_node" = 1 ]; then
  for (( i=1; i<=$node_num; i++ )); do
    awk -v i="$i" '{ if ($2==i) sum+=$7 }
                  END {print i, sum }'$result_dir/result >> $result_dir/result_rm_per_node.txt
  done
fi

if [ "$f_per_node" = 1 ]; then
  for (( i=1; i<=$node_num; i++ )); do
    awk -v i="$i" '{ if ($2==i) sum+=$8 }
                  END {print i, sum }' $result_dir/result >> $result_dir/result_f_per_node.txt
  done
fi

if [ "$r_per_node" = 1 ]; then
  for (( i=1; i<=$node_num; i++ )); do
    awk -v i="$i" '{ if ($2==i) sum+=$9 }
                  END {print i, sum }' $result_dir/result >> $result_dir/result_r_per_node.txt
  done
fi

if [ "$bs_per_node" = 1 ]; then
  for (( i=1; i<=$node_num; i++ )); do
    awk -v i="$i" '{ if ($2==i) sum+=$10 }
                  END {print i, sum }' $result_dir/result >> $result_dir/result_bs_per_node.txt
  done
fi

if [ "$ontime_avg_per_node" = 1 ]; then
  for (( i=1; i<=$node_num; i++ )); do
    awk -v i="$i" '{ 
    if ($2==i) {
      $4=="PARENT" ? sum_par+=$5 : sum_chi+=$5;
      cnt++;}};
      END {printf("%-3d\t%-6.2f\t#\t%-5d%-5d\n", i, (sum_par+sum_chi)/cnt, sum_par, sum_chi);}' $result_dir/result >> $result_dir/result_ontime_avg_per_node.txt
  done
fi

if [ "$rb_avg_per_node" = 1 ]; then
  for (( i=1; i<=$node_num; i++ )); do
    awk -v i="$i" '{ 
    if ($2==i) {
      $4=="PARENT" ? sum_par+=$6 : sum_chi+=$6;
      cnt++;
    }}
    END {printf("%-3d\t%-6.2f\t#\t%-5d%-5d\n", i, (sum_par+sum_chi)/cnt, sum_par, sum_chi);}' $result_dir/result >> $result_dir/result_rb_avg_per_node.txt
  done
fi

if [ "$rm_avg_per_node" = 1 ]; then
  for (( i=1; i<=$node_num; i++ )); do
    awk -v i="$i" '{ 
    if ($2==i) {
      $4=="PARENT" ? sum_par+=$7 : sum_chi+=$7;
      cnt++;
    }}
    END {printf("%-3d\t%-6.2f\t#\t%-5d%-5d\n", i, (sum_par+sum_chi)/cnt, sum_par, sum_chi);}' $result_dir/result >> $result_dir/result_rm_avg_per_node.txt
  done
fi

if [ "$f_avg_per_node" = 1 ]; then
  for (( i=1; i<=$node_num; i++ )); do
    awk -v i="$i" '{ 
    if ($2==i) {
      $4=="PARENT" ? sum_par+=$8 : sum_chi+=$8;
      cnt++;
    }}
    END {printf("%-3d\t%-6.2f\t#\t%-5d%-5d\n", i, (sum_par+sum_chi)/cnt, sum_par, sum_chi);}' $result_dir/result >> $result_dir/result_f_avg_per_node.txt
  done
fi

if [ "$r_avg_per_node" = 1 ]; then
  for (( i=1; i<=$node_num; i++ )); do
    awk -v i="$i" '{ 
    if ($2==i) {
      $4=="PARENT" ? sum_par+=$9 : sum_chi+=$9;
      cnt++;
    }}
    END {printf("%-3d\t%-6.2f\t#\t%-5d%-5d\n", i, (sum_par+sum_chi)/cnt, sum_par, sum_chi);}' $result_dir/result >> $result_dir/result_r_avg_per_node.txt
  done
fi

if [ "$bs_avg_per_node" = 1 ]; then
  for (( i=1; i<=$node_num; i++ )); do
    awk -v i="$i" '{ 
    if ($2==i) {
      $4=="PARENT" ? sum_par+=$10 : sum_chi+=$10;
      cnt++;
    }}
    END {printf("%-3d\t%-6.2f\t#\t%-5d%-5d\n", i, (sum_par+sum_chi)/cnt, sum_par, sum_chi);}' $result_dir/result >> $result_dir/result_bs_avg_per_node.txt
  done
fi
