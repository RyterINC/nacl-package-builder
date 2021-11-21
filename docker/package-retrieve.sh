#!/bin/bash

set -ex pipefail

docker build -t nacl:latest .
export CURRENT_DIR=$(pwd)
docker run -d --name nacl nacl:latest
export CONTAINER_ID=$(docker ps | awk 'FNR == 2 {print $1}')
docker cp ${CONTAINER_ID}:/tmp/pynacl_layer.zip .
