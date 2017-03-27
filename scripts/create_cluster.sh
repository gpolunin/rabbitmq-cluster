#!/bin/bash
prefix='pod\/'
commandsToExecute=''
policyCommands=''

function convertFileToCommands() {
    fileName=$1
    commandsToExecute=''
    while read -r line
    do
        noReturnLine=${line//[$'\t\r\n']}
        if [ "$noReturnLine" == "#!/bin/bash" ]; then
            continue
        fi
        if [ "$commandsToExecute" == ""  ]; then
            commandsToExecute="$noReturnLine""; "
            continue
        fi
        commandsToExecute="$commandsToExecute""$noReturnLine""; "
    done < "$fileName"
    echo $commandsToExecute
}

commandsToExecute=$(convertFileToCommands "scripts/join_cluster.sh")
kubectl get pods --namespace=cluster --output=name | while read -r pod
do
    purePod=${pod#$prefix}
    echo ${purePod}
    if [[ $purePod == rabbitmq-node0* ]]; then
        kubectl exec --namespace=cluster ${purePod} -- bash -c "$(convertFileToCommands "scripts/create_policies.sh")"
        continue
    fi
    kubectl exec --namespace=cluster ${purePod} -- bash -c "$commandsToExecute"
done
