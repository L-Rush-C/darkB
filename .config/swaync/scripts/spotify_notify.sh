#!/bin/bash

# Carpeta para archivos temporales
COVER_PATH="/tmp/spotify_cover.png"
LAST_SONG_FILE="/tmp/last_spotify_song.txt"

# 1. FILTRO DE SEGURIDAD: Solo si Spotify existe
PLAYER=$(playerctl -l | grep -i "spotify")
if [ -z "$PLAYER" ]; then
    exit 0
fi

# 2. Obtener info actual de Spotify
TITLE=$(playerctl -p spotify metadata title)
ARTIST=$(playerctl -p spotify metadata artist)
COVER_URL=$(playerctl -p spotify metadata mpris:artUrl)

# Si no hay título, salimos
[ -z "$TITLE" ] && exit 0

# 3. CONTROL DE REPETICIÓN
# Creamos un identificador único para la canción actual
CURRENT_ID="$TITLE - $ARTIST"

# Leemos cuál fue la última canción anunciada
if [ -f "$LAST_SONG_FILE" ]; then
    LAST_ID=$(cat "$LAST_SONG_FILE")
else
    LAST_ID=""
fi

# Si la canción es la misma que la anterior, NO mandamos notificación
# Pero SÍ actualizamos el CSS por si acaso (para el widget MPRIS)
if [ "$CURRENT_ID" == "$LAST_ID" ]; then
    # Opcional: Solo refrescar el estilo si quieres que el fondo del widget se mantenga
    swaync-client -rs
    exit 0
fi

# 4. Si llegamos aquí, es una CANCIÓN NUEVA. Guardamos el ID.
echo "$CURRENT_ID" > "$LAST_SONG_FILE"

# 5. Manejo de la imagen y Notificación
if [ -z "$COVER_URL" ]; then
    notify-send -i spotify -h string:x-canonical-private-synchronous:spotify "Escuchando ahora" "<b>$TITLE</b>\n<i>$ARTIST</i>"
else
    if [[ "$COVER_URL" == file://* ]]; then
        cp "${COVER_URL#file://}" "$COVER_PATH"
    else
        curl -s "$COVER_URL" -o "$COVER_PATH"
    fi
    notify-send -i "$COVER_PATH" -h string:x-canonical-private-synchronous:spotify "Escuchando ahora" "<b>$TITLE</b>\n<i>$ARTIST</i>"
fi

# 6. Actualizar el widget de SwayNC
sleep 0.2
swaync-client -rs