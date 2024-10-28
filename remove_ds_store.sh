#!/bin/bash

# Step 1: Remove all .DS_Store files
echo "Removing all .DS_Store files..."
find . -name .DS_Store -print -delete

# Step 2: Check if .gitignore exists, if not create it
if [ ! -f .gitignore ]; then
    echo ".gitignore does not exist. Creating one..."
    touch .gitignore
fi

# Step 3: Add .DS_Store to .gitignore if not already added
if ! grep -q ".DS_Store" .gitignore; then
    echo "Adding .DS_Store to .gitignore..."
    echo ".DS_Store" >> .gitignore
else
    echo ".DS_Store is already in .gitignore"
fi

# Step 4: Add the changes to git
echo "Staging changes..."
git add .

# Step 5: Commit the changes
echo "Committing changes..."
git commit -m "Remove .DS_Store files and add .DS_Store to .gitignore"

# Step 6: Push the changes to GitHub
echo "Pushing changes to remote repository..."
git push

echo "All done!"
