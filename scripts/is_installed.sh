#!/bin/bash

dpkg -s $1 &> /dev/null

if [ $? -eq 0 ]; then
    echo "$1 is installed!"
else
    echo "$1 is NOT installed!"
fi
