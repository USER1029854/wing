#!/usr/bin/env python3
"""Extract embedded constants from EVM runtime bytecode:
   PUSH20 -> candidate addresses; PUSH32 -> 32-byte words (hashes/keys/masks);
   ASCII strings (revert messages). Save as a report."""
import sys, re, collections
def load(path):
    h=open(path).read().strip()
    if h.startswith("0x"): h=h[2:]
    return bytes.fromhex(h)
def push_scan(code):
    addrs=collections.Counter(); words=collections.Counter(); sels=collections.Counter()
    i=0; n=len(code)
    while i<n:
        op=code[i]
        if 0x60<=op<=0x7f:
            ln=op-0x5f
            data=code[i+1:i+1+ln]
            if ln==20:
                a="0x"+data.hex()
                if int.from_bytes(data,'big')!=0: addrs[a]+=1
            elif ln==32:
                v=int.from_bytes(data,'big')
                # skip small ints and obvious bit-masks like 0xffff...
                hx=data.hex()
                is_mask = re.fullmatch(r'f*0*', hx) or re.fullmatch(r'0*f*', hx)
                if v>0x0100000000 and not is_mask:
                    words["0x"+hx]+=1
            elif ln==4:
                sels["0x"+data.hex()]+=1
            i+=1+ln
        else:
            i+=1
    return addrs,words,sels
def strings(code):
    out=set()
    cur=b""
    for b in code:
        if 32<=b<127: cur+=bytes([b])
        else:
            if len(cur)>=5: out.add(cur.decode('ascii','ignore'))
            cur=b""
    if len(cur)>=5: out.add(cur.decode('ascii','ignore'))
    return sorted(out)
if __name__=="__main__":
    path=sys.argv[1]; code=load(path)
    addrs,words,sels=push_scan(code)
    print(f"# Constants extracted from {path}")
    print(f"# runtime size: {len(code)} bytes\n")
    print("## Candidate embedded ADDRESSES (PUSH20, nonzero):")
    for a,c in addrs.most_common(): print(f"  {a}   (x{c})")
    if not addrs: print("  (none)")
    print("\n## Candidate 32-byte CONSTANTS (PUSH32, >2^32, non-mask) — possible hashes/keys/salts:")
    for w,c in words.most_common(): print(f"  {w}   (x{c})")
    if not words: print("  (none)")
    print("\n## Embedded ASCII strings (len>=5):")
    for s in strings(code):
        if s.strip(): print(f"  {repr(s)}")
