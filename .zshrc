# echo 'load .zshrc'

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.zsh.d/oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
if [ $HOST = 'OZU' ]; then
    ZSH_THEME="candy"
elif  [ $HOST = 'NARUSE.local' ]; then
    ZSH_THEME="candy"
elif  [ $HOST = 'NARUSE' ]; then
    ZSH_THEME="candy"
elif  [ $HOST = 'LM-MacBook-wakisaka.local' ]; then
    ZSH_THEME="candy"
elif  [ $HOST = 'Wakisaka-Takuyas-Mac-mini-2024.local' ]; then
    ZSH_THEME="candy"
else
    ZSH_THEME="ys"
fi

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git-flow autojump)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
#PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting



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

	alias gitk='gitk 2>/dev/null'

	# brew autojump
	# if [ -f `brew --prefix`/etc/autojump ]; then
	# 	. `brew --prefix`/etc/autojump
	# fi

fi

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


## Completion configuration
#


if [[ $OSTYPE =~ 'darwin.*' ]]; then
    # brew completions
    fpath=(/opt/homebrew/share/zsh-completions $fpath)
fi

fpath=(~/.zsh.d/completions $fpath)

autoload -U compinit
compinit


#====================================================================
##  先方予測機能
## http://pub.cozmixng.org/~hiki/cis/?zsh
#====================================================================
autoload -U predict-on
#C-xp 予測オン
#C-xC-p 予測オフ
predict-on
zle -N predict-on
zle -N predict-off
bindkey '^x^p' predict-on
bindkey '^xp' predict-off
#コマンドラインを編集中は予測入力をしない
#zstyle ':predict' toggle true

#予測入力のon/offが切り替わった時に表示する
zstyle ':predict' verbose true


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
