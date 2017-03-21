kubectl delete secrets,services,ingresses,daemonsets,deployments,replicasets,pods --all --namespace=cluster
cd ..\kube-configs
for %%f in ("*.yaml") do (
    kubectl create -f %%f
)
