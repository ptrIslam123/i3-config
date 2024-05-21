#!/bin/bash

# Define the layouts
LAYOUTS=("us" "ru")

# Get the current layout
CURRENT_LAYOUT=$(setxkbmap -query | grep layout | awk '{print $2}')

# Switch to the next layout in the list
for i in "${!LAYOUTS[@]}"; do
  if [[ "${LAYOUTS[$i]}" = "${CURRENT_LAYOUT}" ]]; then
    NEXT_LAYOUT_INDEX=$(( (i+1) % ${#LAYOUTS[@]} ))
    setxkbmap ${LAYOUTS[$NEXT_LAYOUT_INDEX]}
    break
  fi
done