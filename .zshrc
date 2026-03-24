# echo 'load .zshrc'

#====================================================================
# Depending on OS
#====================================================================

# for Linux
if [ $OSTYPE = 'linux-gnu' ]; then


fi

# for Mac
if [[ $OSTYPE =~ 'darwin.*' ]]; then

    # for brew path
    eval "$(/opt/homebrew/bin/brew shellenv)"

    # use gls, dircolors from brew coreuitls
    alias ls='gls'
    alias dircolors='gdircolors'

fi



############################################################################################################################
# my setting
############################################################################################################################

## ゴミ箱
if [ $OSTYPE = 'linux-gnu' ]; then
    if [[ -e /usr/bin/trash-put ]]; then
	    alias rm='trash-put'
    fi
fi

if [[ $OSTYPE =~ 'darwin.*' ]]; then
	alias rm='trash'
fi

## set LS_COLORS by dircolors
eval $(dircolors ~/.zsh.d/dircolors/src/dir_colors)



## 区切りワード
WORDCHARS='-*?_.[]‾=&;!#$%^(){}<>'
autoload -U select-word-style
select-word-style bash

## History settings

# share history with another zsh
setopt share_history

# If a new command line being added to the history list duplicates an older one, the older command is removed from the list.
setopt hist_ignore_all_dups



## REf: http://journal.mycom.co.jp/column/zsh/010/index.html

# users generic .zshrc file for zsh(1)

# ## Environment variable configuration
# #
# # LANG
# #
# export LANG=ja_JP.UTF-8

## Default shell configuration
#
# set prompt
#
autoload colors
colors


# auto change directory
#
setopt auto_cd

# auto directory pushd that you can get dirs list by cd -[tab]
#
setopt auto_pushd

# # command correct edition before each completion attempt
# #
# setopt correct



# compacked complete list display
#
setopt list_packed

# no remove postfix slash of command line
#
setopt noautoremoveslash

# no beep sound when complete list displayed
#
setopt nolistbeep

## Keybind configuration
#
# emacs like keybind (e.x. Ctrl-a goes to head of a line and Ctrl-e goes
# to end of it)
#
bindkey -e


#====================================================================
# zsh-autosuggestions
# https://github.com/zsh-users/zsh-autosuggestions
#====================================================================
if [ -d $HOME/.zsh.d/zsh-autosuggestions/ ]; then
    source $HOME/.zsh.d/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#dddddd,bg=#333333,underline"

# Ctrl+K の `kill-line` で、suggestionがclearされるようにする。
ZSH_AUTOSUGGEST_CLEAR_WIDGETS+=(kill-line)


#====================================================================
# Completion configuration
# Ref: https://github.com/zsh-users/zsh-completions
#====================================================================
if [[ $OSTYPE =~ 'darwin.*' ]]; then
    # brew completions
    fpath=($(brew --prefix)/share/zsh-completions $fpath)
fi

fpath=(~/.zsh.d/completions $fpath)

autoload -U compinit
compinit


#====================================================================
# Startship configuration
# 
#====================================================================
case "$HOST" in
    "OZU"|\
        "NARUSE.local"|\
        "Wakisaka-Takuyas-Mac-mini-2024.local"|\
        "Wakisaka-Takuyas-MacBook-Pro-13-inch-M1-2020.local")
        STARSHIP_PALETTE="catppuccin_macchiato"
        ;;
    *)
        STARSHIP_PALETTE="gruvbox_dark"
        ;;
esac

sed "s/^palette = \"__PALETTE__\"/palette = \"$STARSHIP_PALETTE\"/" \
    ~/.zsh.d/starship.base.toml > ~/.config/starship.toml

eval "$(starship init zsh)"

#====================================================================
# Depending on OS
#====================================================================

# for Linux
if [ $OSTYPE = 'linux-gnu' ]; then


fi

# for Mac
if [[ $OSTYPE =~ 'darwin.*' ]]; then

    # autojump
    if [ -z $AUTOJUMP_INITTED ]; then
        echo "init autojump"
        [[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh
        export AUTOJUMP_INITTED=1
    fi

    # byobu
    export BYOBU_PREFIX=$(brew --prefix)
fi


###### ruby #################################
# if [[ -e $HOME/.rvm/scripts/rvm ]]; then
#     source $HOME/.rvm/scripts/rvm;
# fi

if [ -d $HOME/.rbenv/ ]; then
	export PATH=$PATH:$HOME/.rbenv/bin
	eval "$(rbenv init - zsh)"
fi



##### python #################################################################
if [ -d $HOME/.pyenv/ ]; then
    export PYENV_ROOT=$HOME/.pyenv
    export PATH=$PYENV_ROOT/bin:$PATH
    export PATH=$PYENV_ROOT/shims:$PATH

    if [ -z $PYENV_INITTED ]; then
        echo "pyenv init"
        eval "$(pyenv init -)"
        # eval "$(pyenv virtualenv-init -)"
        export PYENV_INITTED=1
    fi

fi


##### mise #################################################################
if [[ -e /opt/homebrew/bin/mise ]]; then
    eval "$(mise activate zsh)"
fi
