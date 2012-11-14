
###### ruby #################################
if [[ -e $HOME/.rvm/scripts/rvm ]]; then
    source $HOME/.rvm/scripts/rvm;
fi


##### javascript #################################################################
if [[ -e $HOME/nvm/nvm.sh ]]; then
	source $HOME/nvm/nvm.sh;
fi




# phpenv
export PATH=$HOME/.phpenv/bin:$PATH
eval "$(phpenv init - zsh)"

# php-build
export PATH=$PATH:$HOME/.php-build/bin
