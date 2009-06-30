export PATH=/opt/local/sbin:/opt/local/bin/:/opt/local/lib/postgresql83/bin:/home/ericholscher/Code/:$PATH:$HOME/bin:/Library/PostgreSQL/8.3/bin:/usr/local/git/bin/
export DJANGO_SETTINGS_MODULE=test.ellington
export PYTHONPATH=~/lib:~/lib/worldonline/thirdparty
alias gdf='git diff -w'
alias COMMIT='git stash; git svn dcommit; git stash pop;'
export HISTFILESIZE=10000000
export EDITOR=vim
alias destroy-pyc='find . -name "*.pyc" -delete'
alias REBASE='git stash; git svn rebase; git stash pop;'

#export TERM=screen
set -o vi

. /usr/local/git/contrib/completion/git-completion.bash
. ~/svn-clones/django/extras/django_bash_completion

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
} 

export PS1="[\u@\h:\w]\$(parse_git_branch)$ "


# ^l clear screen
bind -m vi-insert "\C-l":clear-screen
# ^p check for partial match in history
bind -m vi-insert "\C-p":dynamic-complete-history
# ^n cycle through the list of partial matches
bind -m vi-insert "\C-n":menu-complete

export WORKON_HOME=$HOME/.virtualenvs
. /Users/ericholscher/Code/virtualenvwrapper/virtualenvwrapper_bashrc


#Autocomplete ssh hostnames.
complete -W "$(echo `cat ~/.ssh/known_hosts | cut -f 1 -d ' ' | sed -e s/,.*//g | uniq | grep -v "\["`;)" ssh


extract () 
{
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xvjf $1        ;;
            *.tar.gz)    tar xvzf $1     ;;
            *.bz2)       bunzip2 $1       ;;
            *.rar)       unrar x $1     ;;
            *.gz)        gunzip $1     ;;
            *.tar)       tar xvf $1        ;;
            *.tbz2)      tar xvjf $1      ;;
            *.tgz)       tar xvzf $1       ;;
            *.zip)       unzip $1     ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1    ;;
            *)           echo "'$1' cannot be extracted via >extract<" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

