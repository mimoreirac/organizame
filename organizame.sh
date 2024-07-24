#!/bin/bash

# Directorios
DIR_BASE="$HOME/Downloads/"
DIR_IMG="$HOME/Pictures/"
DIR_DOCS="$HOME/Documents/"
DIR_VIDEOS="$HOME/Videos/"

# Crear directorios si no existen
mkdir -p "$DIR_DOCS" "$DIR_IMG" "$DIR_VIDEOS"

# Mover archivos
mv '*.jpg' '*.png' '*.jpeg' '*.gif' "$DIR_IMG"
mv '*.pdf' '*.doc' '*.docx' '*.txt' "$DIR_DOCS"
mv '*.mp4' '*.avi' '*.mkv' "$DIR_VIDEOS"
