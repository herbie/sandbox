#!/usr/bin/env bash

while [ -n "$1" ]; do

    case "$1" in

    --prod) PROD=true ;;

    -p) PROD=true ;;

    *) echo "Option $1 not recognized" ;;

    esac

    shift

done

if [ -n "$PROD" ]; then
    FILE="Dockerfile.prod"
else
    FILE="Dockerfile"
fi

docker build -f $FILE .