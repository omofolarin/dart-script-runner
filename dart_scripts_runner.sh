#!/bin/bash

SCRIPT_NAME=$1

# Check if pubspec.yaml exists
if [[ ! -f "pubspec.yaml" ]]; then
  echo "Error: pubspec.yaml not found in the current directory."
  exit 1
fi

# Extract the command associated with the provided script name
COMMAND=$(awk -v script="$SCRIPT_NAME" '
  $1 == script ":" {
    command = "";
    for (i = 2; i <= NF; i++) {
      command = command $i " ";
    }
    gsub(/^[[:space:]]+|[[:space:]]+$/, "", command);  # Remove leading/trailing spaces
    print command;
    exit;
  }
' pubspec.yaml)

echo "running $COMMAND"

# Check if the command was found
if [[ -z "$COMMAND" ]]; then
  echo "Error: Script '$SCRIPT_NAME' not found in pubspec.yaml."
  exit 1
fi

# Execute the command
eval "$COMMAND"