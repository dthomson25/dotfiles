
DOTFILEDIR=~/dotfiles
eval "$(/opt/homebrew/bin/brew shellenv)"
# source $DOTFILEDIR/.paths
source $DOTFILEDIR/.aliases
source $DOTFILEDIR/.exports
source $DOTFILEDIR/.functions

# zsh history configuration
HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=10000
setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt inc_append_history     # add commands to HISTFILE in order of execution
#setopt share_history          # share command history data
setopt interactivecomments    # enable comments in command-line


# enable zsh-completions
autoload -Uz compinit
compinit
typeset -U fpath
fpath=(/usr/local/share/zsh-completions $fpath)

# zsh autosuggestions and syntax-highlighting
source $HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh

alias go1.18=~/sdk/go1.18.5/bin/go

export AWS_VAULT_PROMPT=ykman

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

. /opt/homebrew/opt/asdf/libexec/asdf.sh
export TEST_DB_USER='api'
export TEST_DB_PASSWORD='password'
export TEST_DB_SERVER_NAME='localhost:3306'
export TEST_DB_NAME='testAPI'

export TEST_WRITER_DB_USER='api'
export TEST_WRITER_DB_PASSWORD='password'
export TEST_WRITER_DB_SERVER_NAME='localhost:3306'
export TEST_WRITER_DB_NAME='testAPI'

export TEST_READER_DB_USER='api'
export TEST_READER_DB_PASSWORD='password'
export TEST_READER_DB_SERVER_NAME='localhost:3306'
export TEST_READER_DB_NAME='testAPI'

export TEST_DFP_WRITER_DB_USER='api'
export TEST_DFP_WRITER_DB_PASSWORD='password'
export TEST_DFP_WRITER_DB_SERVER_NAME='localhost:3306'
export TEST_DFP_WRITER_DB_NAME='dfp'
