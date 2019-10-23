#!/bin/bash

set +x

. ./echo_color.lib
. ./sysEnv.lib


IP=$(get_iether_IP4 enp8s0)
MAC=$(get_iether_MAC enp8s0)
echoY ${IP}
echoY ${MAC}


is_root_func
echoG "Runing as root."
