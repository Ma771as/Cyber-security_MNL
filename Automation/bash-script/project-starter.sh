#!/bin/bash

# Create a directory structure for a new academic project
# Usage: ./project-stareter.sh "Project Name"

# Check if a name for the project was provided. If not, show usage and exit.
if [ -z "$1" ]; then
	echo "Error: Projects need a name"
	echo "Usage: $0 \"Project Name\""
	exit 1
fi

PROJECT_NAME="$1"

# Create the main project directory/stnd_sub-dir
mkdir -p "$PROJECT_NAME"/{notes,sources,drafts,final}

# Create a blank 'README.md' file with the project title and date.
echo "$PROJECT_NAME" > "$PROJECT_NAME/README.md"
echo "## Created on: $(date)" >> "$PROJECT_NAME/README.md"

# Create an initial note file with a timestamp
touch "$PROJECT_NAME/notes/$(date +%Y-%m-%d)-initial-thoughts.md"

echo "Project structure for '$PROJECT_NAME' created successfully!"
