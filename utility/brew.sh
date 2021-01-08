# install brew
# see mirror configuration at 
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# uninstall homebrew (uninstall cli but not casks)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/uninstall.sh)"

# check install
brew doctor

# search a package (dispaly available formulae and casks)
brew search <package>

# install a package (to the usr/local/Cellar)
brew install <package>

# dispaly if a package is installed, version, location, dependencies and some analytics data
brew info <package>

# list installed packages
brew list

# uninstall a package
brew uninstall <package>

# fetch newest version of all installed packages
brew update

# actually update a package
brew upgrade <package>

# display all installed package with a newer version
brew outdated

# brew does not delete older versions of packages, brew cleanup delete the older version
brew cleanup

# install an application rather than cli (to Applications folder)
brew cask install <app>

# go to application homepage
brew cask home <app>

# install package from other repo (other than homebrew core repo)
brew search heroku # no formula or cask found
brew tap heroku/brew # find on heroko website
brew search heroku # now the formula for heroku is visible 
brew install heroku # install heroku 