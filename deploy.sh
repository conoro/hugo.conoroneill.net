#!/bin/bash

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

git config --global user.email "cwjoneill@gmail.com"
git config --global user.name "Conor O'Neill"

sed -i 's/git@github.com:/https:\/\/${GH_TOKEN}@github.com\//' .gitmodules
sed -i 's/git@github.com:/https:\/\/${GH_TOKEN}@github.com\//' .git/config
  
# Build the project.
hugo # if using a theme, replace by `hugo -t <yourtheme>`

# Go To Public folder
cd public

# Add changes to git.
git add -A

# Commit changes.
msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# Push source and build repos.
git push --verbose origin master

# Come Back
cd ..
