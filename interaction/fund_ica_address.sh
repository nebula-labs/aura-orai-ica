#!/bin/bash

source vars.sh

ICA_ADDRESS=$(bash $ROOT/interaction/get_ica_address.sh)
echo $ICA_ADDRESS

${BINARY[1]} tx send $ORAI_1 $ICA_ADDRESS 1000000000uorai --keyring-backend test --chain-id ${CHAINID[1]} --home ${DIR[1]} --yes --node ${NODE[1]}

sleep 10

${BINARY[1]} query bank balances "$ICA_ADDRESS" --node ${NODE[1]} --home ${DIR[1]}