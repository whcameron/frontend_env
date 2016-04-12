#!/usr/bin/env bash

SCRIPT_HOME="$( cd "$(dirname "0" )" && pwd )"

# Abstracted commands for the developer
case "$1" in
    up)
        vagrant up
        ;;
    update)
        # update command
        echo "This will run the update command when available."
        ;;
    ssh)
        vagrant ssh
        ;;
    share)
        vagrant share 
        ;;
    destroy)
        vagrant destroy --force
        ;;
    down)
        vagrant halt --force
        ;;
    help)
        cat << HELP_CMDS
Available commands:
    up         : Builds a new virtual machine for the system, runs provisioning if previously non-existent or destroyed.
    share      : Creates a sharable environment, **must be configured through vagrant.
    destroy    : Destroy the vm completely.  Takes more time to bring back up but less system space.
    down       : Halt the vm.  Takes less time to bring back up but more system space.
    help       : Where you are right now.
    ssh        : SSH to the virtual machine running the environment.
HELP_CMDS
        ;;
    *)
        echo "No cmd was specified by the user. Run ./devenv.sh help for more options."
        ;;
esac
