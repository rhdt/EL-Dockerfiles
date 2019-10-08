#!/bin/bash

set -ex

IMAGE_NAME="$1"

echo "Building ${IMAGE_NAME} image"

cd base/${IMAGE_NAME}/

if [[ "$GIT_COMMIT" != "$GIT_PREVIOUS_COMMIT" ]]; then
  NO_CACHE_CMD="--no-cache=true"
else
  NO_CACHE_CMD="--no-cache=false"
fi

QUAY_TAG="quay.io/openshiftio/rhel-base-${IMAGE_NAME}:latest"

docker build --pull "${NO_CACHE_CMD}" \
  -t "${QUAY_TAG}" \
  .

docker push "${QUAY_TAG}"
