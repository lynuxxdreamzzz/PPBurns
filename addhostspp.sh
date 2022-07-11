#!/bin/bash
groupname="RiotGamesClient"
currenthostsfile="/var/ipfire/fwhosts/customhosts"
addhostsfile="hosts"
currentgroupsfile="/var/ipfire/fwhosts/customgroups"
sudo chown boomshakalaka $currenthostsfile
sudo chown boomshakalaka $currentgroupsfile
cp $currenthostsfile "$currenthostsfile.old"
cp $currentgroupsfile "$currentgroupsfile.old"
currenthosts=$(cat $currenthostsfile)
addhosts=$(cat $addhostsfile)
currentgroups=$(cat $currentgroupsfile)
prefixhostname="RGC"
IFS=$'\n'
gethighhostid () {
    local highhost=0
    for hostie in $1
do
    highhostcheck=$(echo $hostie | grep -oP '^([^,]+)')
    if test $highhostcheck -gt $highhost
    then
            highhost=$(echo $highhostcheck)
    fi
done
return $highhost
}
gethighhostid "$currenthosts"
newhostid=$?
((newhostid++))
for host in $addhosts
do
    newhostline="$newhostid,$prefixhostname $host,ip,$host/255.255.255.255"
    echo $newhostline >> $currenthostsfile
    ((newhostid++))
done
gethighhostid "$currentgroups"
newgroupid=$?
((newgroupid++))
for host in $addhosts
do
    newgroupline="$newgroupid,$groupname,,$prefixhostname $host,Custom Host"
    echo $newgroupline >> $currentgroupsfile
    ((newgroupid++))
done
sudo chown nobody $currentgroupsfile
sudo chown nobody $currenthostsfile
