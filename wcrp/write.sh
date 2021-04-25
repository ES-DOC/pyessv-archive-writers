#!/bin/bash

# Import utils.
source $PYESSV_WRITER_HOME/utils.sh

# Main entry point.
main()
{
	pushd $PYESSV_WRITER_HOME || exit
	pipenv run python $PYESSV_WRITER_HOME/wcrp/cmip6/write.py --source=$1
	popd || exit

	log "WCRP cmip6 vocabs written to "$HOME/.esdoc/pyessv-archive
}

# Invoke entry point.
main $1
