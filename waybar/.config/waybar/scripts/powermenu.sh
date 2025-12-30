#!/usr/bin/env bash

options=" Shutdown\n Reboot\n Suspend\n Hibernate\n Logout"

choice=$(echo -e "$options" | rofi -dmenu -p "Power" \
  -location 1 \
  -xoffset 10 \
  -yoffset 40)


case "$choice" in
    *Shutdown) systemctl poweroff ;;
    *Reboot) systemctl reboot ;;
    *Suspend) systemctl suspend ;;
    *Hibernate) systemctl hibernate ;;
    *Logout) loginctl terminate-user "$USER" ;;
esac

