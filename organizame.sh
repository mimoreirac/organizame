#!/bin/bash

# Modo de uso:
# ./organizame.sh /ruta/de/un/directorio

# Directorios
DIR_POR_DEFECTO="$HOME/Downloads/"
DIR_BASE="${1:-$DIR_POR_DEFECTO}" # Si el usuario pone un directorio, opera en ese. Caso contrario opera dentro del directorio Descargas.
DIR_IMG="$HOME/Pictures/"
DIR_DOCS="$HOME/Documents/"
DIR_VIDEOS="$HOME/Videos/"

# Chequea que el directorio base exista
if [ ! -d "$DIR_BASE" ]; then
	echo "Error: El directorio $DIR_BASE no existe."
	exit 1
fi

# Crear directorios de destino si no existen
mkdir -p "$DIR_DOCS" "$DIR_IMG" "$DIR_VIDEOS"

# Mover archivos
echo "Organizando archivos en el directorio $DIR_BASE ..."

for file in "$DIR_BASE"/*; do
	if [ -f "$file" ]; then
		case "${file,,}" in
		*.jpg | *.jpeg | *.png | *.gif)
			mv "$file" "$DIR_IMG"
			;;
		*.pdf | *.doc | *.docx | *.txt)
			mv "$file" "$DIR_DOCS"
			;;
		*.mp4 | *.avi | *.mkv | *.webm)
			mv "$file" "$DIR_VIDEOS"
			;;
		esac
	fi
done

echo "Tus archivos han sido organizados!"
