#!/bin/bash

if [ -f /etc/systemd/system/discord-backend-logs-bot.service ]; then
    echo "systemd unit already installed!"
else
    sudo cp ./backend/discord-backend-logs-bot.service /etc/systemd/system/discord-backend-logs-bot.service
    sudo systemctl daemon-reload
    echo "systemd unit installed!"
fi