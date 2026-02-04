#!/bin/bash

# Move everything except .git temporarily
mkdir ../temp
shopt -s extglob
mv !(".git") ../temp/

# Clean out git history
git checkout --orphan new-branch
git rm -rf .
mv ../temp/* ./
git add .
git commit -m "Initial commit"

# Delete old branches
git branch -D main
git branch -m main

