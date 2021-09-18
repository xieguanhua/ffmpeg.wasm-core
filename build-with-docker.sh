#!/bin/bash

set -euo pipefail

EM_VERSION=2.0.24

docker pull emscripten/emsdk:$EM_VERSION
docker run \
  --rm \
  -v $PWD:/src \
  -v $PWD/wasm/cache:/emsdk_portable/.data/cache/wasm \
  -e FFMPEG_ST=${FFMPEG_ST:-yes} \
  emscripten/emsdk:$EM_VERSION \
  bash ./build.sh "$@"
