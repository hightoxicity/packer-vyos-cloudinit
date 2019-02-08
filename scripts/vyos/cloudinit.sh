#!/bin/bash

set -e
set -x

curl -L https://github.com/vyos/vyos-cloudinit/releases/download/v0.3.2/vyos-cloudinit_0.3.2_all.deb > /tmp/cloudinit.deb
sudo dpkg -i /tmp/cloudinit.deb

rm -rf /tmp/cloudinit.deb

WRAPPER=/opt/vyatta/sbin/vyatta-cfg-cmd-wrapper

$WRAPPER begin
$WRAPPER set service cloudinit environment ec2
$WRAPPER commit
$WRAPPER save
$WRAPPER end
