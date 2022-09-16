#!/bin/bash

# Import utils.
source $PYESSV_WRITER_HOME/utils.sh

# Main entry point.
main()
{
	pushd $PYESSV_WRITER_HOME || exit
	pipenv run python "$PYESSV_WRITER_HOME/copernicus/write_cordexp.py"
	popd || exit

	log "COPERNICUS cordexp vocabs written to "${PYESSV_WRITER_ARCHIVE_HOME}
}

# Invoke entry point.
main
