#!/bin/bash

ROOT=$(pwd)
mkdir build

install_binary() {
   title=$1
   download=$2
   branch=$3

   cd build
   if [ ! -d $title ]; then
      git clone $download
   fi
   
   cd $title
   git checkout $branch
   GOBIN=$ROOT/build/binary go install -mod=readonly -trimpath ./...
   local_build_succeeded=${PIPESTATUS[0]}

   if [[ "$local_build_succeeded" == "0" ]]; then
      echo "Done" 
   else
      echo "Failed"
   fi

   cd ../..

   return $local_build_succeeded
}

build_docker() {
   title=$1
   branch=$2
   flags=$3

   echo "Building $title Docker...  "
   DOCKER_BUILDKIT=1 docker build $flags --build-arg COMMIT_HASH=$branch --tag intertravel:$title -f network/Dockerfile.$title . | true
   # PIPESTATUS tracks result code of current command
   docker_build_succeeded=${PIPESTATUS[0]}

   if [[ "$docker_build_succeeded" == "0" ]]; then
      echo "Done" 
   else
      echo "Failed"
   fi
   return $docker_build_succeeded
}

# check if docker daemon is running
if ! docker info > /dev/null 2>&1; then
   echo "Docker daemon is not running"
   exit 1
fi

install_binary aura https://github.com/nebula-labs/aura.git enable-ica
install_binary orai https://github.com/oraichain/orai.git v0.41.2
install_binary relayer https://github.com/nghuyenthevinh2000/relayer.git andrew/client_icq_stride_v3

build_docker aura enable-ica --no-cache
build_docker orai v0.41.2 --no-cache
build_docker relayer andrew/client_icq_stride_v3