#!/usr/bin/env bash
# rpc.sh <chainid> <method> <params-json>
chain="$1"; method="$2"; params="$3"
declare -A RPCS
RPCS[56]="https://bsc-dataseed.bnbchain.org https://bsc-dataseed1.defibit.io https://bsc-dataseed1.ninicoin.io https://bsc-rpc.publicnode.com https://bsc.drpc.org"
RPCS[42161]="https://arb1.arbitrum.io/rpc https://arbitrum-one.publicnode.com https://arbitrum.drpc.org https://1rpc.io/arb"
for url in ${RPCS[$chain]}; do
  resp=$(curl -s --max-time 20 -X POST "$url" -H 'Content-Type: application/json' \
    --data "{\"jsonrpc\":\"2.0\",\"id\":1,\"method\":\"${method}\",\"params\":${params}}")
  if echo "$resp" | jq -e '.result != null' >/dev/null 2>&1; then
    echo "$resp"; exit 0
  fi
done
echo "$resp"; exit 1
