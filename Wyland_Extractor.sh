#!/bin/bash
if ! command -v flameshot &> /dev/null; then
    notify-send "Flameshot no está instalado. Instalando..."
    sudo pacman -S flameshot
    exit 1
fi

if ! command -v tesseract &> /dev/null; then
    notify-send "Tesseract no está instalado. Instalando..."
    sudo pacman -S tesseract
    exit 1
fi

flameshot gui --raw > /tmp/screenshot.png

# Define la ruta temporal para la captura de preferncia dejar asi
if [ ! -f /tmp/screenshot.png ]; then
    notify-send "Error: No se pudo tomar la captura de pantalla."
    exit 1
fi

tesseract /tmp/screenshot.png stdout -l spa > /tmp/extracted_text.txt

if [ ! -s /tmp/extracted_text.txt ]; then
    notify-send "Error: No se pudo extraer texto de la imagen."
    exit 1
fi

cat /tmp/extracted_text.txt | xclip -selection clipboard

notify-send "Texto extraído y copiado al portapapeles."
