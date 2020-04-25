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
alias knvwatch="watch kubectl -n neuvector get all -o wide"
knvcl() {kubectl -n neuvector logs `kubectl -n neuvector get pods | grep controller | awk -v row=$1 'NR==row {print $1}'`}
knvclf() {kubectl -n neuvector logs -f --since 1m `kubectl -n neuvector get pods | grep controller | awk -v row=$1 'NR==row {print $1}'`}
