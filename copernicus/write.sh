#!/bin/bash

# Import utils.
source $PYESSV_WRITER_HOME/utils.sh

# Main entry point.
main()
{
	pushd $PYESSV_WRITER_HOME || exit
	pipenv run python "$PYESSV_WRITER_HOME/copernicus/write_cordexp.py"
	popd || exit

	log "COPERNICUS cordexp vocabs written to "${PYESSV_ARCHIVE_HOME:-$(echo $HOME/.esdoc/pyessv-archive)}
}

# Invoke entry point.
main
