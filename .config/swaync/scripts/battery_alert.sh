#!/bin/bash

# Obtenemos el porcentaje de batería (esto funciona en la mayoría de laptops)
LEVEL=$(cat /sys/class/power_supply/BAT0/capacity)
STATUS=$(cat /sys/class/power_supply/BAT0/status)

# Si la batería está baja y no se está cargando
if [ "$LEVEL" -le 15 ] && [ "$STATUS" = "Discharging" ]; then
    notify-send -u critical -i battery-low "Batería Crítica" "Te queda solo el $LEVEL%. ¡Enchufa el cargador!"
fi