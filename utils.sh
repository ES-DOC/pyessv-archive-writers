#!/bin/bash

# Emits information logging message.
log()
{
	declare now=`date +%Y-%m-%dT%H:%M:%S:000000`
	declare tabs=''
	if [ "$1" ]; then
		if [ "$2" ]; then
			for ((i=0; i<$2; i++))
			do
				declare tabs+='\t'
			done
	    	echo -e $now" [INFO] :: ESDOC-PYESSV-WRITER :: "$tabs$1
	    else
	    	echo -e $now" [INFO] :: ESDOC-PYESSV-WRITER :: "$1
	    fi
	else
	    echo -e $now" [INFO] :: ESDOC-PYESSV-WRITER :: "
	fi
}

# Emits error logging message.
log_error()
{
	declare now=`date +%Y-%m-%dT%H:%M:%S:000000`
	declare tabs=''
	if [ "$1" ]; then
		if [ "$2" ]; then
			for ((i=0; i<$2; i++))
			do
				declare tabs+='\t'
			done
	    	echo -e $now" [ERROR] :: ESDOC-PYESSV-WRITER :: "$tabs$1
	    else
	    	echo -e $now" [ERROR] :: ESDOC-PYESSV-WRITER :: "$1
	    fi
	else
	    echo -e $now" [ERROR] :: ESDOC-PYESSV-WRITER :: "
	fi
}

# Wraps pushd command to suppress stdout.
function pushd () {
    command pushd "$@" > /dev/null
}

# Wraps popd command to suppress stdout.
function popd () {
    command popd "$@" > /dev/null
}

