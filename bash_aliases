echo "~/.bash_aliases loading..."
# Alias Tmux 
which tmux > /dev/null
retval=$?
if [ $retval = 0 ]; then
  alias ta='sess=$(tmux ls -F#S|tail -1);tmux a -t ${sess:-0}'
  alias tls='tmux ls'
fi
#### Localize Aliases ###
alias resetdotfiles="curl -L https://tinyurl.com/gtdotfiles | bash -s reset"
alias knv="kubectl -n neuvector"
