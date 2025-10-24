#!/bin/bash
# sync_dotfiles.sh
# Automatically commit and push changes to GitHub

cd "$(dirname "$0")" || exit 1

# Add all changes
git add -A

# Check if there’s anything to commit
if git diff --cached --quiet; then
    echo "No changes to commit."
    exit 0
fi

# Commit changes with timestamp
git commit -m "Update dotfiles: $(date +'%Y-%m-%d %H:%M:%S')"

# Push to GitHub
git push origin main

echo "✅ Dotfiles synced successfully!"
