#!/bin/bash

source vars.sh

echo ""
echo "FUNDING ICA ADDRESS ON ORAI"
echo ""
bash $ROOT/interaction/fund_ica_address.sh

echo ""
echo "REQUESTING ORAI TOKEN FROM AURA THROUGH ICA{IBC TRANSFER}"
echo ""
# performing ica{ibc transfer} from Aura to Orai
${BINARY[0]} tx alliance alliance-send 100000000uorai --from test --keyring-backend test --chain-id ${CHAINID[0]} --home ${DIR[0]} --yes --node ${NODE[0]}

sleep 20

echo ""
echo "HERE COMES THE CAVALRY"
echo ""
${BINARY[0]} q bank balances $AURA_1 --node ${NODE[0]} --home ${DIR[0]}