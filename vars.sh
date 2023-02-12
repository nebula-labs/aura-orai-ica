#!/bin/bash

export ROOT=$(pwd)

export MNEMONIC_1="dry repeat crush category laugh proud pretty crew record crash neglect road valley soon solution flat poet fantasy space resist april owner ship business"
export MNEMONIC_2="supreme era pool truth shop essay source wall steel rely local wing convince enact champion warm food grunt siege obey kiss crane squeeze original"
export MNEMONIC_3="confirm select whale obtain toe fortune wisdom truck hospital cement spring when idea cupboard machine glory mouse kitchen moral fiber bomb rabbit fog raven"

export AURA_1=aura1xrj7hrjg86fdd9ct7j4dluusgd6geghhewassh
export AURA_2=aura15hh4c5dzwdy6alx6uzc5c2hzd3eu2dn282rf2y

export ORAI_1=orai1xrj7hrjg86fdd9ct7j4dluusgd6geghh3tu3na
export ORAI_2=orai15hh4c5dzwdy6alx6uzc5c2hzd3eu2dn200zgfw

# Aura, Orai
export BINARY=( "$ROOT/build/binary/aurad" "$ROOT/build/binary/oraid" )
export DIR=( "$ROOT/network/config/aura" "$ROOT/network/config/orai" )
export DENOMS=( "uaura" "uorai" )
export NODE=( "http://localhost:26657" "http://localhost:26357" )
export CHAINID=( "test-aura" "test-orai" )