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

# Fix for SSH interpretations
if [[ "$TERM" == "xterm-kitty" ]]; then
  alias ssh='kitty +kitten ssh'
fi

# Init starship
eval "$(starship init zsh)"
