#!/bin/bash

set -e

PushReg="push.registry.devshift.net"
PushPath="osio-prod"
PushTag="latest"
BaseDir=`pwd`

for target in $(ls -d build_order/* | xargs realpath); do
  cd $target

  img_tag=$(pwd | sed -e "s|${BaseDir}/||g" )
  target="${PushReg}/${PushPath}/${img_tag}:${PushTag}"
  docker build --pull -t ${target} .
  if [ $? -eq 0 ]; then
    docker push $target
  fi
done

# clean up stale images
docker images -qf dangling=true | xargs --no-run-if-empty docker rmi
