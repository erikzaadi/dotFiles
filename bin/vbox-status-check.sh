#!/bin/bash

#ht https://gist.github.com/grega/61355d041ccfaef66419

machines=()

for machine in `VBoxManage list runningvms|cut -d" " -f 1`; do
  machines+=("$machine")
done

if [ ${#machines[@]} -eq 1 ]; then
  machinename=$(echo ${machines[@]} | cut -d'_' -f 1)
  echo "VM:`echo $machinename | tail -c +2 | head -c -1`"
elif [ ${#machines[@]} -gt 1 ]; then
  echo "${#machines[@]} VMs"
#  for machine in ${machines[@]}; do
#    machinename=$(echo ${machine} | cut -d'_' -f 1)
#    echo "$machinename\""
#  done
else
    echo ""
fi
