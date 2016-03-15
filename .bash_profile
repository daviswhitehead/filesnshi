#.bash_profile

[[ -r ~/.bashrc ]] && . ~/.bashrc

alias grid='sshrc -x dwhitehead@cglgrid2'
alias soc='sshrc -x social@cglgrid2'
alias ps1='sshrc -x cogo@psgrid1'
alias ps2='sshrc -x cogo@psgrid2'
alias pss='sshrc -x cogo@psstaging'

# added by Anaconda 2.1.0 installer
export PATH="//anaconda/bin:$PATH"

# added by Anaconda 2.1.0 installer
export PATH="/Users/dwhitehead/anaconda/bin:$PATH"

export PATH=/Users/dwhitehead/anaconda/bin://anaconda/bin:/usr/local/heroku/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/local/git/bin:/usr/local/mysql/bin

export PATH=/Users/dwhitehead/Documents/cogo/repos/social/vsocialmail/bin:/Users/dwhitehead/anaconda/bin://anaconda/bin:/usr/local/heroku/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/local/git/bin:/usr/local/mysql/bin:/Applications/Postgres.app/Contents/Versions/9.4/bin:/usr/local/mysql/bin
export PATH=/usr/local/bin:$PATH
export PATH="/usr/local/sbin:$PATH"

export ANDROID_HOME=/Users/dwhitehead/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

# colors!
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
