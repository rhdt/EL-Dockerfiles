#/bin/bash

report_error() {
    echo "ERROR: $action"
}

trap report_error EXIT

set -ex

PushReg="push.registry.devshift.net"
PushPath="osio-prod"
PushTag="latest"
BaseDir=`pwd`

action="calculate targets"
if [ $# -eq 0 ]; then
  targets=$(ls -d build_order/* | xargs realpath)
else
  targets=$(echo "$@" | xargs realpath)
fi

for target in "$targets"; do
  action="building $target"

  cd $target

  img_tag=$(pwd | sed -e "s|${BaseDir}/||g" )
  target="${PushReg}/${PushPath}/${img_tag}:${PushTag}"
  docker build --pull -t ${target} .
  if [ $? -eq 0 ]; then
    docker push $target
  fi
done

# clean up stale images
action="cleaning stale images"
docker images -qf dangling=true | xargs --no-run-if-empty docker rmi

trap - EXIT
exit 0
