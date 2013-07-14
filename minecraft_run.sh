#!/bin/sh
set -e

cd /opt/minecraft/
java -Xmx1024M -Xms1024M -jar minecraft_server.jar nogui
