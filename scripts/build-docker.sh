#!/bin/bash
for target in $TARGETS; do
  ARCH=$(echo $target | sed 's/v.*$//')
  FQ_IMAGE=$IMAGE-$ARCH
  docker build --rm \
    --build-arg TARGET=$target \
    --build-arg BIN_DIR=_dist/linux-${ARCH} \
    -t $IMAGE-$ARCH .
  docker tag $IMAGE-$ARCH $MUTABLE_IMAGE
done
