# Turn off (or on?) some weird thing not letting me use asteriks
setopt +o nomatch

autoload -U colors && colors
autoload -Uz vcs_info

zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr \*
zstyle ':vcs_info:*' stagedstr \*
zstyle ':vcs_info:git*' actionformats " %{$fg[cyan]%}%b|%a%{$reset_color%}%u%{$fg[green]%}%c%{$reset_color%}"
zstyle ':vcs_info:git*' formats " %{$fg[cyan]%}%b%{$reset_color%}%u%{$fg[green]%}%c%{$reset_color%}"

precmd () { vcs_info }

setopt prompt_subst

PS1='%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~${vcs_info_msg_0_}%B%{$fg[red]%}]%{$reset_color%}$%b '

# History handling
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^[OA" history-beginning-search-backward-end
bindkey "^[OB" history-beginning-search-forward-end

# Tab completion
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots) # include hidden files
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

export VISUAL=vim
export EDITOR="$VISUAL"

# Load aliases and shortcuts if existent.
[ -f "$HOME/.config/shortcutrc" ] && source "$HOME/.config/shortcutrc"
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"

export LESS='-g -i -M -R -S -w -z-4'

# load syntax highlighting
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
