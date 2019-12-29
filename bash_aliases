### TMUX ###
which tmux
retval=$?
if [ $retval= 0 ]; then
  alias ta='sess=$(tmux ls -F#S|tail -1);tmux a -t ${sess:-0}'
  alias tls='tmux ls'
fi
### Kubernetes ###
### https://kubernetes.io/docs/reference/kubectl/cheatsheet/
which kubectl
retval=$?
if [ $retval = 0 ]; then
  alias k=kubectl
  complete -F __start_kubectl k
fi
