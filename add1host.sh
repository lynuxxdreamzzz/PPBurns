#!/bin/bash
read -p "Group Name: " groupname
#groupname="RiotGamesClient"
read -p "Prefix for CustomHostName: " prefixhostname
currenthostsfile="/var/ipfire/fwhosts/customhosts"
#addhostsfile="hosts"
currentgroupsfile="/var/ipfire/fwhosts/customgroups"
sudo chown boomshakalaka $currenthostsfile
sudo chown boomshakalaka $currentgroupsfile
#cp $currenthostsfile "$currenthostsfile.old"
#cp $currentgroupsfile "$currentgroupsfile.old"
currenthosts=$(cat $currenthostsfile)
#addhosts=$(cat $addhostsfile)
currentgroups=$(cat $currentgroupsfile)
#prefixhostname="RGC"
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
add1host () {
    newhostline="$newhostid,$prefixhostname $1,ip,$1/255.255.255.255"
    newgroupline="$newgroupid,$groupname,,$prefixhostname $1,Custom Host"
    echo -e "$examplehost\n$newhostline\n$examplegroup\n$newgroupline"
    read -p "Good or na?" checkformat
    if test $checkformat != 'na'
    then
        echo $newhostline >> $currenthostsfile
        echo $newgroupline >> $currentgroupsfile
        ((newhostid++))
        ((newgroupid++))
    fi
}
add1grphost () {
    read -p "$newgroupline---good-na?" checkformat

}
gethighhostid "$currenthosts"
newhostid=$?
((newhostid++))
examplehost=$hostie
gethighhostid "$currentgroups"
newgroupid=$?
((newgroupid++))
examplegroup=$hostie
ipaddr='gogogo'
while [ "$ipaddr" != "xit" ]
do
read -p "IP Address (xit2quit): " ipaddr
if [ "$ipaddr" != "xit" ]
then
    add1host $ipaddr
fi
done
sudo chown nobody $currentgroupsfile
sudo chown nobody $currenthostsfile
#for hostie in $currenthosts
#do
#    highhostcheck=$(echo $hostie | grep -oP '^([^,]+)')
#    if test $highhostcheck -gt $currenthighhostid
#    then
#            currenthighhostid=$(echo $highhostcheck)
#    fi
#done
