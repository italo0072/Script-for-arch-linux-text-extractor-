#!/bin/bash
# Verificar que Flameshot esté instalado
if ! command -v flameshot &> /dev/null; then
    notify-send "Flameshot no está instalado. Instalando..."
    sudo pacman -S flameshot
    exit 1
fi

# Verificar que Tesseract esté instalado
if ! command -v tesseract &> /dev/null; then
    notify-send "Tesseract no está instalado. Instalando..."
    sudo pacman -S tesseract
    exit 1
fi

# Tomar una captura de pantalla usando Flameshot
flameshot gui --raw > /tmp/screenshot.png

# Verificar si la captura se realizó
if [ ! -f /tmp/screenshot.png ]; then
    notify-send "Error: No se pudo tomar la captura de pantalla."
    exit 1
fi

# Usar Tesseract para extraer texto de la imagen
tesseract /tmp/screenshot.png stdout -l spa > /tmp/extracted_text.txt

# Verificar si Tesseract extrajo texto
if [ ! -s /tmp/extracted_text.txt ]; then
    notify-send "Error: No se pudo extraer texto de la imagen."
    exit 1
fi

# Copiar el texto extraído al portapapeles
cat /tmp/extracted_text.txt | xclip -selection clipboard

# Mostrar una notificación de éxito
notify-send "Texto extraído y copiado al portapapeles."
