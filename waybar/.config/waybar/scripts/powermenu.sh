#!/usr/bin/env bash

# Toggle: if rofi is already running, kill it and exit
if pgrep -x rofi > /dev/null; then
    pkill -x rofi
    exit 0
fi

options=" Shutdown\n Reboot\n Suspend\n Hibernate\n Logout"

choice=$(echo -e "$options" | rofi -dmenu \
    -p "" \
    -no-custom \
    -me-select-entry '' \
    -me-accept-entry 'MousePrimary' \
    -theme-str '
      window { 
        location: northwest; 
        anchor: northwest;
        x-offset: 5px;
        y-offset: 3px;
        width: 200px; 
        border-radius: 6px;
        border: 1px;
        border-color: #5e81ac;
        padding: 0;
      }
      mainbox {
        padding: 0;
      }
      inputbar { enabled: false; }
      listview { 
        lines: 5;
        border: 0;
        padding: 8px;
        border-radius: 6px;
      }
    ')


case "$choice" in
    *Shutdown) systemctl poweroff ;;
    *Reboot) systemctl reboot ;;
    *Suspend) systemctl suspend ;;
    *Hibernate) systemctl hibernate ;;
    *Logout) loginctl terminate-user "$USER" ;;
esac

