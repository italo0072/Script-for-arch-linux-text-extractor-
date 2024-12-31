#!/bin/bash

# Define la ruta temporal para la captura
screenshot_path="/tmp/screenshot.png"

# Inicia la selección del área y guarda automáticamente la captura
maim -s "$screenshot_path"

# Verificar si se creó correctamente la captura
if [ ! -s "$screenshot_path" ]; then
    notify-send "Error: No se generó la captura."
    exit 1
fi

# Extraer texto de la captura usando Tesseract
texto_extraido=$(tesseract "$screenshot_path" stdout -l spa 2>/dev/null)

# Verificar si Tesseract devolvió texto
if [ -z "$texto_extraido" ]; then
    notify-send "Error: No se pudo extraer texto del área seleccionada."
    exit 1
fi

# Copiar el texto al portapapeles automáticamente
echo "$texto_extraido" | xclip -selection clipboard

# Notificación de éxito
notify-send "Texto extraído y copiado al portapapeles."
