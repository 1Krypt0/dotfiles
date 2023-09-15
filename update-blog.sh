#!/bin/bash

BLOG_DIR="$HOME/Desktop/2.Areas/Website/src/content/blog"
OBSIDIAN_DIR="$HOME/Desktop/2.Areas/Obsidian/2.Areas/Website/Blog/"

# First, sync any Markdown file to the destination
find "$OBSIDIAN_DIR" -iregex ".*\.md" -exec cp {} "$BLOG_DIR" \;

# Then, update git so that the files are deployed
cd "$BLOG_DIR" || exit 1
git add . && git commit -m "Updating blog with new entries" && git push
