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
alias kwatch="watch kubectl get nodes -o=custom-columns='NAME:metadata.name,INTERNAL-IP:status.addresses[].address,STATUS:status.conditions[4].type,VERSION:status.nodeInfo.kubeletVersion,OS-IMAGE:status.nodeInfo.osImage,KERNEL-VERSION:status.nodeInfo.kernelVersion,CONTAINER-RUNTIME:status.nodeInfo.containerRuntimeVersion'" #watch kubectl get nodes,ns -o wide"
alias kwatchns="watch kubectl get pods,service,ingress,statefulset,deployment,daemonset,cronjob,replicaset -o wide"
alias knvipf="kubectl port-forward service/neuvector-service-webui 8443:8443 -n neuvector &;kubectl port-forward service/neuvector-svc-controller-api 10443:10443 -n neuvector &"
knvlc() {kubectl -n neuvector logs `kubectl -n neuvector get pods | grep controller | awk -v row=$1 'NR==row {print $1}'`}
knvlfc() {kubectl -n neuvector logs -f --since 1m `kubectl -n neuvector get pods | grep controller | awk -v row=$1 'NR==row {print $1}'`}
knvcli() {kubectl -n neuvector exec -it `kubectl -n neuvector get pods | grep manager | awk '{print $1}'` -- cli}
knvexecsh() {kubectl -n neuvector exec -it `kubectl -n neuvector get pods | grep controller | awk -v row=$1 'NR==row {print $1}'` -- sh}
kgetall() {for i in $(kubectl api-resources --verbs=list --namespaced -o name | grep -v "events.events.k8s.io" | grep -v "events" | sort | uniq); do echo "Resource:" $i; kubectl -n ${1} get --ignore-not-found ${i}; done}
