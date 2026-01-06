#
# Zsh config
#
color="#ffb3df"
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

# copilot alias
alias copilot="gh copilot"

export PATH=$PATH:$HOME/.local/bin

# Zinit
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local.share}/zinit/zinit.git"
if [[ ! -d $ZINIT_HOME ]]; then
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi
source "$ZINIT_HOME/zinit.zsh"

# Zinit addons
zinit light zsh-users/zsh-syntax-highlighting

# Set Manpager to Nvim
export MANPAGER='nvim +Man!'

# Alias for Eza
alias ls='eza --hyperlink --icons -g'

# Alias for Bat
alias cat='bat -p'

# Init starship
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
