#!/bin/bash

# Directorios
DIR_BASE="$HOME/Downloads/"
DIR_IMG="$HOME/Pictures/"
DIR_DOCS="$HOME/Documents/"
DIR_VIDEOS="$HOME/Videos/"

# Crear directorios si no existen
mkdir -p "$DIR_DOCS" "$DIR_IMG" "$DIR_VIDEOS"

# Mover archivos
for file in "$DIR_BASE"/*; do
	if [ -f "$file" ]; then
		case "${file,,}" in
		*.jpg | *.jpeg | *.png | *.gif)
			mv "$file" "$DIR_IMG"
			;;
		*.pdf | *.doc | *.docx | *.txt)
			mv "$file" "$DIR_DOCS"
			;;
		*.mp4 | *.avi | *.mkv)
			mv "$file" "$DIR_VIDEOS"
			;;
		esac
	fi
done
