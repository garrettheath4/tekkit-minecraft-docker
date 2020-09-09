#!/bin/sh

echo "$SERVER_OP" > /minecraft/ops.txt
sed -i.orig -e "s/^motd=.*/motd=${SERVER_MOTD:-A Tekkit Server}/" -e "s/^pvp=.*/pvp=${SERVER_PVP:-true}/" /minecraft/server.properties

touch /minecraft/server.log
tmux new-session -d -s tekkit "java $JAVA_ARGS -jar Tekkit.jar nogui"
sleep 2
tail -f /minecraft/server.log
