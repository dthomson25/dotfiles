set -ex

git

# install brew
if ! command -v brew &> /dev/null
then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
    (echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> /Users/dannythomson/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi
brew tap buo/cask-upgrade

brew install mas

brew install slack --cask
brew install google-chrome --cask
brew install spotify --cask
brew install zoomus --cask
brew install Discord --cask
brew install visual-studio-code --cask
brew install 1password --cask
brew install notion --cask
brew install Discord --cask

# A good terminal
brew install iterm2 --cask
brew install --cask warp
brew install jq
brew install zsh zsh-completions zsh-syntax-highlighting


# And definitely check plugins, templates, themes, etc. at:
# https://github.com/robbyrussell/oh-my-zsh
brew install tree
brew install wget
brew install watch
brew install tldr
brew install thefuck
brew install rectangle --cask
brew install fzf

# DevOps/K8s
brew install docker --cask
brew install kubectl kind golang minikube hyperkit
minikube config set vm-driver hyperkit
brew install terraform

# Amphetamine
mas install 937984704
