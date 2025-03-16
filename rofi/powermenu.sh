#!/bin/bash

options=" Poweroff\n Reboot\n󰿅 Logout\n Lock\n Suspend\n Hibernate"

chosen=$(echo -e "$options" | rofi -dmenu -i -p "")

case "$chosen" in
    " Poweroff")
        systemctl poweroff
        ;;
    " Reboot")
        systemctl reboot
        ;;
    "󰿅 Logout")
        i3-msg exit
        ;;
    " Lock")
        i3lock -i ~/Pictures/wall.jpg
        ;;
    " Suspend")
        systemctl suspend
        ;;
    " Hibernate")
        systemctl hibernate
        ;;
esac
