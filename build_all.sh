#!/bin/bash

PushReg="push.registry.devshift.net"
PushPath="osio-prod"
PushTag="latest"
BaseDir=`pwd`

for target in $(find . -type f -name Dockerfile | sort); do 
  cd `dirname $target`
  img_tag=$(pwd | sed -e "s|${BaseDir}/||g" )
  echo $img_tag
  target="${PushReg}/${PushPath}/${img_tag}:${PushTag}"
  docker build -t ${target} . 
  if [ $? -eq 0 ]; then
    docker push $target
  fi
done

# clean up stale images
docker images -qf dangling=true | xargs docker rmi
