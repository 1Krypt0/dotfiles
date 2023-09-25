#!/bin/bash

PROJECTS_DIR="$HOME/Desktop/2.Areas/Website/src/content/projects/"
OBSIDIAN_DIR="$HOME/Desktop/2.Areas/Obsidian/2.Areas/Website/Projects/"

# First, sync any Markdown file to the destination
find "$OBSIDIAN_DIR" -iregex ".*\.md" -exec cp {} "$PROJECTS_DIR" \;

# Then, update git so that the files are deployed
cd "$PROJECTS_DIR" || exit 1
git add . && git commit -m "Updating projects with new entries" && git push