# darkB - Hyprland Dotfiles
---
## Previews


![Escritorio Principal](preview/cap1.png)
![Escritorio Principal](preview/cap2.png)
![Escritorio Principal](preview/cap4.png)
![Escritorio Principal](preview/cap3.png)

---

## Gestión Dinámica de Temas (Symlinks)

Este repositorio utiliza un sistema de **enlaces simbólicos (symlinks)** gestionado por el script `~/.config/hypr/scripts/theme-menu.sh`. Esto permite cambiar el estilo visual de todo el sistema al instante mediante un menú de Rofi.

### ¿Cómo funciona el script?
El script no copia archivos, sino que crea "punteros". Toma los archivos originales guardados en las carpetas de temas y los vincula a la ruta donde cada programa busca su configuración:

| Componente | Archivo Original (Fuente) | Enlace Simbólico (Destino) |
| :--- | :--- | :--- |
| **Waybar** | `~/.config/waybar/themes/$THEME/` | `~/.config/waybar/config.jsonc` |
| **Rofi** | `~/.config/rofi/themes/$THEME.rasi` | `~/.config/rofi/actual_theme.rasi` |
| **Kitty** | `~/.config/hypr/themes/$THEME/kitty.conf` | `~/.config/kitty/kitty.conf` |
| **Hyprland** | `~/.config/hypr/themes/$THEME/theme.conf` | `~/.config/hypr/actual_theme.conf` |
| **SwayNC** | `~/.config/swaync/themes/$THEME/` | `~/.config/swaync/config.json` |
| **Starship** | `~/.config/hypr/themes/$THEME/starship.toml` | `~/.config/starship.toml` |

---

### Requisitos para el cambio de tema
Para que el script funcione correctamente sin errores, asegúrate de cumplir lo siguiente:

1. **Wallpapers:** Los fondos deben estar en `~/Imágenes/wallpapers/` y tener el **mismo nombre** que el tema (ej: `darkB.jpg`).
2. **Estructura:** No borres las carpetas dentro de `themes/`, ya que el script las busca para crear los enlaces.
3. **Recarga:** El script reinicia automáticamente `Waybar` y `SwayNC` para aplicar los cambios sin cerrar sesión.

---

## Componentes

Estos son los programas principales:

* **WM:** [Hyprland](https://hyprland.org/) (Wayland Compositor)
* **Barra:** `Waybar` (Configuración personalizada)
* **Terminal:** `Kitty`
* **Lanzador:** `Rofi` (Versión Wayland)
* **Fondo de Pantalla:** `swww`
* **Notificaciones:** `SwayNC`
* **System Fetch:** `Fastfetch`

---

1. **Clona el repositorio:**
   ```bash
   git clone https://github.com/L-Rush-C/darkB.git
   cd darkB

2. **Copia las configuraciones:**
   ```bash
   cp -r .config/* ~/.config/

3. **Da permisos de ejecución a los scripts:**
   ```bash
   chmod +x ~/.config/hypr/scripts/*.sh


---

> [!IMPORTANT]
> **Estado del proyecto:** El dotfile aún está en desarrollo. Es posible que algunas rutas o archivos cambien en los próximos días.
