# clear git cache of a folder
git rm --cached filename -r 
# clear all git cache (this will delete all folders and files)
# you may want to use `git add` to add necessary files back after performing this operation
git rm -r --cached

# reduce git file size
git gc --aggressive --prune=now
