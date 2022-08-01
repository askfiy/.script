#!/bin/bash

# manjaro open him if you have multiple monitors
# xrandr --output HDMI-1 --mode 2560x1080 --rate 75 --output eDP-1 --off

# arch copies it to the first line of the ~/.xinitrc file
# xrandr --output HDMI1 --mode 2560x1080 --rate 75 --output eDP1 --off


# disable touchpad for 1s while typing
syndaemon -R -i 0.5 &

# hide the cursor when using the keyboard
xbanish &

# set default speaker to built-in
pacmd set-default-sink alsa_output.pci-0000_00_1f.3-platform-skl_hda_dsp_generic.HiFi__hw_sofhdadsp__sink

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
