#!/bin/bash
prefix='pod\/'
source utils.sh
kubectl get pods --namespace=cluster --output=name | while read -r pod
do
    purePod=${pod#$prefix}
    echo ${purePod}
    kubectl exec --namespace=cluster ${purePod} -- bash -c "$(convertFileToCommands "configure_node.sh")"
done
