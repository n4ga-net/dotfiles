#!/usr/bin/env bash

# Count notifications in history
COUNT=$(dunstctl count history)

# Whether dunst is paused (Do Not Disturb)
PAUSED=$(dunstctl is-paused)

if [ "$PAUSED" = "true" ]; then
  echo "󰂛 $COUNT"
elif [ "$COUNT" -gt 0 ]; then
  echo "󰂚 $COUNT"
else
  echo "󰂜"
fi

