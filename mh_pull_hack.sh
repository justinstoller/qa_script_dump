#!/bin/sh

wget -O LATEST.new http://pluto.puppetlabs.lan/dists/LATEST 2>/dev/null 

if [ $( cat LATEST ) == $( cat LATEST.new ) ] ; then
echo "got the latest already, exiting"; exit ;
fi
mv LATEST.new LATEST
export LATEST=`cat LATEST`
wget -O - http://pluto.puppetlabs.lan/dists 2>/dev/null | perl -e 'while (<>){ print if (s/.*(puppet-enterprise-\Q$ENV{LATEST}\E.*(?<!all)\.tar).*/$1/)}' | while read tarball ;
do wget -nc http://pluto.puppetlabs.lan/dists/${tarball} ;
done
