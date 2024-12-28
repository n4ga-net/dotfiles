# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob correct sharehistory
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/naga/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
#

# Fixing for SSH
if [[ "$TERM" == "xterm-kitty" ]]; then
  alias ssh='kitty +kitten ssh'
fi


eval "$(starship init zsh)"
