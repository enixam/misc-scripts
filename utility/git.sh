# edit global config
git config --global --edit
# local config
git config --local --edit

# clear git cache of a folder
git rm --cached <filename> 
# clear all git cache (this will delete all folders and files)
# you may want to use `git add` to add necessary files back after performing this operation
git rm --cached

# reduce git file size
git gc --aggressive --prune=now

# available mirrors
git clone https://github.com.cnpmjs.org/repo.git <folder>
git clone https://gitclone.com/github.com/repo.git <folder>

# Create a shallow clone with a history truncated to the last n commits.
git clone --depth n <repo> 