# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

# for matplotlib in virtualenv
function frameworkpython {
    if [[ ! -z "$VIRTUAL_ENV" ]]; then
	PYTHONHOME=$VIRTUAL_ENV /usr/bin/python "$@"
    else
	/usr/bin/python "$@"
    fi
}

### COMMAND LINE PROMPT ###

# get current branch in git repo
function parse_git_branch() {
	BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
	if [ ! "${BRANCH}" == "" ]
	then
		STAT=`parse_git_dirty`
		echo "git: ${BRANCH}${STAT}"
	else
		echo ""
	fi
}

# get current status of git repo
function parse_git_dirty {
	status=`git status 2>&1 | tee`
	dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
	untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
	ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
	newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
	renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
	deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
	bits=''
	if [ "${renamed}" == "0" ]; then
		bits=">${bits}"
	fi
	if [ "${ahead}" == "0" ]; then
		bits="*${bits}"
	fi
	if [ "${newfile}" == "0" ]; then
		bits="+${bits}"
	fi
	if [ "${untracked}" == "0" ]; then
		bits="?${bits}"
	fi
	if [ "${deleted}" == "0" ]; then
		bits="x${bits}"
	fi
	if [ "${dirty}" == "0" ]; then
		bits="!${bits}"
	fi
	if [ ! "${bits}" == "" ]; then
		echo " ${bits}"
	else
		echo ""
	fi
}

# virtual environment
function virtualenv_info {
	# Get Virtual Env
	if [[ -n "$VIRTUAL_ENV" ]]; then
		# Strip out the path and just leave the env name
		echo "venv: ${VIRTUAL_ENV##*/}"
	else
		echo ""
	fi
}

# disable the default virtualenv prompt change
export VIRTUAL_ENV_DISABLE_PROMPT=1

prompt_command () {
	if [ "$(parse_git_branch)" != "" ] ; then
		GITNL="\n"
	else
		GITNL=""
	fi
	if [ "$(virtualenv_info)" != "" ] ; then
		VENVNL="\n"
	else
		VENVNL=""
	fi
	# colors
	local COLOR_START="\[\e"
	local COLOR_END="\[\e[m\]"
	local BLUE="[34m\]"
	local GREEN="[32m\]"
	local YELLOW="[33m\]"
	local PURPLE="[35m\]"
	local RED="[31m\]"
	# items
	local DIRECTORY="dir: \W"
	local TIME="time: \D{%T}"
	local ARROW="  ↪  "
	# prompt
	export PS1="${COLOR_START}${BLUE}${DIRECTORY}${COLOR_END}\n${COLOR_START}${GREEN}${TIME}${COLOR_END}\n${COLOR_START}${YELLOW}\`parse_git_branch\`${COLOR_END}${GITNL}${COLOR_START}${PURPLE}\`virtualenv_info\`${COLOR_END}${VENVNL}${COLOR_START}${RED}${ARROW}${COLOR_END}"
}
PROMPT_COMMAND=prompt_command

export DYLD_LIBRARY_PATH=/usr/local/mysql/lib:$DYLD_LIBRARY_PATH
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/9.4/bin
export PATH="$HOME/bin:$PATH"
export GIT_EDITOR=vim

# working with fleet
export FLEETCTL_ENDPOINT=http://shrimp.cogolo.net
alias fleet_rsa='ssh-add ~/.ssh/fleet_rsa'
alias fl='fleetctl '
alias fll='fleetctl list-units '
alias flj='fleetctl journal '
alias fljus='fleetctl journal --lines 100 social_user_selection.service'
alias fljwr='fleetctl journal --lines 100 social_wrangle.service'
alias fls='fleetctl ssh '
alias flg='fleetctl list-units | grep user_selection'
alias flss='fleetctl ssh e2496f04'

# docker (local)
alias dm='docker-machine'
alias d='docker'
function dstart() {
	if [ -z "$1"]; then
		name="default"
	else
		name="$1"
	fi
	docker-machine stop $name
	docker-machine start $name
	eval $(docker-machine env)
}
function dbr() {
	if [ -z "$1"]; then
		name="default"
	else
		name="$1"
	fi
	docker build -t $name
	docker run -it $name
}

## dm ls
## dm start default
## dm env default
## run returned eval command
## docker build -t wrangler
## docker run -it wrangler

# export ctags -R /Users/dwhitehead/Documents/cogo/repos/

# rebuild mysqldb:
# bash <(curl -Ls http://git.io/eUx7rg)

# general functions
function sv() {
	base_name=`basename $PWD`
	prefix="/v"
	suffix="/bin/activate"
	command=$PWD$prefix$base_name$suffix
	source $command
}

function gplso() {
	if [ -z "$1"]; then
		branch="master"
	else
		branch="$1"
	fi
	git pull origin $branch
	git push origin $branch
}

# general aliases
alias vi='/usr/local/Cellar/vim/7.4.936/bin/vim '
alias ll=' ls -l'
alias repo='cd /Users/dwhitehead/Documents/cogo/repos'
alias repos='cd /Users/dwhitehead/Documents/cogo/repos'
alias sm='cd /Users/dwhitehead/Documents/cogo/repos/social_mail/'
alias wr='cd /Users/dwhitehead/Documents/cogo/repos/wrangler/'
alias vsm='source /Users/dwhitehead/Documents/cogo/repos/social_mail/vsocial_mail/bin/activate'
alias vwr='source /Users/dwhitehead/Documents/cogo/repos/wrangler/vwrangler/bin/activate'
alias user='cd /Users/dwhitehead/Documents/cogo/repos/social_mail/user_selection/'
alias deact='deactivate'
alias ipy='ipython notebook'
alias postgres='export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/9.4/bin'
alias mysqldb='export DYLD_LIBRARY_PATH=/usr/local/mysql/lib:$DYLD_LIBRARY_PATH'
alias idxtags='ctags -R /Users/dwhitehead/Documents/cogo/repos/'
alias kaggle='cd /Users/dwhitehead/Documents/github/kaggle'
alias vkaggle='source /Users/dwhitehead/Documents/github/vkaggle/bin/activate'
alias github='cd /Users/dwhitehead/Documents/github/'
alias gh='cd /Users/dwhitehead/Documents/github/'
alias del='rm -rf '
alias finder='open .'
alias osdsm='cd /Users/dwhitehead/Documents/github/open_source_data_science_masters'
alias cleartemp='rm -rf /var/folders/pb/dfdkscmx4wsgddx9qgxy3wmm0000gp/T/'
alias sampledata='cd /Users/dwhitehead/Documents/cogo/repos/sample_data/'
alias filesnshi='cd /Users/dwhitehead/Documents/github/filesnshi/'

# git aliases
alias gs='git status'
alias ga='git add '
alias gaa='git add -A :/'
alias gb='git branch '
alias gc='git commit -m '
alias gd='git diff '
alias go='git checkout '
alias gpr='git pull -r '
alias gpl='git pull '
alias gps='git push '
alias gplo='git pull origin '
alias gplom='git pull origin master'
alias gpso='git push origin '
alias gpsom='git push origin master'
alias gss='git stash save '
alias gsl='git stash list '
alias gsp='git stash pop '
alias gsshow="!sh -c 'git stash show stash^{/$*} -p' -"
alias gsapply="!sh -c 'git stash apply stash^{/$*}' -"
alias gm='git merge '

