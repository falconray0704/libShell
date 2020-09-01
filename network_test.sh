#!/bin/bash

# refer to:
# https://www.cnblogs.com/kevingrace/p/11753294.html

#set -o
set -e
#set -x

. ./echo_color.lib
. ./network.lib

usage_func()
{
    echo "Usage:"
    echo './network_test.sh -i eth0'
}


no_args="true"
INTERFACE_NAME="eth0"
while getopts "i:p:" opts
do
    case $opts in
        i)
              # ip list
              INTERFACE_NAME=$OPTARG
              ;;
        :)
            echo "The option -$OPTARG requires an argument."
            exit 1
            ;;
        ?)
            echo "Invalid option: -$OPTARG"
            usage_func
            exit 2
            ;;
        *)    #unknown error?
              echoR "unkonw error."
              usage_func
              exit 1
              ;;
    esac
    no_args="false"
done

[[ "$no_args" == "true" ]] && { usage_func; exit 1; }

IP=$(get_iether_IP4 $INTERFACE_NAME)
echoY ${IP}

MAC=$(get_iether_MAC $INTERFACE_NAME)
echoY ${MAC}


