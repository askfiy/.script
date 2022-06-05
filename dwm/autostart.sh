#!/bin/bash

# manjaro open him if you have multiple monitors
# xrandr --output HDMI-1 --mode 2560x1080 --rate 75 --output eDP-1 --off

# arch copies it to the first line of the ~/.xinitrc file
# xrandr --output HDMI1 --mode 2560x1080 --rate 75 --output eDP1 --off

function start_running(){
  STATUS=$(ps -C $1 --no-header | wc -l)
  echo $1 $STATUS
  if [ $STATUS -eq 0 ]; then
    $1 &
  fi
}

start_running flameshot
start_running fcitx5
start_running slstatus
start_running picom
start_running /usr/local/clash/cfw
# start_running /opt/clash-for-windows-bin/cfw

./wallpaper.sh &
