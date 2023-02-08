#!/bin/sh

path=$1
max_iterations=${2:-0}

counter=0
while ! [ -f $path ]; do
        let counter=counter+1

        if [ "$max_iterations" -gt "0" ]; then
                if [ "$counter" -gt "$max_iterations" ]; then
                        echo 'Giving up waiting for '$path' after '$max_iterations' iterations'
                        exit 1
                fi
        fi

        echo $path' is missing.. Waiting...'
        sleep 1
done
