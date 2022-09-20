```shell
alias k='kubectl'
alias kg='k get'
alias kgpo='k get pods'
alias kgdep='k get deployments'
alias kgsvc='k get services'
alias kgcm='k get cm'
alias kdpo='k describe pod'
alias kddep='k describe deployment'
alias kdsvc='k describe service'
alias kdcm='k describe cm'
alias ktpo='k top pods'
alias kex='winpty kubectl exec -i -t'
alias krm='k delete'
alias krmdep='k delete deployment'
alias krmsvc='k delete service'
alias krmcm='k delete configmap'

# get services count
alias kgsvccnt="k get svc | sed -n '1!p' | wc -l"

# get pods by app name
kgpol() { k get pods -l=app="$1"; }

# get deployments by app name
kgdepl() { k get deployments -l=app="$1"; }

# get services by app name
kgsvcl() { k get svc -l=app="$1"; }

# delete pod
krmpo() { k delete pod "$1" --wait=false; }

# grep a string in a cm
kgrepcm() { k describe cm "$1" | grep "$2"; }

# get logs for a pod
kl() { k logs "$1" | less; }

# get logs from previous container run
klp() { k logs -p "$1" | less; }

# follow logs
klf() { k logs "$1" --follow; }

# tail logs
klt() { k logs "$1" --tail "$2"; }

# follow and tail logs
klft() { k logs "$1" --follow --tail "$2"; }

# get pod details in yaml format
kgpoy() { k get pod "$1" -o yaml | less; }

# get deployment details in yaml format
kgdepy() { k get deployment "$1" -o yaml | less; }

# get svc details in yaml format
kgsvcy() { k get service "$1" -o yaml | less; }

# get pod details in json format
kgpoj() { k get pod "$1" -o json | less; }

# get deployment details in json format
kgdepj() { k get deployment "$1" -o json | less; }

# get svc details in json format
kgsvcj() { k get service "$1" -o json | less; }

# get docker image id
kgi() { k get pod "$1" -o custom-columns=IMAGE_ID:.status.containerStatuses[0].imageID; }

# get k8s master node url
kgm() { k describe pod "$1" | grep "K8S_SERVER"; }

# scale deployment
kscale() { k scale deployment "$1" --replicas="$2"; }

# enter into pod's bash shell
kbash() { winpty kubectl -it exec "$1" bash; }
```
