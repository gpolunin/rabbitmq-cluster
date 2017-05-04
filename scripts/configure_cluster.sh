#!/bin/bash
prefix='pod\/'
source utils.sh
kubectl get pods --namespace=cluster --output=name | while read -r pod
do
    purePod=${pod#$prefix}
    echo ${purePod}
    if [[ $purePod == etcd* ]]; then
        continue
    fi
    if [[ $purePod == rabbitmq-0 ]]; then
        kubectl exec --namespace=cluster ${purePod} -- bash -c "$(convertFileToCommands "create_policies.sh")"
        continue
    fi
    #kubectl exec --namespace=cluster ${purePod} -- bash -c "$(convertFileToCommands "configure_node.sh")"
done
