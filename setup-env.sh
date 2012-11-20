# source.  don't exec.

if [[ ! -s $HOME/.rvm/scripts/rvm ]]; then
	echo "\033[31;4;1mError: You should probably install RVM.\033[0m"
	exit 42
fi

source $HOME/.rvm/scripts/rvm
source $(rvm env --path)
