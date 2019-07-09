#! /usr/bin/env bash


[[ "$0" != "$BASH_SOURCE" ]] || (echo "Script must be sourced (e.g., . $(basename $0))")

#readonly PROGDIR=$(dirname $0)
p=$(realpath $(dirname $BASH_SOURCE))
export PATH="$p/rase/src/rase/:$p/rase/scripts:$PATH"

