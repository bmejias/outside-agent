#!/bin/bash

grep "$1;" instances | awk --field-separator=';' '{print $2}'
