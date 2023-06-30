#!/bin/bash

# Function to install requirements from a file
install_requirements() {
  file="$1"
  echo "Installing requirements from $file..."
  pip3 install --no-cache-dir -r "$file"
  echo "Requirements installation complete."
}

# Function to traverse sub-folders recursively
traverse_folders() {
  folder="$1"
  echo "Scanning folder: $folder"

  # Look for requirements.txt in the current folder
  if [ -f "$folder/requirements.txt" ]; then
    install_requirements "$folder/requirements.txt"
  fi

  # Traverse sub-folders recursively
  for subfolder in "$folder"/*; do
    if [ -d "$subfolder" ]; then
      traverse_folders "$subfolder"
    fi
  done
}

# Start scanning from the specified folder
start_folder="/usr/src/app/plugins"
traverse_folders "$start_folder"

