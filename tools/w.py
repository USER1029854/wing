#!/usr/bin/env python3
"""Chain helper: RPC calls, selector-based eth_call with ABI decode."""
import json, urllib.request, sys, time
from eth_utils import function_signature_to_4byte_selector as _sel, keccak
from eth_abi import encode as abi_encode, decode as abi_decode

RPCS = {
 56:["https://bsc-dataseed.bnbchain.org","https://bsc-dataseed1.defibit.io","https://bsc-dataseed1.ninicoin.io","https://bsc-rpc.publicnode.com","https://bsc.drpc.org"],
 42161:["https://arbitrum-one.publicnode.com","https://arbitrum.drpc.org","https://1rpc.io/arb","https://arb1.arbitrum.io/rpc"],
}
def rpc(chain, method, params):
    body=json.dumps({"jsonrpc":"2.0","id":1,"method":method,"params":params}).encode()
    last=None
    for attempt in range(6):
        for url in RPCS[chain]:
            try:
                req=urllib.request.Request(url,data=body,headers={"Content-Type":"application/json","User-Agent":"Mozilla/5.0"})
                with urllib.request.urlopen(req,timeout=25) as r:
                    d=json.load(r)
                if "result" in d and d["result"] is not None:
                    time.sleep(0.12); return d["result"]
                last=d.get("error")
                if last and "rate" not in str(last).lower(): return {"__error__":last}
            except urllib.error.HTTPError as e:
                last=f"HTTP {e.code}"; 
            except Exception as e:
                last=str(e)
        time.sleep(0.6*(attempt+1))
    return {"__error__":last}

def sel(sig): return _sel(sig)

def _split_types(sig):
    inner=sig[sig.index("(")+1:sig.rindex(")")]
    return [t for t in _toplevel_split(inner)] if inner else []
def _toplevel_split(s):
    out=[];depth=0;cur=""
    for c in s:
        if c=="," and depth==0: out.append(cur);cur="";continue
        if c in "([": depth+=1
        if c in ")]": depth-=1
        cur+=c
    if cur:out.append(cur)
    return out

def call(chain, to, sig, args=None, out=None, block="latest"):
    args=args or []
    intypes=_split_types(sig)
    data=b""
    if "(" in sig and sig[sig.index("(")+1:sig.rindex(")")]:
        # signature with named types? assume sig is canonical like 'foo(address,uint256)'
        data=sel(sig)+abi_encode(intypes,args) if intypes else sel(sig)
    else:
        data=sel(sig)
    res=rpc(chain,"eth_call",[{"to":to,"data":"0x"+data.hex()},block])
    if isinstance(res,dict) and "__error__" in res: return ("ERROR",res["__error__"])
    if out:
        raw=bytes.fromhex(res[2:])
        try: return abi_decode(out,raw)
        except Exception as e: return ("DECODE_ERR",str(e),res)
    return res

if __name__=="__main__":
    # CLI: w.py <chain> <to> <sig> [outtypes comma] [args...]
    chain=int(sys.argv[1]); to=sys.argv[2]; sig=sys.argv[3]
    out=sys.argv[4].split(",") if len(sys.argv)>4 and sys.argv[4] else None
    args=[]
    for a in sys.argv[5:]:
        if a.startswith("0x") and len(a)==42: args.append(a)
        elif a.isdigit(): args.append(int(a))
        else: args.append(a)
    print(call(chain,to,sig,args,out))
