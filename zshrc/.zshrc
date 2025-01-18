#
# Zsh config
#

# History settings
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# Setopts
setopt autocd extendedglob correct sharehistory
unsetopt beep

# Unsure if i need this
# bindkey -e
# zstyle :compinstall filename '/home/naga/.zshrc'

# runs compinit for auto completion
autoload -Uz compinit
compinit

# Set standard Editor
export EDITOR=nvim
export VISUAL=nvim

# Fix for SSH interpretations
#
#if [[ "$TERM" == "xterm-kitty" ]]; then
#  alias ssh='kitty +kitten ssh'
#fi
if [[ "$TERM" == "xterm-kitty" ]] || [[ "$TERM" == "xterm-ghostty" ]]; then  
  export TERM=xterm-256color
fi

# icat command for image view
alias icat="kitten icat"

# path for Lunarvim
export PATH=$PATH:$HOME/.local/bin

# Init starship
eval "$(starship init zsh)"
