#!/bin/bash

# Modo de uso:
# ./organizame.sh /ruta/de/un/directorio

# Directorios
DIR_POR_DEFECTO="$HOME/Downloads"
DIR_BASE="${1:-$DIR_POR_DEFECTO}" # Si el usuario pone un directorio, opera en ese. Caso contrario opera dentro del directorio Descargas.
DIR_IMG="$HOME/Pictures"
DIR_DOCS="$HOME/Documents"
DIR_VIDEOS="$HOME/Videos"
FICH_LOG="/tmp/organizame_$(date +%d%m%Y_%H%M%S).log"

# Chequea que el directorio base exista
if [ ! -d "$DIR_BASE" ]; then
	echo "Error: El directorio $DIR_BASE no existe."
	exit 1
fi

# Crear directorios de destino si no existen
mkdir -p "$DIR_DOCS" "$DIR_IMG" "$DIR_VIDEOS"

# Funcion para mover archivos
mover_fich() {
	local fuente="$1"
	local destino="$2"
	local dir_destino=$(dirname "$destino")

	if [ -e "$destino" ]; then
		local base=$(basename "$fuente")
		local ext="${base##*.}"
		local nombre="${base%.*}"
		local contador=1
		while [ -e "$dir_destino/$nombre($contador).$ext" ]; do
			((contador++))
		done
		destino="$dir_destino/$nombre($contador).$ext"
	fi

	mv -v "$fuente" "$destino"
	echo "$(date '+%d-%m-%Y %H:%M:%S') - se ha movido $fuente a $destino" >>"$FICH_LOG"
}
# Mover archivos
echo "Organizando archivos en el directorio $DIR_BASE"
echo "Organizacion iniciada $(date)" >>"$FICH_LOG"

for fichero in "$DIR_BASE"/*; do # For loop para iterar sobre los ficheros usando nuestra funcion
	if [ -f "$fichero" ]; then
		case "${fichero,,}" in
		*.jpg | *.jpeg | *.png | *.gif)
			mover_fich "$fichero" "$DIR_IMG/$(basename "$fichero")"
			;;
		*.pdf | *.doc | *.docx | *.txt)
			mover_fich "$fichero" "$DIR_DOCS/$(basename "$fichero")"
			;;
		*.mp4 | *.avi | *.mkv | *.webm)
			mover_fich "$fichero" "$DIR_VIDEOS/$(basename "$fichero")"
			;;
		esac
	fi
done

echo "Tus archivos han sido organizados!"
echo "Organizacion terminada $(date)" >>"$FICH_LOG"
echo "Log: $FICH_LOG"
