#!/bin/bash

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

# Config user git
git config user.name "Caio Almeida - CI"
git config user.email "caio.f.r.amd@gmail.com"

# Update theme
rm -rf themes/beautifulhugo

git clone git@github.com:caiofralmeida/beautifulhugo.git themes/beautifulhugo

# Build the project.
hugo -t beautifulhugo # if using a theme, replace by `hugo -t <yourtheme>`

gulp

# Copy README.md
cp README.md public

# Copy CNAME
cp CNAME public

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
git push origin master

# Come back
cd ..
