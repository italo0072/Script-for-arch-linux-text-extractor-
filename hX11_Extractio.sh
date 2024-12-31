#!/bin/bash

# Define la ruta temporal para la captura de preferncia dejar asi
screenshot_path="/tmp/screenshot.png"

maim -s "$screenshot_path"

if [ ! -s "$screenshot_path" ]; then
    notify-send "Error: No se generó la captura."
    exit 1
fi

texto_extraido=$(tesseract "$screenshot_path" stdout -l spa 2>/dev/null)

if [ -z "$texto_extraido" ]; then
    notify-send "Error: No se pudo extraer texto del área seleccionada."
    exit 1
fi

echo "$texto_extraido" | xclip -selection clipboard

notify-send "Texto extraído y copiado al portapapeles."
