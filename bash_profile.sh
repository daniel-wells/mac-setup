export PATH="/usr/local/bin:$PATH"

# if bashrc has content, source it
[[ -s ~/.bashrc ]] && . ~/.bashrc

alias ls="ls -GFh"

# Tell grep to highlight matches
alias grep='grep --color=auto'

# Merge PDF files
# Usage: `mergepdf -o output.pdf input{1,2,3}.pdf`
alias mergepdf='/System/Library/Automator/Combine\ PDF\ Pages.action/Contents/Resources/join.py'

export HISTSIZE='32768';
export HISTFILESIZE="${HISTSIZE}";
# Omit duplicates and commands that begin with a space from history.
export HISTCONTROL='ignoreboth';
