set -ex

# install brew
if ! command -v brew &> /dev/null
then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi
brew tap buo/cask-upgrade

brew install mas

brew cask install slack
brew cask install google-chrome
brew cask install spotify
brew cask install zoomus
brew cask install visual-studio-code

# A good terminal
# brew cask install iterm2
brew install jq
brew install zsh zsh-completions zsh-syntax-highlighting zsh-autosuggestions

# And definitely check plugins, templates, themes, etc. at:
# https://github.com/robbyrussell/oh-my-zsh
brew install tree
brew install wget
brew install tldr
brew install thefuck
brew cask install rectangle

# DevOps/K8s
brew cask install docker
brew install kubectl kind golang minikube hyperkit
minikube config set vm-driver hyperkit
brew install terraform

# Amphetamine
mas install 937984704
