#!/bin/bash

containers=()
A=`timeout 1s docker version 2> /dev/null`
if [[ $? -ne 0 ]]; then
    #docker not running
    echo ""
    exit 0
fi

for container in `docker ps --format "{{.Names}}"`; do
  containers+=("$container")
done

if [ ${#containers[@]} -eq 1 ]; then
  echo "🐳: ${containers[0]} "
elif [ ${#containers[@]} -gt 1 ]; then
  echo "🐳 ${#containers[@]} "
else
    echo ""
fi
