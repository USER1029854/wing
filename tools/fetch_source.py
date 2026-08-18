#!/usr/bin/env python3
import sys, json, os, urllib.request, urllib.parse, time

KEY="${ETHERSCAN_V2_KEY}"

def es(chainid, address):
    url = f"https://api.etherscan.io/v2/api?chainid={chainid}&module=contract&action=getsourcecode&address={address}&apikey={KEY}"
    for attempt in range(4):
        try:
            with urllib.request.urlopen(url, timeout=30) as r:
                return json.load(r)
        except Exception as e:
            time.sleep(2*(attempt+1))
    raise RuntimeError("failed")

def unpack(chainid, address, outdir):
    data = es(chainid, address)
    if data.get("status") != "1":
        print(f"  NOT OK: {data.get('message')} / {str(data.get('result'))[:80]}")
        return None
    res = data["result"][0]
    src = res.get("SourceCode","")
    name = res.get("ContractName","")
    meta = {k: res.get(k) for k in ("ContractName","CompilerVersion","OptimizationUsed","Runs","EVMVersion","LicenseType","Proxy","Implementation","ConstructorArguments")}
    os.makedirs(outdir, exist_ok=True)
    written=[]
    if src.startswith("{{") and src.endswith("}}"):
        obj = json.loads(src[1:-1])
        sources = obj.get("sources", {})
        for path, v in sources.items():
            safe = path.replace("..","__")
            fp = os.path.join(outdir, safe)
            os.makedirs(os.path.dirname(fp), exist_ok=True)
            with open(fp,"w") as f: f.write(v.get("content",""))
            written.append(safe)
    elif src.startswith("{") and '"sources"' in src:
        obj = json.loads(src)
        for path, v in obj.get("sources",{}).items():
            safe = path.replace("..","__"); fp=os.path.join(outdir,safe)
            os.makedirs(os.path.dirname(fp),exist_ok=True)
            with open(fp,"w") as f: f.write(v.get("content",""))
            written.append(safe)
    else:
        fp = os.path.join(outdir, f"{name or 'Contract'}.sol")
        with open(fp,"w") as f: f.write(src)
        written.append(os.path.basename(fp))
    with open(os.path.join(outdir,"_metadata.json"),"w") as f:
        json.dump(meta,f,indent=2)
    with open(os.path.join(outdir,"_abi.json"),"w") as f:
        f.write(res.get("ABI",""))
    print(f"  {name}: wrote {len(written)} source file(s) -> {outdir}")
    for w in written[:30]: print(f"     {w}")
    return meta

if __name__=="__main__":
    chainid, address, outdir = sys.argv[1], sys.argv[2], sys.argv[3]
    unpack(chainid, address, outdir)
