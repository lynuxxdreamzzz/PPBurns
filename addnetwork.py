import os
from pathlib import Path

def fo():
    filein=input("Enter filepath: ")
    filep=Path(filein)
    f=open(filep)
    return f

def lst2f(lst):
    filein=input("Enter filepath: ")
    filep=Path(filein)
    f=open(filep,'w')
    f.writelines(lst)
    f.close()

def gEThIGHid(list):
    highid=0
    for thing in list:
        pieces=thing.split(',')
        if (pieces[0]>highid):
            highid=pieces[0]
    return highid

def tOcUSTOMgROUP(ipaddr):

def cIDRtOnETMASK(cidr):
    ip=[255,255,255,255]
    while(cidr>0):
        octet=cidr//8
        counter=(8-(cidr%8))
    
    for fruit in range(31,cidr,-1):
        octet=(fruit//8)
        counter=(8-(fruit%8))
        if (counter!=0):
            num=1
            for i in range(1,counter+1,1):
                num=(num*2+1)
            ip[octet]-=num
    netmask=""
    for i in ip:
        netmask+=str(i)+'.'
    netmask=netmask[:-1]
    return netmask
        


def tOcUSTOMnETWORKS(highid,netname,ipaddr,netmask):
    newline="{},{},{},{}".format(highid,netname,ipaddr,netmask)
    
