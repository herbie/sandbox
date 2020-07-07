#!/usr/bin/env bash

while [ -n "$1" ]; do # while loop starts

    case "$1" in

    --prod) PROD=true ;; # Message for -a option

    -p) PROD=true ;;

    *) echo "Option $1 not recognized" ;; # In case you typed a different option other than a,b,c

    esac

    shift

done

if [ -n "$PROD" ]; then
    FILE="Dockerfile.prod"
else
    FILE="Dockerfile"
fi

docker build -f $FILE .