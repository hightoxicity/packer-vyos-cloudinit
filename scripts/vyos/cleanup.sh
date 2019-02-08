#!/bin/bash

set -e
set -x

WRAPPER=/opt/vyatta/sbin/vyatta-cfg-cmd-wrapper

# Remove the hardware ID for the ethernet device
$WRAPPER begin
$WRAPPER set interfaces ethernet eth1 address dhcp
$WRAPPER set interfaces ethernet eth2 address dhcp
$WRAPPER set interfaces ethernet eth3 address dhcp
$WRAPPER delete interfaces ethernet eth0 hw-id
$WRAPPER delete interfaces ethernet eth1 hw-id
$WRAPPER delete interfaces ethernet eth2 hw-id
$WRAPPER delete interfaces ethernet eth3 hw-id
$WRAPPER commit
$WRAPPER save
$WRAPPER end

$WRAPPER show interfaces

sudo aptitude -y clean
