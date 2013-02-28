
###### ruby #################################
if [[ -e $HOME/.rvm/scripts/rvm ]]; then
    source $HOME/.rvm/scripts/rvm;
fi


##### javascript #################################################################
if [[ -e $HOME/nvm/nvm.sh ]]; then
	source $HOME/nvm/nvm.sh;
fi


# phpenv
if [ -d $HOME/.phpenv/ ]; then
	export PATH=$HOME/.phpenv/bin:$PATH;
	eval "$(phpenv init - zsh)";
fi

# php-build
if [ -d $HOME/.php-build/ ]; then
	export PATH=$PATH:$HOME/.php-build/bin
fi


# flex 
if [ ! -d /usr/local/flex_sdk/ ]; then

	if [ -d $HOME/flex_sdk_4.6/ ]; then
		echo "sudo ln -s $HOME/flex_sdk_4.6 /usr/local/flex_sdk"
		sudo ln -s $HOME/flex_sdk_4.6 /usr/local/flex_sdk
	fi
fi

if [ -d /usr/local/flex_sdk ]; then
	export PATH=$PATH:$HOME/flex_sdk_4.6/bin
fi


### OS setting

# for linux
if [ $OSTYPE = 'linux-gnu' ]; then

fi

# for mac
if [ $OSTYPE = 'darwin12.2.1' ]; then

	alias gitk='gitk 2>/dev/null'
	
	# brew autojump
	if [ -f `brew --prefix`/etc/autojump ]; then
		. `brew --prefix`/etc/autojump
	fi

	# brew path
	export PATH=/usr/local/bin:/usr/local/sbin:$PATH

fi

