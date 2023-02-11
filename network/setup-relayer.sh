#!/bin/bash

SRC_ADDRESS=$1
DST_ADDRESS=$2

# check if ROOT empty
if [ -z "$ROOT" ]; then
    source scripts/vars.sh
fi

docker container stop relayer &>/dev/null
docker container rm relayer &>/dev/null
rm -rf $ROOT/scripts/network/config/relayer-config $ROOT/scripts/network/logs/relayer.log

relayer_config=$ROOT/scripts/network/config/relayer-config/config
relayer_logs=$ROOT/scripts/network/logs/relayer.log
relayer_exec="docker-compose -f $ROOT/scripts/network/docker-compose.yml run --rm relayer"

mkdir -p $relayer_config
# modify relayer-config.yaml to reflect the correct contract address
cp $ROOT/scripts/network/relayer-config.yaml $relayer_config/config.yaml

$relayer_exec rly keys restore fachain rly-fachain "$MNEMONIC_3" >> $relayer_logs 2>&1
$relayer_exec rly keys restore osmosis rly-osmo "$MNEMONIC_3" >> $relayer_logs 2>&1

printf "Waiting for relayer to start..."
$relayer_exec rly transact link fachain-osmosis >> $relayer_logs 2>&1

if [[ "${PIPESTATUS[0]}" = "1" ]]; then
    echo "Failed to link chains"
    exit 1
fi

docker-compose -f $ROOT/scripts/network/docker-compose.yml up -d relayer
docker-compose -f $ROOT/scripts/network/docker-compose.yml logs -f relayer | sed -r -u "s/\x1B\[([0-9]{1,3}(;[0-9]{1,2})?)?[mGK]//g" >> $relayer_logs 2>&1 &

echo "Done"

# quick commands
# ./build/binary/aurad tx ibc-transfer transfer transfer channel-0 osmo15hh4c5dzwdy6alx6uzc5c2hzd3eu2dn2588m70 1000000000ujuno --from test1 --keyring-backend test --home scripts/network/config/juno --chain-id test-juno --fees 100000ujuno --yes --node tcp://localhost:26657
# ./build/binary/oraid tx gamm create-pool --pool-file scripts/network/juno-osmosis-pool.json --from test1 --keyring-backend test --home scripts/network/config/osmosis --chain-id test-osmo --fees 100000uosmo --yes --node tcp://localhost:26357