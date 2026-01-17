#!/usr/bin/env bash
set -euo pipefail

# Directories
VIDEOS_DIR="$HOME/Wallpapers/Videos"
PICTURES_DIR="$HOME/Wallpapers/Pictures"

# Symlinks für aktuellen Wallpaper und Screenshot
CURRENT_VIDEO_LINK="$HOME/.config/current/Wallpapers/Video.mp4"
CURRENT_PICTURE_LINK="$HOME/.config/current/Wallpapers/Picture.png"

# Liste aller Videos (sortiert)
mapfile -d '' -t VIDEOS < <(find "$VIDEOS_DIR" -type f -print0 | sort -z)
TOTAL=${#VIDEOS[@]}

if [[ $TOTAL -eq 0 ]]; then
   notify-send "No videos found for wallpaper cycling" -t 2000
   pkill mpvpaper
   swaybg --color '#000000' >/dev/null 2>&1 &
   exit 1
fi

# Aktuelles Video aus Symlink lesen
if [[ -L "$CURRENT_VIDEO_LINK" ]]; then
   CURRENT_VIDEO=$(readlink "$CURRENT_VIDEO_LINK")
else
   CURRENT_VIDEO=""
fi

# Index des aktuellen Videos finden
INDEX=-1
for i in "${!VIDEOS[@]}"; do
   if [[ "${VIDEOS[$i]}" == "$CURRENT_VIDEO" ]]; then
      INDEX=$i
      break
   fi
done

# Nächstes Video bestimmen (Wrap-around)
if [[ $INDEX -eq -1 ]]; then
   NEW_VIDEO="${VIDEOS[0]}"
else
   NEXT_INDEX=$(((INDEX + 1) % TOTAL))
   NEW_VIDEO="${VIDEOS[$NEXT_INDEX]}"
fi

# Passendes Bild suchen (gleicher Dateiname, andere Endung)
BASENAME=$(basename "$NEW_VIDEO")
BASENAME="${BASENAME%.*}"
NEW_PICTURE="$PICTURES_DIR/$BASENAME.png"

if [[ ! -f "$NEW_PICTURE" ]]; then
   notify-send "No matching picture found for $BASENAME" -t 2000
fi

# Symlinks aktualisieren
ln -nsf "$NEW_VIDEO" "$CURRENT_VIDEO_LINK"
ln -nsf "$NEW_PICTURE" "$CURRENT_PICTURE_LINK"

# mpvpaper neu starten mit Video
pkill swaybg || true
pkill hyprpaper || true
pkill mpvpaper || true
sleep 0.5

outputs=(HDMI-A-1 DP-1 DP-2 DP-3)
for output in "${outputs[@]}"; do
    mpvpaper --mpv-options="hwdec=no" -f "$output" "$CURRENT_VIDEO_LINK" &
done
# wal Farben laden aus Bild
wal -i "$CURRENT_PICTURE_LINK" -n --saturate 0.7 -q -o ~/.local/share/custom/bin/wal-color-export.sh -b 010101
