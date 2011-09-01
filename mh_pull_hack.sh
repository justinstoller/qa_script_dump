#!/bin/sh
wget -O LATEST http://pluto.puppetlabs.lan/dists/LATEST 2>/dev/null 
export LATEST=`cat LATEST`
wget -O - http://pluto.puppetlabs.lan/dists 2>/dev/null | perl -e 'while (<>){ print if (s/.*(puppet-enterprise-\Q$ENV{LATEST}\E.*.tar).*/$1/)}' | while read tarball ;
do echo wget http://pluto.puppetlabs.lan/dists/${tarball} ;
done
