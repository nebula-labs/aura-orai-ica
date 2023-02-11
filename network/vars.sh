#!/bin/bash

export ROOT=$(pwd)

export MNEMONIC_1="dry repeat crush category laugh proud pretty crew record crash neglect road valley soon solution flat poet fantasy space resist april owner ship business"
export MNEMONIC_2="supreme era pool truth shop essay source wall steel rely local wing convince enact champion warm food grunt siege obey kiss crane squeeze original"
export MNEMONIC_3="confirm select whale obtain toe fortune wisdom truck hospital cement spring when idea cupboard machine glory mouse kitchen moral fiber bomb rabbit fog raven"

export FACHAIN_1=fac1xrj7hrjg86fdd9ct7j4dluusgd6geghheqtd25
export FACHAIN_2=fac15hh4c5dzwdy6alx6uzc5c2hzd3eu2dn28y45s8

export OSMO_1=osmo1xrj7hrjg86fdd9ct7j4dluusgd6geghh2rezyu
export OSMO_2=osmo15hh4c5dzwdy6alx6uzc5c2hzd3eu2dn2588m70

# Fachain, Osmosis
export BINARY=( "$ROOT/build/binary/fachaind" "$ROOT/build/binary/osmosisd" )
export DIR=( "$ROOT/scripts/network/config/fachain" "$ROOT/scripts/network/config/osmosis" )
export DENOMS=( "ufac" "uosmo" )
export NODE=( "http://localhost:26457" "http://localhost:26357" )
export CHAINID=( "test-fac" "test-osmo" )

# export cross-chain contract addresses
export SWAPROUTER_CONTRACT=osmo14hj2tavq8fpesdwxxcu44rty3hh90vhujrvcmstl4zr3txmfvw9sq2r9g9
export CROSSCHAIN_CONTRACT=osmo1nc5tatafv6eyq7llkr2gv50ff9e22mnf70qgjlv737ktmt4eswrqvlx82r