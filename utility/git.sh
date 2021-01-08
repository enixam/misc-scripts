# clear git cache of a folder
git rm --cached filename -r 
# clear all git cache (this will delete all folders and files)
# you may want to use `git add` to add necessary files back after performing this operation
git rm -r --cached

# reduce git file size
git gc --aggressive --prune=now

# clone a repo using mirror into a specific folder 
git clone https://github.com.cnpmjs.org/repo.git <folder>

# Create a shallow clone with a history truncated to the last n commits.
git clone --depth n repo 