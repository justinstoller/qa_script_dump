#!/opt/local/bin/perl
# don't forget to ssh-add the root key for these servers
# ssh-add ssh_keys_vms/id_vms_rsa
use strict;
use warnings;
use 5.12.0;

use Config::IniFiles;

my $cfg = new Config::IniFiles -file => 'STDIN';
for my $repo ($cfg->Sections){
say $repo;
say $cfg->val($repo, 'baseurl');
}
