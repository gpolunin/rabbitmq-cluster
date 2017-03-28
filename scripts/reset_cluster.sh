#!/bin/bash
prefix='pod\/'
kubectl get pods --namespace=cluster --output=name | while read -r pod
do
    purePod=${pod#$prefix}
    echo ${purePod}
    kubectl exec --namespace=cluster ${purePod} -- bash -c "rabbitmqctl stop_app; rabbitmqctl reset; rabbitmqctl start_app"
done