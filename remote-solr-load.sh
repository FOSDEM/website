#!/bin/bash

tty >/dev/null && {
    echo "ERROR: you must pipe documents into this script" >&2
    exit 1
}

exec ssh search@nanoc.fosdem.org "/home/search/website/solr-load.sh"
