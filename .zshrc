if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
    tmux attach -t auto || tmux new -s auto 
fi
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
# https://www.atlassian.com/git/tutorials/dotfiles
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(
	git
	zsh-autosuggestions
	zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# History
HISTSIZE=130000 SAVEHIST=130000

# FZF
# Install FZF via git clone instead of apt-get
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --glob "!{.git,.hg}/*"'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
alias python='python3'
export LS_COLORS="$LS_COLORS:ow=1;34:tw=1;34:"

# Git
alias gitl='git log --graph --oneline --all'

# opam configuration
# [[ ! -r /home/rkk/.opam/opam-init/init.zsh ]] || source /home/rkk/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

export PATH=$PATH:/home/rkk/.local/bin
export PATH=$PATH:/mnt/c/Windows/SysWOW64
alias config='/usr/bin/git --git-dir=/home/rkk/.cfg/ --work-tree=/home/rkk'
export PYTHONPATH=$PYTHONPATH:/home/rkk/AlgoProblems/AOC/AOC2021
export PYTHONPATH=$PYTHONPATH:/home/rkk/AlgoProblems/AOC/AOC2022
# export PATH=$(echo "$PATH" | sed -e 's/:\/mnt[^:]*//g')
