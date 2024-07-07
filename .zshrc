### REACT NATIVE ###
export ANDROID_SDK_ROOT=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_SDK_ROOT/emulator
export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools

## RUBY ##
eval "$(rbenv init - zsh)"

### VS CODE ###
export PATH=$PATH:/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin
REACT_EDITOR=code

### FASTLANE ###
# alias fastlane='bundle exec fastlane '
export PATH="$HOME/.fastlane/bin:$PATH"
# export LC_ALL=en_US.UTF-8
# export LANG=en_US.UTF-8

### NVM ### https://github.com/nvm-sh/nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

## for react-native and nvm
# https://stackoverflow.com/questions/44492197/react-native-ios-build-cant-find-node/48482693#48482693

# auto load the correct node version
find-up () {
    path=$(pwd)
    while [[ "$path" != "" && ! -e "$path/$1" ]]; do
        path=${path%/*}
    done
    echo "$path"
}

### GENERAL ###

# general aliases
alias ll=' ls -l'
alias finder='open .'
# alias gh='cd ~/Documents/github/'
alias shayr-app='cd ~/Documents/github/shayr-app'
alias shayr-backend='cd ~/Documents/github/shayr-backend'
alias shayr-resources='cd ~/Documents/github/shayr-resources'
alias filesnshi='cd ~/Documents/github/filesnshi/'
alias payload='cd ~/Documents/chopdawg/payload/payload-app'

### PYTHON ###

# stop writing .pyc files
export PYTHONDONTWRITEBYTECODE=1

# for matplotlib in virtualenv
function frameworkpython {
    if [[ ! -z "$VIRTUAL_ENV" ]]; then
	PYTHONHOME=$VIRTUAL_ENV /usr/bin/python "$@"
    else
	/usr/bin/python "$@"
    fi
}

### GIT ###

# get current branch in git repo
function parse_git_branch() {
	BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
	if [ ! "${BRANCH}" == "" ]
	then
		echo "${BRANCH}"
	else
		echo ""
	fi
}

# get current status of git repo
function parse_git_status() {
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

# combine branch and status
function parse_git_branch_w_status() {
	BRANCH=`parse_git_branch`
	STAT=`parse_git_status`
	echo "${BRANCH}${STAT}"
}

# pull from origin push to origin
function gplso() {
	if [ -z "$1" ]; then
		branch="master"
	else
		branch="$1"
	fi
	git pull origin $branch
	git push origin $branch
}

# create and checkout a branch
function gbo() {
	branch="$1"
	git branch $branch
	git checkout $branch
}

function pr() {
	if [ -z "$1" ]; then
		return
	else
		commit_message="$1"
	fi
	branch=`parse_git_branch`
	git add -A :/
	git commit -m $commit_message
	git push origin $branch
	git checkout master
	git branch -D $branch
	git pull
}


# git aliases
alias gs='git status'
alias ga='git add '
alias gaa='git add -A :/'
alias gb='git branch '
alias gc='git commit -m '
alias gac='git commit -a -m '
alias gd='git diff '
# git diff branch_1..branch_2
alias go='git checkout '
alias gom='git checkout master'
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
alias guntrack='git rm --cached '
alias grbs='git rebase '


### COMMAND LINE PROMPT ###

# virtual environment
function virtualenv_info {
	# Get Virtual Env
	if [[ -n "$VIRTUAL_ENV" ]]; then
		# Strip out the path and just leave the env name
		echo "${VIRTUAL_ENV##*/}"
	else
		echo ""
	fi
}

# disable the default virtualenv prompt change
export VIRTUAL_ENV_DISABLE_PROMPT=1

prompt_command () {
	if [ "$(parse_git_branch_w_status)" != "" ] ; then
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
	local DIRECTORY="\W/"
	local TIME="\D{%T}"
	local ARROW="  ↪  "
	# prompt
	export PS1="${COLOR_START}${BLUE}${DIRECTORY}${COLOR_END}\n${COLOR_START}${GREEN}${TIME}${COLOR_END}\n${COLOR_START}${YELLOW}\`parse_git_branch_w_status\`${COLOR_END}${GITNL}${COLOR_START}${PURPLE}\`virtualenv_info\`${COLOR_END}${VENVNL}${COLOR_START}${RED}${ARROW}${COLOR_END}"
}
PROMPT_COMMAND=prompt_command
