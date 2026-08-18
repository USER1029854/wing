#!/usr/bin/env bash
# Etherscan V2 helper: es.sh <chainid> <module> <action> <key=val>...
KEY="${ETHERSCAN_V2_KEY}"
chainid="$1"; module="$2"; action="$3"; shift 3
url="https://api.etherscan.io/v2/api?chainid=${chainid}&module=${module}&action=${action}&apikey=${KEY}"
for kv in "$@"; do url="${url}&${kv}"; done
curl -s "$url"
