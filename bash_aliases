#echo "~/.bash_aliases loading..."
# Alias Tmux 
which tmux > /dev/null
retval=$?
if [ $retval = 0 ]; then
  alias ta='sess=$(tmux ls -F#S|tail -1);tmux a -t ${sess:-0}'
  alias tls='tmux ls'
fi
#### Localize Aliases ###
alias resetdotfiles="curl -s -L https://tinyurl.com/gtdotfiles | bash -s reset"
alias knv="kubectl -n neuvector"
alias kwatch="watch kubectl get nodes,ns -o wide"
alias kwatchns="watch kubectl get pods,svc,ingress,sts,deploy,ds,rs,cronjob -o wide"
knvlc() {kubectl -n neuvector logs `kubectl -n neuvector get pods | grep controller | awk -v row=$1 'NR==row {print $1}'`}
knvlfc() {kubectl -n neuvector logs -f --since 1m `kubectl -n neuvector get pods | grep controller | awk -v row=$1 'NR==row {print $1}'`}
knvcli() {kubectl -n neuvector exec -it `kubectl -n neuvector get pods | grep manager | awk '{print $1}'` -- cli}
knvlfccli() {kubectl -n neuvector exec -it `kubectl -n neuvector get pods | grep controller | awk -v row=$1 'NR==row {print $1}'` -- sh}
