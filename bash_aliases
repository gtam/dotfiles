### TMUX ###
alias ta='sess=$(tmux ls -F#S|tail -1);tmux a -t ${sess:-0}'
alias tls='tmux ls'

### Kubernetes ###
### https://kubernetes.io/docs/reference/kubectl/cheatsheet/
alias k=kubectl
complete -F __start_kubectl k
