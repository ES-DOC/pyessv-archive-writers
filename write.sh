#!/bin/bash

source $HOME/Work/ipsl/ipsl.esdoc/pyessv-writers/activate
pyessv-write-all \
    $HOME/Work/ipsl/ipsl.esdoc/other/CMIP6_CVs \
    $HOME/Work/ipsl/ipsl.esdoc/other/esg-config/publisher-configs/ini
