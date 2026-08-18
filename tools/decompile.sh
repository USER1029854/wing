#!/usr/bin/env bash
export PATH="$HOME/.bifrost/bin:$PATH"
cd /home/user/wing
R=./recon
decomp(){
  local bc="$1" out="$2" name="$3"
  mkdir -p "$out"
  echo "[`date +%T`] START $name ($(( ($(wc -c < $bc)-3)/2 )) bytes)"
  timeout 900 heimdall decompile "$bc" --include-sol -o "$out" -n "$name" -d --timeout 12000 >"$out/heimdall.log" 2>&1
  echo "[`date +%T`] DONE  $name rc=$? files=$(ls $out | tr '\n' ' ')"
}
