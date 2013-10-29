
###### ruby #################################
# if [[ -e $HOME/.rvm/scripts/rvm ]]; then
#     source $HOME/.rvm/scripts/rvm;
# fi

if [ -d $HOME/.rbenv/ ]; then
	export PATH=$PATH:$HOME/.rbenv//bin
	eval "$(rbenv init - zsh)"
fi


##### javascript #################################################################
if [[ -e $HOME/.nvm/nvm.sh ]]; then
	source $HOME/.nvm/nvm.sh;
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

if [ -d $HOME/local/flex_sdk ]; then
	export PATH=$PATH:$HOME/local/flex_sdk_4.6/bin
fi


# android-studio 
if [ -d $HOME/local/android-studio/ ]; then
	export PATH=$PATH:$HOME/local/android-studio/bin
	export ANDROID_HOME=$HOME/local/android-studio/sdk
fi

# xlsx2csv
if [ -d $HOME/local/xlsx2csv ]; then
	export PATH=$PATH:$HOME/local/xlsx2csv
fi


### OS setting

# for linux
if [ $OSTYPE = 'linux-gnu' ]; then

fi

# for mac
if [[ $OSTYPE =~ 'darwin.*' ]]; then

	# brew path
	export PATH=/usr/local/bin:/usr/local/sbin:$PATH

fi

