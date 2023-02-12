#!/bin/bash

source vars.sh

# check if docker relayer is running
if ! docker ps | grep relayer > /dev/null 2>&1; then
   echo "Docker relayer is not running"
   exit 1
fi

ICA_ADDRESS=$(docker exec relayer rly query channel aura channel-1 icacontroller-test-orai.ACCOUNT --log-format json | jq -r '.channel.version' | jq -r '.address')
echo $ICA_ADDRESS