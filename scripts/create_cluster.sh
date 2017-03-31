#!/bin/bash
source utils.sh
prefix='pod\/'
commandsToExecute=''
policyCommands=''

commandsToExecute=$(convertFileToCommands "join_cluster.sh")
kubectl get pods --namespace=cluster --output=name | while read -r pod
do
    purePod=${pod#$prefix}
    echo ${purePod}
    if [[ $purePod == rabbitmq-0 ]]; then
        kubectl exec --namespace=cluster ${purePod} -- bash -c "$(convertFileToCommands "create_policies.sh")"
        continue
    fi
    kubectl exec --namespace=cluster ${purePod} -- bash -c "$(convertFileToCommands "configure_node.sh")"
    kubectl exec --namespace=cluster ${purePod} -- bash -c "$commandsToExecute"
done
