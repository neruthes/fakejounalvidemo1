#!/bin/bash


export PAHT="$PWD/_utils:$PATH"
export TYPST_BIN_NAME=typst



case $1 in
	*.typ )
		bash _utils/ntypstpro "$1"
		;;
esac
