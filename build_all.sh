#/bin/bash

set -ex

QUAY="quay.io/openshiftio"

PUSH_TAG="latest"
BASE_DIR=`pwd`

if [ $# -eq 0 ]; then
  TARGETS=$(ls -d build_order/* | xargs realpath)
else
  TARGETS=$(echo "$@" | xargs realpath)
fi

for TARGET in $TARGETS; do
  cd $TARGET

  IMAGE_NAME="${PWD##$BASE_DIR/}"
  QUAY_IMAGE="rhel-${IMAGE_NAME//\//-}"

  TARGET_QUAY="${QUAY}/${QUAY_IMAGE}:${PUSH_TAG}"

  docker build --pull -t "${TARGET_QUAY}" .
  if [ $? -eq 0 ]; then
    docker push $TARGET_QUAY
  fi
done

# Clean up
docker ps -aq -f status=exited|xargs --no-run-if-empty docker rm
docker images -qf dangling=true | xargs --no-run-if-empty docker rmi
