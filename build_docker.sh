#!/bin/bash

push=
if [[ $# > 0 ]]; then
    if [[ "$1" == --push ]]; then
        push=yes
    else
        >&2 echo "$0": invalid option -- "'$1'"
        >&2 echo "Usage: bash $0 [--push]"
        exit 1
    fi
fi


version="$(./make-date-version)"
tag=zppz/tiny:${version}

docker build -t ${tag} .

if [ "${push}" ]; then
    echo
    echo pushing "${tag}" to dockerhub ...
    echo
    docker push "${tag}"
fi
