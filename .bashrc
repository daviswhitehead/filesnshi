# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

function frameworkpython {
    if [[ ! -z "$VIRTUAL_ENV" ]]; then
        PYTHONHOME=$VIRTUAL_ENV /usr/local/bin/python "$@"
    else
        /usr/local/bin/python "$@"
    fi
}

# command line prompt
#force_color_prompt=yes
#if [ "$color_prompt" = yes ]; then
PS1='\[\[\033[01;34m\]\u\[\033[01;33m\] \[\033[01;33m\]\W \[\033[01;31m\]\D{%F %T} \[\033[01;37m\]\$ \]\]'
#[\033[01:32m\]
#PS1='${debian_chroot:+($debian_chroot)}\[\033[01;36m\]\u\[\033[01;31m\]@\[\033[01;36m\]\h\[\033[01;33m\]:\[\033[01;31m\]\w\[\033[01;33m\]\$ '
#else
  #PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
#fi

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
alias fls='fleetctl ssh '
alias flg='fleetctl list-units | grep user_selection'

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
alias vsm='source /Users/dwhitehead/Documents/cogo/repos/vsocialmail/bin/activate'
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
alias gp='git pull'
alias gs='git status'
alias ga='git add '
alias gaa='git add -A :/'
alias gb='git branch '
alias gc='git commit -m '
alias gd='git diff'
alias go='git checkout '
alias gpr='git pull -r '
alias gp='git pull '
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


