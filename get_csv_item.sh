#!/bin/bash

case "$2" in
    "ip")
        grep "$1;" instances | awk --field-separator=';' '{print $2}'
        ;;
    "url")
        grep "$1;" instances | awk --field-separator=';' '{print $6}'
        ;;
    "username")
        grep "$1;" instances | awk --field-separator=';' '{print $4}'
        ;;
    "password")
        grep "$1;" instances | awk --field-separator=';' '{print $5}'
        ;;
esac
