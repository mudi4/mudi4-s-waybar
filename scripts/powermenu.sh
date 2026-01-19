#!/bin/bash

if command -v rofi &> /dev/null; then
    # Просто используем rofi без сложных тем
    option=$(echo -e "Cancel\nLock\nLogout\nSuspend\nReboot\nShutdown" | \
        rofi -dmenu -i -p "Power")
else
    notify-send "Power Menu" "Install rofi for power menu: sudo pacman -S rofi"
    exit 0
fi

case "$option" in
    "Cancel") exit 0 ;;
    "Lock") 
        command -v swaylock && swaylock || notify-send "Lock" "swaylock not installed"
        ;;
    "Logout") hyprctl dispatch exit ;;
    "Suspend") systemctl suspend ;;
    "Reboot") systemctl reboot ;;
    "Shutdown") systemctl poweroff ;;
esac
