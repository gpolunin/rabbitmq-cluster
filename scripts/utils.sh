#!/bin/bash

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