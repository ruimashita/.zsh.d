echo 'load .zshenv'

###### ruby #################################
# if [[ -e $HOME/.rvm/scripts/rvm ]]; then
#     source $HOME/.rvm/scripts/rvm;
# fi

if [ -d $HOME/.rbenv/ ]; then
	export PATH=$PATH:$HOME/.rbenv/bin
	eval "$(rbenv init - zsh)"
fi

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

##### javascript #################################################################
if [[ -e $HOME/.nvm/nvm.sh ]]; then
	source $HOME/.nvm/nvm.sh;
fi

##### python #################################################################
export WORKON_HOME=$HOME/.virtualenvs
if [[ -e /usr/local/bin/virtualenvwrapper.sh ]]; then
	source /usr/local/bin/virtualenvwrapper.sh

	## source ~/.virtualenvs/ranbu/bin/activate
fi


##### php  #################################################################
# composer
if [ -d $HOME/.composer/ ]; then
	export PATH=$HOME/.composer/vendor/bin:$PATH;
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
	export ANDROID_HOME=$HOME/local/android-sdk-linux
fi


# android
if [ -d $HOME/local/android-sdk-linux/ ]; then

	export PATH=$PATH:$HOME/local/android-sdk-linux/platform-tools
fi


# xlsx2csv
if [ -d $HOME/local/xlsx2csv ]; then
	export PATH=$PATH:$HOME/local/xlsx2csv
fi

# packer
if [ -d $HOME/local/packer ]; then
	export PATH=$PATH:$HOME/local/packer/bin
fi



### OS setting

# for linux
if [ $OSTYPE = 'linux-gnu' ]; then

fi

# for mac
if [[ $OSTYPE =~ 'darwin.*' ]]; then

	# sbin path (brewのzshは/etc/pathsを見に行かないので)
	export PATH=/usr/sbin:/sbin:$PATH

	# brew path
	export PATH=/usr/local/bin:/usr/local/sbin:$PATH

	# brew php
    export PATH="$(brew --prefix homebrew/php/php54)/bin:$PATH"

    # docker
    export DOCKER_HOST=tcp://$(boot2docker ip 2>/dev/null):2375
fi

