#!/bin/bash

cd /opt/enterprise/dists
wget -O LATEST.new http://pluto.puppetlabs.lan/dists/LATEST 2>/dev/null 

if [ $? -ne 0 ] ; then
  echo "we lost pluto"
  exit
fi

if [ ` cat LATEST ` == ` cat LATEST.new ` ] ; then
  rm LATEST.new
  echo "got the latest already, exiting"
  exit
fi

mv LATEST.new LATEST
export LATEST=`cat LATEST`
rm puppet-enterprise*.tar
wget -O - http://pluto.puppetlabs.lan/dists 2>/dev/null | perl -e 'while (<>){ print if (s/.*(puppet-enterprise-\Q$ENV{LATEST}\E.*(?<!all)\.tar).*/$1/)}' | while read tarball ;
do wget -nc http://pluto.puppetlabs.lan/dists/${tarball} ;
done

chgrp developers LATEST puppet-enterprise-*.tar
chmod 0664 LATEST puppet-enterprise-*.tar
