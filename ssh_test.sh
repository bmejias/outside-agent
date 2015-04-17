#!/bin/sh

(ssh -l $OAUSER -i $OAKEY $1 /bin/true 2> /dev/null && echo "$1 success") || echo "$1 failed"
