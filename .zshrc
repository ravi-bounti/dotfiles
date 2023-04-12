# zmodload zsh/zprof # zsh startup profile start
if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
    tmux attach -t auto || tmux new -s auto 
fi
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
# export NVM_LAZY_LOAD=true

ZSH_THEME="robbyrussell"

plugins=(
	git
	zsh-autosuggestions
	zsh-syntax-highlighting
  zsh-lazyload
  # zsh-nvm
)

source $ZSH/oh-my-zsh.sh

# History
HISTSIZE=130000 SAVEHIST=130000
export LS_COLORS="$LS_COLORS:ow=1;34:tw=1;34:"
alias gitl='git log --graph --oneline --all'

# FZF
# Install FZF via git clone instead of apt-get
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --glob "!{.git,.hg}/*" 2> /dev/null'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

export GOPATH=$HOME/go
export GOROOT="$(brew --prefix golang)/libexec"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"

# https://www.atlassian.com/git/tutorials/dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"


alias mlt='cd ~/go/src/github.com/bountihq/monolith'
alias ftd="cd ~/go/src/github.com/bountihq/frontend"

# lazyload nvm -- '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" && [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" && export NVM_DIR=~/.nvm && source /usr/local/opt/nvm/nvm.sh && nvm use 16.8.0'
lazyload diff2html npm nvm node -- 'export NVM_DIR=~/.nvm && source /usr/local/opt/nvm/nvm.sh && nvm use 16.8.0'

# zprof # zsh startup profile end
