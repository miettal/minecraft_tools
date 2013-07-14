#!/bin/sh
set -e

mkdir -p /opt/minecraft

#copy files
cp minecraft /etc/init.d/
cp minecraft_update.sh /opt/minecraft/
cp minecraft_run.sh /opt/minecraft/

#set config for autostart
update-rc.d minecraft defaults 99 1

#download minecraft
./minecraft_update.sh

#print message
echo "Plsease add to crontab\n\t0 6 * * * /opt/minecraft/minecraft_update.sh"
