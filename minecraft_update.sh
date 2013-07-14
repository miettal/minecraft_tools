#!/bin/sh
set -e

cd /tmp
#download
wget https://s3.amazonaws.com/MinecraftDownload/launcher/minecraft_server.jar
#if not exist minecraft
if [ ! -e /opt/minecraft/minecraft_server.jar ] ; then
  cp minecraft_server.jar /opt/minecraft/
  exit 0
fi

#compare
cmp minecraft_server.jar /opt/minecraft/minecraft_server.jar

#if not difference
if [ $? == 0 ] ; then
  exit 0
fi

#if error
if [ $? == 2 ] ; then
  exit 1
fi

#replace
cp minecraft_server.jar /opt/minecraft/

#restart
service minecraft stop
service minecraft start
