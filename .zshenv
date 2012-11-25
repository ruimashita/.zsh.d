
###### ruby #################################
if [[ -e $HOME/.rvm/scripts/rvm ]]; then
    source $HOME/.rvm/scripts/rvm;
fi


##### javascript #################################################################
if [[ -e $HOME/nvm/nvm.sh ]]; then
	source $HOME/nvm/nvm.sh;
fi




# phpenv
if [[ -d $HOME/.phpenv/ ]]; then
	export PATH=$HOME/.phpenv/bin:$PATH;
	eval "$(phpenv init - zsh)";
fi

# php-build
if [[ -d $HOME/.php-build/ ]]; then
	export PATH=$PATH:$HOME/.php-build/bin
fi


# flex 
if [[ -d $HOME/flex_sdk_4.6/ ]]; then
	export PATH=$PATH:$HOME/flex_sdk_4.6/bin
fi


### brew autojump
if [ -f `brew --prefix`/etc/autojump ]; then
  . `brew --prefix`/etc/autojump
fi
