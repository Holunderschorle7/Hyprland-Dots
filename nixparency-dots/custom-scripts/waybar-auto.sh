#!/usr/bin/env bash

bar_visible=true
trap "exit" SIGINT SIGTERM
waybar -c ~/.config/waybar/min.jsonc -s ~/.config/waybar/min.css >/dev/null 2>&1 &
while true; do
   Y=$(hyprctl cursorpos -j | jq '.y' 2>/dev/null)
   [[ -z "$Y" ]] && sleep 0.1 && continue

   if ((Y <= 5)) && $bar_visible; then
      sleep 0.4
      y=$(hyprctl cursorpos -j | jq '.y' 2>/dev/null)
      [[ -z "$y" ]] && sleep 0.1 && continue

      if ((y <= 5)); then
         waybar -c ~/.config/waybar/max.jsonc -s ~/.config/waybar/max.css >/dev/null 2>&1 &
         pkill -f "$HOME/.config/waybar/min.css"
         bar_visible=false
      fi
   elif ((Y > 40)) && ! $bar_visible; then

      pkill -f "$HOME/.config/waybar/max.css"
      waybar -c ~/.config/waybar/min.jsonc -s ~/.config/waybar/min.css >/dev/null 2>&1 &
      bar_visible=true
   fi

   sleep 0.1
done
