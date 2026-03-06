#!/bin/bash

THEME=$(ls ~/.config/hypr/themes | rofi -dmenu -p "󰔎 Select Theme")

[ -z "$THEME" ] && exit 0

# Fondo animado
swww img ~/Imágenes/wallpapers/$THEME.jpg --transition-type grow --transition-duration 1

# Waybar
ln -sf ~/.config/waybar/themes/$THEME/config.jsonc ~/.config/waybar/config.jsonc
ln -sf ~/.config/waybar/themes/$THEME/style.css ~/.config/waybar/style.css
pkill waybar && waybar &

# Rofi
ln -sf ~/.config/rofi/themes/$THEME.rasi ~/.config/rofi/actual_theme.rasi

# Kitty
ln -sf ~/.config/hypr/themes/$THEME/kitty.conf ~/.config/kitty/kitty.conf
pkill kitty

#hyprland
ln -sf ~/.config/hypr/themes/$THEME/theme.conf ~/.config/hypr/actual_theme.conf

#swaync
ln -sf ~/.config/swaync/themes/$THEME/config.json ~/.config/swaync/config.json
ln -sf ~/.config/swaync/themes/$THEME/style.css ~/.config/swaync/style.css

# SwayNC lee los nuevos archivos inmediatamente
swaync-client -R
swaync-client -rs

# Starship (Prompt de la terminal)
ln -sf ~/.config/hypr/themes/$THEME/starship.toml ~/.config/starship.toml

swaync-client -R
swaync-client -rs
sleep 0.5 
notify-send "Tema Aplicado" "Cambiado a <b>$THEME</b>"