#!/bin/bash

set -ex

# test jjb index
./generate-index.py > test.yaml
/var/lib/jenkins/.local/bin/jenkins-jobs test test.yaml

# change tags in dockerfiles
sed -i -e "s#:latest#:${ghprbActualCommit}#g" base/**/Dockerfile

for target in $(ls -d build_order/* | xargs realpath); do
  cd $target
  img_tag=$(basename $PWD)
  echo "Building $img_tag"
  docker build -t prod.registry.devshift.net/osio-prod/base/$img_tag:${ghprbActualCommit} .
done


# clean up
docker rmi -f $(docker images --filter "dangling=true" -q --no-trunc) || true
