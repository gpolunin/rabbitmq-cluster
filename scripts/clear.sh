#!/bin/bash
kubectl delete secrets,services,ingresses,persistentvolumeclaims,persistentvolumes,daemonsets,statefulsets,deployments,replicasets,pods --all --namespace=cluster