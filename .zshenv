# echo 'load .zshenv'

### OS setting

# for linux
if [ $OSTYPE = 'linux-gnu' ]; then


fi

# for mac
if [[ $OSTYPE =~ 'darwin.*' ]]; then
    # disable cat /etc/zprofile
    setopt no_global_rcs

	# sbin path (brewのzshは/etc/pathsを見に行かないので)
	export PATH=/usr/sbin:/sbin:$PATH

	# brew path
	export PATH=/usr/local/bin:/usr/local/sbin:$PATH

    # docker-machine
    export MACHINE_STORAGE_PATH="/Volumes/Transcend/.docker/machine"

    # docker
    # export DOCKER_TLS_VERIFY="1"
    # export DOCKER_HOST="tcp://192.168.99.100:2376"
    # export DOCKER_CERT_PATH="/Volumes/Transcend/.docker/machine/machines/default"
    # export DOCKER_MACHINE_NAME="default"
    # Run this command to configure your shell:
    # eval $(docker-machine env)
    # "/Users/takuya/.docker/machine/machines/docker"

    # byobu
    export BYOBU_PREFIX=$(brew --prefix)

    ## autojump
    [[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh

fi


### path setting

if [ -d $HOME/local/bin/ ]; then
    export PATH=$HOME/local/bin:$PATH
fi

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


##### golang #################################################################
if [ -e $HOME/go ]; then
	export GOPATH=$HOME/go
    export PATH=$GOPATH/bin:$PATH
fi

if [ -e /usr/local/go ]; then
	export GOROOT=/usr/local/go
    export PATH=$GOROOT/bin:$PATH
fi


##### javascript #################################################################
if [ -e $HOME/.nvm/nvm.sh ]; then
	source $HOME/.nvm/nvm.sh;
fi

##### python #################################################################
if [ -d $HOME/.pyenv/ ]; then
    export PYENV_ROOT=$HOME/.pyenv
    export PATH=$PYENV_ROOT/bin:$PATH
    export PATH=$PYENV_ROOT/shims:$PATH
    eval "$(pyenv init -)"
    # eval "$(pyenv virtualenv-init -)"
fi


##### php  #################################################################
# composer
if [ -d $HOME/.composer/ ]; then
	export PATH=$HOME/.composer/vendor/bin:$PATH;
fi

# # phpenv
# if [ -d $HOME/.phpenv/ ]; then
#     # rbenvのパスを優先させるため、この順序
#     export PATH=$PATH:$HOME/.phpenv/bin;
#     eval "$(phpenv init - zsh)";
# fi

# # php-build
# if [ -d $HOME/.php-build/ ]; then
# 	export PATH=$PATH:$HOME/.php-build/bin
# fi


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

# go_appengine
if [ -d $HOME/local/go_appengine/ ]; then
	export PATH=$PATH:$HOME/local/go_appengine
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


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/wakisakatakuya/local/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/wakisakatakuya/local/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/wakisakatakuya/local/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/wakisakatakuya/local/google-cloud-sdk/completion.zsh.inc'; fi
