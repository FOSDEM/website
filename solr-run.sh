#!/bin/sh
set -e
cd ./search/solr
exec java \
    -Djetty.host=127.0.0.1 \
    -Djetty.port=8983 \
    -Djava.util.logging.config.file="$PWD/logging.properties" \
    -jar ./start.jar
