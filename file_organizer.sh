#!/bin/bash

#Creating directories for each files type to organize them.

mkdir -p ~/images ~/documents ~/audio

#Creating a log file to capture logs of the files which are being moved.

LOG_FILE="file_organizer.log"

#Script to move files

move_files() {
  EXTENSION=$1
  DEST_DIR=$2
  for FILE in *.$EXTENSION; do
    if [ -f "$FILE" ]; then
      mv "$FILE" "$DEST_DIR/"
      echo "$(date) - Moved $FILE to $DEST_DIR" >> "$LOG_FILE"
    fi
  done
}

# Move image files
move_files "jpg" "images"
move_files "png" "images"

# Move document files
move_files "txt" "documents"
move_files "pdf" "documents"

# Move audio files
move_files "mp3" "audio"

echo "File organization complete. Check the log file $LOG_FILE for details."


