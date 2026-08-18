#!/usr/bin/env python3
import sys, json
sys.path.insert(0,".")
from w import call, rpc
C=56
CO="0x49620e9bfd117c7b05b4732980b05b7afee60a69"
IRM="0x206e179b89c18bf077b03df4ce224a7339447a0f"
OR="0x91cb061f29c37012daa29f8e5abe180fd415d9fa"
targets={
 "fUSDT":"0xbc11091d6203500c480f0305140c687ab52b224b",
 "fBUSD":"0x5e5003e1b658a9c37660f4e6a730833b8a433047",
 "fBNB":"0x6575cfa99a00a054cc3536f7978636701498fc81",
}
def one(to,sig,outs):
    r=call(C,to,sig,[],outs)
    if isinstance(r,tuple) and len(r)==1: return r[0]
    return r
def onearg(to,sig,outs,arg):
    r=call(C,to,sig,[arg],outs)
    if isinstance(r,tuple) and len(r)==1: return r[0]
    return r
out={}
out["comptroller"]={
 "address":CO,
 "admin":one(CO,"admin()",["address"]),
 "oracle":one(CO,"oracle()",["address"]),
 "pendingAdmin":one(CO,"pendingAdmin()",["address"]),
 "comptrollerImplementation":one(CO,"comptrollerImplementation()",["address"]),
 "closeFactorMantissa":one(CO,"closeFactorMantissa()",["uint256"]),
 "liquidationIncentiveMantissa":one(CO,"liquidationIncentiveMantissa()",["uint256"]),
 "maxAssets":one(CO,"maxAssets()",["uint256"]),
 "pauseGuardian":one(CO,"pauseGuardian()",["address"]),
 "borrowCapGuardian":one(CO,"borrowCapGuardian()",["address"]),
 "transferGuardianPaused":one(CO,"transferGuardianPaused()",["bool"]),
 "seizeGuardianPaused":one(CO,"seizeGuardianPaused()",["bool"]),
 "compAddress/wing":one(CO,"getCompAddress()",["address"]),
}
out["IRM"]={
 "address":IRM,
 "owner":one(IRM,"owner()",["address"]),
 "blocksPerYear":one(IRM,"blocksPerYear()",["uint256"]),
 "baseRatePerBlock":one(IRM,"baseRatePerBlock()",["uint256"]),
 "multiplierPerBlock":one(IRM,"multiplierPerBlock()",["uint256"]),
 "jumpMultiplierPerBlock":one(IRM,"jumpMultiplierPerBlock()",["uint256"]),
 "kink":one(IRM,"kink()",["uint256"]),
}
out["oracle"]={
 "address":OR,
 "owner":one(OR,"owner()",["address"]),
 "operator":one(OR,"operator()",["address"]),
}
out["markets"]={}
for nm,a in targets.items():
    d={"address":a}
    d["symbol"]=one(a,"symbol()",["string"])
    d["name"]=one(a,"name()",["string"])
    d["decimals"]=one(a,"decimals()",["uint8"])
    und=one(a,"underlying()",["address"]) if nm!="fBNB" else None
    d["underlying"]=und
    d["implementation"]=one(a,"implementation()",["address"]) if nm!="fBNB" else "(standalone-no-impl)"
    d["admin"]=one(a,"admin()",["address"])
    d["pendingAdmin"]=one(a,"pendingAdmin()",["address"])
    d["interestRateModel"]=one(a,"interestRateModel()",["address"])
    d["reserveFactorMantissa"]=one(a,"reserveFactorMantissa()",["uint256"])
    d["totalSupply"]=one(a,"totalSupply()",["uint256"])
    d["totalBorrows"]=one(a,"totalBorrows()",["uint256"])
    d["totalReserves"]=one(a,"totalReserves()",["uint256"])
    d["getCash"]=one(a,"getCash()",["uint256"])
    d["exchangeRateStored"]=one(a,"exchangeRateStored()",["uint256"])
    d["borrowIndex"]=one(a,"borrowIndex()",["uint256"])
    d["accrualBlockNumber"]=one(a,"accrualBlockNumber()",["uint256"])
    d["borrowRatePerBlock"]=one(a,"borrowRatePerBlock()",["uint256"])
    d["supplyRatePerBlock"]=one(a,"supplyRatePerBlock()",["uint256"])
    # comptroller market info
    mk=call(C,CO,"markets(address)",[a],["bool","uint256","bool"])
    d["market_isListed/collateralFactor/isComped"]=mk
    d["borrowGuardianPaused"]=onearg(CO,"borrowGuardianPaused(address)",["bool"],a)
    d["mintGuardianPaused"]=onearg(CO,"mintGuardianPaused(address)",["bool"],a)
    d["borrowCap"]=onearg(CO,"borrowCaps(address)",["uint256"],a)
    d["supplyCap"]=onearg(CO,"supplyCaps(address)",["uint256"],a)
    # oracle price + feed keyed by underlying (fBNB uses its own; try fToken and underlying)
    if und:
        d["oracle_price_underlying"]=onearg(OR,"getUnderlyingPrice(address)",["uint256"],und)
        d["oracle_feed_underlying"]=onearg(OR,"feedRaw(address)",["address"],und) # placeholder
        # feed via raw selector 0x170eaa0f
        raw=rpc(C,"eth_call",[{"to":OR,"data":"0x170eaa0f"+"0"*24+und[2:]},"latest"])
        d["oracle_feed_underlying"]=("0x"+raw[-40:]) if isinstance(raw,str) else raw
        # underlying token real balance held by fToken (integrity vs getCash)
        d["underlying_symbol"]=onearg(und,"symbol()",["string"],und) if False else one(und,"symbol()",["string"])
        d["underlying_decimals"]=one(und,"decimals()",["uint8"])
        d["underlying_balanceOf_fToken"]=onearg(und,"balanceOf(address)",["uint256"],a)
    out["markets"][nm]=d
print(json.dumps(out,indent=2,default=str))
