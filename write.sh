#!/bin/bash

# Import utils.
source $PYESSV_WRITER_HOME/utils.sh

# Main entry point.
main()
{
    local PATH_TO_WCRP_VOCABS=${1}
    local PATH_TO_ESG_INI_FILES=${2}
    local ARCHIVE_HOME=${PYESSV_ARCHIVE_HOME:-$(echo $HOME/.esdoc/pyessv-archive)}

    # Validate inputs.
    if [ ! -d "$PATH_TO_WCRP_VOCABS" ]; then
        log_error "Invalid path to WCRP/CMIP6_CVs repo"
        exit
    fi
    if [ ! -d "$PATH_TO_ESG_INI_FILES" ]; then
        log_error "Invalid path to esg-config ini files"
        exit
    fi
    if [ ! -d "$PATH_TO_WCRP_VOCABS" ]; then
        log_error "Invalid path to WCRP/CMIP6_CVs repo"
        exit
    fi

	# Delete current.
    rm -rf $ARCHIVE_HOME/copernicus
    rm -rf $ARCHIVE_HOME/ecmwf
    rm -rf $ARCHIVE_HOME/esdoc
    rm -rf $ARCHIVE_HOME/wcrp

	# Write new.
    source $PYESSV_WRITER_HOME/wcrp/write.sh $PATH_TO_WCRP_VOCABS
    source $PYESSV_WRITER_HOME/copernicus/write.sh 
    source $PYESSV_WRITER_HOME/esgf/write.sh $PATH_TO_ESG_INI_FILES
    source $PYESSV_WRITER_HOME/esdoc/write.sh

	log "ES-DOC vocabs written to "$ARCHIVE_HOME
}

# Invoke entry point.
main $1 $2
