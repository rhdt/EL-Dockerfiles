#!/bin/bash

PushReg="push.registry.devshift.net"
PushPath="osio-prod"
PushTag="latest"
BaseDir=`pwd`

for target in `ls -d build_order/* | xargs realpath`; do
  cd $target

  ImgTag=$(pwd | sed -e "s|${BaseDir}/||g" )
  target="${PushReg}/${PushPath}/${ImgTag}:${PushTag}"
  echo docker build --pull -t ${target} .
  if [ $? -eq 0 ]; then
    echo docker push $target
  fi
done

# clean up stale images
docker images -qf dangling=true | xargs --no-run-if-empty docker rmi
