#!/usr/bin/env bash
# call.sh <chain> <addr> <selector0x> [dataSuffixHex]
chain="$1"; addr="$2"; sel="$3"; suffix="$4"
./rpc.sh "$chain" eth_call "[{\"to\":\"$addr\",\"data\":\"${sel}${suffix}\"},\"latest\"]" | jq -r '.result'
