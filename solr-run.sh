#!/bin/sh
set -e
cd ./search/solr
exec java \
    -Djava.util.logging.config.file="$PWD/logging.properties" \
    -jar ./start.jar
