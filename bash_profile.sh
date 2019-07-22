# ln -sf ~/Dropbox/Github/mac-setup/bash_profile.sh ~/.bash_profile

export PATH="/usr/local/bin:$PATH"

# if bashrc has content, source it
[[ -s ~/.bashrc ]] && . ~/.bashrc

alias ls="ls -GFh"

set -o vi

export FZF_DEFAULT_COMMAND="fd . --follow $HOME"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
echo Library >> ~/.fdignore

# Tell grep to highlight matches
alias grep='grep --color=auto'

# Merge PDF files
# Usage: `mergepdf -o output.pdf input{1,2,3}.pdf`
alias mergepdf='/System/Library/Automator/Combine\ PDF\ Pages.action/Contents/Resources/join.py'

export HISTSIZE='32768';
export HISTFILESIZE="${HISTSIZE}";
# Omit duplicates and commands that begin with a space from history.
export HISTCONTROL='ignoreboth';

export GPG_TTY=$(tty)
[ -f ~/.gnupg/gpg-agent-info ] && source ~/.gnupg/gpg-agent-info
if [ -S "${GPG_AGENT_INFO%%:*}" ]; then
    export GPG_AGENT_INFO
else
    eval $( gpg-agent --daemon --options ~/.gnupg/gpg-agent.conf )
fi

