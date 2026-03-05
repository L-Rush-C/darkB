#!/bin/bash
playerctl --follow metadata --format '{{ title }}' | while read -r line; do
    ~/.config/swaync/scripts/spotify_notify.sh
done