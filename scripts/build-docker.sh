#!/bin/bash

for target in $TARGETS; do
  ARCH=$(echo $target | sed -e 's/v8$//' -e 's/32v.*$//')
  docker build --rm \
    --build-arg TARGET=$target \
    --build-arg BIN_DIR=_dist/linux-${ARCH} \
    -t $IMAGE-$ARCH .
done
