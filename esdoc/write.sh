#!/bin/bash

# Import utils.
source $PYESSV_WRITER_HOME/utils.sh

# Main entry point.
main()
{
	# Reset vocabs.
	rm -rf ~/.esdoc/pyessv-archive/esdoc

	# Write vocabularies.
	pushd $PYESSV_WRITER_HOME || exit
	pipenv run python $PYESSV_WRITER_HOME/esdoc/write_errata.py
	pipenv run python $PYESSV_WRITER_HOME/esdoc/write_cordexp.py
	pipenv run python $PYESSV_WRITER_HOME/esdoc/write_cmip6.py
	popd || exit

	log "ES-DOC vocabs written to "${PYESSV_ARCHIVE_HOME:-$(echo $HOME/.esdoc/pyessv-archive)}
}

# Invoke entry point.
main $1
