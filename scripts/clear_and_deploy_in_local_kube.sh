#!/bin/bash
kubectl delete secrets,services,ingresses,daemonsets,deployments,replicasets,pods --all --namespace=cluster;
cd ../kube-configs;
find . -name "*.yaml" -print0 | while read -d $'\0' file
do
      kubectl create -f "$file";
done
