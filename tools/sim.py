#!/usr/bin/env python3
import sys, json, urllib.request, time
from eth_utils import function_signature_to_4byte_selector as sel
from eth_abi import encode
BSC=["https://bsc-dataseed.bnbchain.org","https://bsc-dataseed1.defibit.io","https://bsc-rpc.publicnode.com"]
def call(to,data,frm=None):
    p={"to":to,"data":data}
    if frm: p["from"]=frm
    body=json.dumps({"jsonrpc":"2.0","id":1,"method":"eth_call","params":[p,"latest"]}).encode()
    last=None
    for u in BSC:
        try:
            req=urllib.request.Request(u,data=body,headers={"Content-Type":"application/json","User-Agent":"Mozilla/5.0"})
            d=json.load(urllib.request.urlopen(req,timeout=20))
            if "result" in d: return ("OK",d["result"])
            return ("REVERT", d["error"].get("message",""))
        except Exception as e:
            last=str(e); time.sleep(0.5)
    return ("ERR",last)
UNPRIV="0x1111111111111111111111111111111111111111"
ADMIN="0x90dac303c9bcf43cb6e31eedad999490670f387e"
fUSDT="0xbc11091d6203500c480f0305140c687ab52b224b"
CO="0x49620e9bfd117c7b05b4732980b05b7afee60a69"
OR="0x91cb061f29c37012daa29f8e5abe180fd415d9fa"
def cd(sig,types=None,args=None):
    s="0x"+sel(sig).hex()
    if types: s+= encode(types,args).hex()
    return s
tests=[
 # (label, to, calldata, from)
 ("fUSDT.withdrawAllToken(0) UNPRIV", fUSDT, cd("withdrawAllToken(uint256)",["uint256"],[0]), UNPRIV),
 ("fUSDT.withdrawAllToken(0) ADMIN", fUSDT, cd("withdrawAllToken(uint256)",["uint256"],[0]), ADMIN),
 ("fUSDT._setPendingAdmin(unpriv) UNPRIV", fUSDT, cd("_setPendingAdmin(address)",["address"],[UNPRIV]), UNPRIV),
 ("fUSDT._reduceReserves(1) UNPRIV", fUSDT, cd("_reduceReserves(uint256)",["uint256"],[1]), UNPRIV),
 ("fUSDT._reduceReserves(1) ADMIN", fUSDT, cd("_reduceReserves(uint256)",["uint256"],[1]), ADMIN),
 ("fUSDT.updateUnderlying(unpriv) UNPRIV", fUSDT, cd("updateUnderlying(address)",["address"],[UNPRIV]), UNPRIV),
 ("fUSDT._setInterestRateModel(unpriv) UNPRIV", fUSDT, cd("_setInterestRateModel(address)",["address"],[UNPRIV]), UNPRIV),
 ("comptroller.setInsurance(unpriv) UNPRIV", CO, cd("setInsurance(address)",["address"],[UNPRIV]), UNPRIV),
 ("comptroller._setPriceOracle(unpriv) UNPRIV", CO, cd("_setPriceOracle(address)",["address"],[UNPRIV]), UNPRIV),
 ("comptroller.setOperator(unpriv) UNPRIV", CO, cd("setOperator(address)",["address"],[UNPRIV]), UNPRIV),
 ("comptroller.pauseMarkets() UNPRIV", CO, cd("pauseMarkets()"), UNPRIV),
 ("oracle.operatorSetter 0xbcf8a99e UNPRIV", OR, "0xbcf8a99e"+"00"*64, UNPRIV),
 ("oracle.transferOwnership(unpriv) UNPRIV", OR, cd("transferOwnership(address)",["address"],[UNPRIV]), UNPRIV),
 ("oracle.updateOperator(unpriv) UNPRIV", OR, cd("updateOperator(address)",["address"],[UNPRIV]), UNPRIV),
]
for label,to,data,frm in tests:
    st,res=call(to,data,frm)
    if st=="OK": out=f"OK returned {res[:20]}{'...' if len(res)>22 else ''}"
    elif st=="REVERT": out=f"REVERT: {res}"
    else: out=f"ERR: {res}"
    print(f"{label:48s} -> {out}")
    time.sleep(0.2)
