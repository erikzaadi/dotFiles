#!/bin/bash

containers=()
A=`docker version 2>&1 /dev/null`
if [[ $? -ne 0 ]]; then
    #docker not running
    echo ""
    exit 0
fi

for container in `docker ps | tail -n +2 | awk '{print $NF};'`; do
  containers+=("$container")
done

if [ ${#containers[@]} -eq 1 ]; then
  echo "🐳: ${containers[0]}"
elif [ ${#containers[@]} -gt 1 ]; then
  echo "🐳 ${#containers[@]}"
#  for container in ${containers[@]}; do
#    containername=$(echo ${container} | cut -d'_' -f 1)
#    echo "$containername\""
#  done
else
    echo ""
fi
