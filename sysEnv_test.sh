#!/bin/bash

set +x

. ./echo_color.lib
. ./sysEnv.lib


IP=$(get_iether_IP4 enp8s0)
MAC=$(get_iether_MAC enp8s0)
echoY ${IP}
echoY ${MAC}

OS_DISTRIBUTOR=$(os_distributor)
echoY "os distributor: ${OS_DISTRIBUTOR}"
OS_DISTRIBUTION_NUMBER=$(os_distribution_number)
echoY "os distribution number: ${OS_DISTRIBUTION_NUMBER}"
OS_DISTRIBUTION_NAME=$(os_distribution_name)
echoY "os distribution name: ${OS_DISTRIBUTION_NAME}"

echoY "os arch name: $(os_arch)"
echoY "docker arch name: $(docker_arch)"

echoY "docker os type: $(docker_os)"

VAL_ARM_VERSION=$(arm_version)
if [ -z ${VAL_ARM_VERSION} ]
then
    echoR "CPU arch is not ARM!!!"
else
    echo "CPU arm version: ${VAL_ARM_VERSION}"
fi

is_root_func
echoG "Runing as root."
