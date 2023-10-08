#!/bin/bash

# Define the installation directory
INSTALL_DIR="/usr/local/bin"

# Copy the script to the installation directory
cp dart_scripts_runner.sh "$INSTALL_DIR"

# Make the script executable
chmod +x "$INSTALL_DIR/dart_scripts_runner.sh"

# Set up the alias
echo "alias dsr='$INSTALL_DIR/dart_scripts_runner.sh'" >> "$HOME/.bashrc"

# Apply changes to the current session
source "$HOME/.bashrc"

echo "Installation complete. You can now use 'dsr' as a command to run the dart scripts in your pubspec.yml file"