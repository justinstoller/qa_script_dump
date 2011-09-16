#!/bin/sh
cd /Users/Higgins/checkouts/puppet-acceptance/ci/pe
( for cfg in *.cfg ; do perl -MYAML -E "use YAML; @config=YAML::LoadFile(\"${cfg}\"); die unless $config[0]; say join \"\n\", keys %{\$config[0]->{HOSTS}};" ; done ) |sort -u
