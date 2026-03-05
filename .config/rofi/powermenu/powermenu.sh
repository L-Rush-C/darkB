#!/usr/bin/env bash

# Opciones
# Opciones compatibles con JetBrainsMono Nerd Font
#hibernate=''
shutdown=''
reboot=''
lock=''
#suspend=''
logout=''
yes=''
no=''

# Variable para pasar a rofi
options="$lock\n$logout\n$shutdown\n$reboot"
#\n$suspend\n$hibernate
chosen="$(echo -e "$options" | rofi -dmenu -i -theme ~/.config/rofi/powermenu/style.rasi)"

case $chosen in
    $lock)
        hyprlock ;;
    $logout)
        hyprctl dispatch exit ;;
    $shutdown)
        systemctl poweroff ;;
    $reboot)
        systemctl reboot ;;
    "")
        # Si presionas Escape o cierras Rofi, no hace nada y sale limpio
        exit 0 ;;
    *)
        # Cualquier otra cosa no definida tampoco hace nada
        exit 0 ;;
esac