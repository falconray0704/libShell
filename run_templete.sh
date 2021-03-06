#!/bin/bash

set -o nounset
set -o errexit
# trace each command execute, same as `bash -v myscripts.sh`
#set -o verbose
# trace each command execute with attachment infomations, same as `bash -x myscripts.sh`
#set -o xtrace


. ./echo_color.lib
. ./utils.lib

SUPPORTED_CMD="get,build"
SUPPORTED_TARGETS="source,doc"

EXEC_CMD=""
EXEC_ITEMS_LIST=""

get_source()
{
    echoY "Getting source..."
}

build_source()
{
    echoY "Building source..."
}

get_doc()
{
    echoY "Getting doc..."
}

build_doc()
{
    echoY "Building doc..."
}



get_items_func()
{
    local exec_cmd=$1
    local exec_items_list=$2

    exec_items_iterator ${exec_cmd} ${exec_items_list} 
}

build_items_func()
{
    local exec_cmd=$1
    local exec_items_list=$2

    exec_items_iterator ${exec_cmd} ${exec_items_list} 
}

usage_func()
{

    echoY "Usage:"
    echoY './run_templete.sh -c <cmd> -l "<item list>"'
    echoY "eg:\n./run_templete.sh -c get -l \"source,doc\""
    echoY "eg:\n./run_templete.sh -c build -l \"source,doc\""

    echoC "Supported cmd:"
    echo "${SUPPORTED_CMD}"
    echoC "Supported items:"
    echo "${SUPPORTED_TARGETS}"
    
}

no_args="true"
while getopts "c:l:" opts
do
    case $opts in
        c)
              # cmd
              EXEC_CMD=$OPTARG
              ;;
        l)
              # items list
              EXEC_ITEMS_LIST=$OPTARG
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
#[ $# -lt 1 ] && echoR "Invalid args count:$# " && usage_func && exit 1


case ${EXEC_CMD} in
    "get")
        get_items_func ${EXEC_CMD} ${EXEC_ITEMS_LIST}
        ;;
    "build")
        build_items_func ${EXEC_CMD} ${EXEC_ITEMS_LIST}
        ;;
    "*")
        echoR "Unsupport cmd:${EXEC_CMD}"
        ;;
esac



