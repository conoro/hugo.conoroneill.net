#!/bin/bash

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

git config --global user.email "cwjoneill@gmail.com"
git config --global user.name "Conor O'Neill"

git config credential.helper "store --file=.git/credentials"
echo "https://${GH_TOKEN}:@github.com" > .git/credentials

# Build the project.
hugo # if using a theme, replace by `hugo -t <yourtheme>`
