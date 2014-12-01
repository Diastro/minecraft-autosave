#!/bin/bash

# Minecraft server folder (absolute path)
cd /root/minecraft_nocheat

# Remove any existing named pipe and create a new one
rm cmdPipe
mkfifo cmdPipe

# Start minecraft
java -Xmx1024M -Xms1024M -jar minecraft_server.1.8.jar nogui <> cmdPipe &
sleep 15

while true;do
    # Loop every 10 minutes
    sleep 600

    # Save the world
    echo "/say Auto-saving world" > cmdPipe
    echo "/save-all" > cmdPipe
done
