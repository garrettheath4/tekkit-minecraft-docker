#!/bin/sh
echo $SERVER_OP > /minecraft/ops.txt
touch /minecraft/server.log
sleep 2
java $JAVA_ARGS -jar Tekkit.jar nogui
