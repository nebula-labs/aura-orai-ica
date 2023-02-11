#!/bin/bash

source scripts/vars.sh
cd scripts/network

start_docker() {
    name=$1

    docker-compose up -d $name
    docker-compose logs -f $name | sed -r -u "s/\x1B\[([0-9]{1,3}(;[0-9]{1,2})?)?[mGK]//g" > logs/$name.log 2>&1 &

    printf "Waiting for $name to start..."

    ( tail -f -n0 logs/$name.log & ) | grep -q "finalizing commit of block"
    echo "Done"
}

# cleanup any stale state
docker-compose down
rm -rf config logs
mkdir logs

# init chain
bash init-chain.sh $ROOT/build/binary/fachaind ufac $ROOT/scripts/network/config/fachain
bash init-chain.sh $ROOT/build/binary/osmosisd uosmo $ROOT/scripts/network/config/osmosis

# start docker
start_docker fachain
start_docker osmosis

# start relayer
bash setup-relayer.sh

# ibc-transfer osmo to fachain
${BINARY[1]} tx ibc-transfer transfer transfer channel-0 $FACHAIN_2 1000000000uosmo --from test1 --keyring-backend test --home ${DIR[1]} --chain-id test-osmo --fees 100000uosmo --yes --node ${NODE[1]}

# setup pool on osmosis
${BINARY[0]} tx ibc-transfer transfer transfer channel-0 $OSMO_2 1000000000ufac --from test1 --keyring-backend test --home ${DIR[0]} --chain-id test-fac --fees 100000ufac --yes --node ${NODE[0]}

sleep 15

cd ../..